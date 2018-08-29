package scheduled;

import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.io.FeedException;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;
import entities.Categoria;
import entities.Pagina;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import entities.Tag;
import java.io.IOException;
import org.apache.commons.text.similarity.LevenshteinDistance;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import services.CategoriaService;
import services.NotificationService;
import services.PaginaService;
import services.TagService;

/**
 *
 * @author rlimone
 */
@Component
public class PageReader {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private PaginaService paginaService;

    @Autowired
    private CategoriaService categoriaService;

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private TagService tagService;

    @Scheduled(fixedDelay = 40000)
    public void lookForUpdates() {
        try {
            /* Se utiliza para recorrer las existentes, url base de categorización*/
            List<Pagina> paginas = paginaService.findPaginasWithTag();
            List<Pagina> paginasForNotifications = new ArrayList<>();
            List<Tag> tags = tagService.findWithPaginas();
            /* Lista de las categorias del sistema*/
            List<Categoria> catList = categoriaService.getCategorias();

            for (Pagina pagina : new ArrayList<>(paginas)) {
                if (!pagina.getUrl().contains("rss") && !pagina.getUrl().contains("feed")) {
                    continue;
                }
                try {
                    XmlReader reader = new XmlReader(new URL(pagina.getUrl()));

                    SyndFeed feed = new SyndFeedInput().build(reader);

                    for (SyndEntry entry : feed.getEntries()) {
                        Pagina encontrado = pageExists(entry.getLink(), paginas);

                        if (encontrado == null) {
                            System.out.println("REGISTRO DE INSERT");
                            Date date = getLastUpdate(entry);

                            Pagina p = new Pagina();
                            p.setSubscripcionSet(null);

                            System.out.println("Link: " + entry.getLink());
                            p.setUrlUltimo(entry.getLink());

                            System.out.println("Título: " + entry.getTitle());
                            p.setTituloPagina(entry.getTitle());

                            if (entry.getDescription().getValue().contains("img")) {
                                System.out.println("Imágen: " + entry.getDescription().getValue());
                                p.setImagen(entry.getDescription().getValue());

                            } else {
                                System.out.println("Descripción: " + entry.getDescription().getValue());
                                p.setGlosaPagina(entry.getDescription().getValue());
                            }

                            /* Se deberia poder utilizar una expresion para obtener el tag del link entry.getLink() pagina.setTagSet(tagSet); */
                            String tagText = extractTag(entry.getTitle());

                            Tag tag = tagExists(tagText, tags);

                            if (tag == null) {
                                tag = new Tag();
                                tag.setGlosaTag(tagText);
                                tag = tagService.save(tag);
                                tags.add(tag);
                                tag.setPaginas(new ArrayList<>());
                            }

                            p.setTagSet(new HashSet<>());
                            p.getTagSet().add(tag);

                            System.out.println("Fecha nueva: " + date);
                            p.setDateNew(date);

                            p.setUrl(pagina.getUrl());

                            Categoria c = new Categoria();
                            for (Categoria categoria : catList) {
                                StringBuilder regex = new StringBuilder();
                                if (categoria.getGlosaCategoria().contains(" ")) {
                                    regex = regex.append("(?:");
                                    for (String token : categoria.getAliasCategoria().split(" ")) {
                                        regex.append(token).append('_');
                                    }
                                    regex.setLength(regex.length() - 1);
                                    regex = regex.append(")");
                                } else {
                                    regex = regex.append("(?:").append(categoria.getAliasCategoria()).append(")");
                                }
                                //System.out.println(regex.toString().toLowerCase());
                                Pattern pattern = Pattern.compile(regex.toString().toLowerCase());
                                Matcher matcher = pattern.matcher(entry.getLink());
                                if (matcher.find()) {
                                    c.setIdCategorias(categoria.getIdCategorias());
                                    p.setIdCategorias(c);
                                }
                            }

                            if (p.getIdCategorias() == null) {
                                c.setIdCategorias(pagina.getIdCategorias().getIdCategorias());
                                p.setIdCategorias(c);
                            }

                            p = paginaService.insertPagina(p);
                            p.setIdCategorias(paginaService.findCategoria(p));
                            p.setTagSet(new HashSet<>(paginaService.findTag(p)));

                            if (tag.getIdTags() == null) {
                                tags = tagService.findWithPaginas();
                            }

                            paginas.add(p);
                            paginasForNotifications.add(p);

                            System.out.println("***********************************");
                        } else if (!entry.getLink().equals(encontrado.getUrlUltimo())) {
                            Date date = getLastUpdate(entry);
                            if (date.after(encontrado.getDateNew())) {
                                System.out.println("REGISTRO DE UPDATE");
                                System.out.println("Link: " + entry.getLink());
                                encontrado.setUrlUltimo(entry.getLink());

                                System.out.println("Título: " + entry.getTitle());
                                encontrado.setTituloPagina(entry.getTitle());

                                if (entry.getDescription().getValue().contains("img")) {
                                    System.out.println("Imágen: " + entry.getDescription().getValue());
                                    encontrado.setImagen(entry.getDescription().getValue());

                                } else {
                                    System.out.println("Descripción: " + entry.getDescription().getValue());
                                    encontrado.setGlosaPagina(entry.getDescription().getValue());
                                }

                                /* Se deberia poder utilizar una expresion para obtener el tag del link entry.getLink() pagina.setTagSet(tagSet); */
                                System.out.println("Fecha nueva: " + date);
                                System.out.println("Fecha anterior: " + encontrado.getDateNew());
                                encontrado.setDateLast(encontrado.getDateNew());
                                encontrado.setDateNew(date);

                                System.out.println("***********************************");
                                encontrado = paginaService.updatePagina(encontrado);
                                encontrado.setIdCategorias(paginaService.findCategoria(encontrado));
                                encontrado.setTagSet(new HashSet<>(paginaService.findTag(encontrado)));
                                paginasForNotifications.add(encontrado);
                            }
                        }
                    }
                } catch (FeedException | IOException | IllegalArgumentException e) {
                    e.printStackTrace();
                }
                notificationService.lookForNotifications(paginasForNotifications);
                paginasForNotifications.clear();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private String extractTag(String title) {
        title = title.replaceAll("([\\.a-zA-Z áéíóúÁÉÍÓÚ'-]+).*", "$1").trim().replaceAll("[ ]+", "_");
        return title.replaceAll("(.*?)(_-|_Chapter)$", "$1");
    }

    private Pagina pageExists(String url, List<Pagina> paginas) {
        Pagina encontrado = null;
        for (Pagina pagina : paginas) {

            if (pagina.getUrlUltimo().toLowerCase().equals(url.toLowerCase())) {
                encontrado = pagina;
                break;
            } else if (pagina.getIdCategorias().getIdCategorias() != 5) {
                LevenshteinDistance algoritmoDistancia = new LevenshteinDistance();
                double distancia = algoritmoDistancia.apply(pagina.getUrlUltimo().toLowerCase(), url.toLowerCase());
                if (distancia / pagina.getUrlUltimo().length() <= 0.15) {
                    encontrado = pagina;
                    break;
                }
            }
        }
        return encontrado;
    }

    private Tag tagExists(String glosa, List<Tag> tags) {
        Tag encontrado = null;
        for (Tag tag : tags) {

            if (tag.getGlosaTag().equalsIgnoreCase(glosa)) {
                encontrado = tag;
                break;
            } else {
                LevenshteinDistance algoritmoDistancia = new LevenshteinDistance();
                double distancia = algoritmoDistancia.apply(tag.getGlosaTag().toLowerCase(), glosa.toLowerCase());
                if (distancia / tag.getGlosaTag().length() <= 0.2) {
                    encontrado = tag;
                    break;
                }
            }
        }
        return encontrado;
    }

    private Date getLastUpdate(SyndEntry entry) {
        Date date;
        if (entry.getPublishedDate() != null) {
            date = entry.getPublishedDate();
        } else if (entry.getUpdatedDate() != null) {
            date = entry.getUpdatedDate();
        } else {
            date = new Date();
        }
        return date;
    }
}

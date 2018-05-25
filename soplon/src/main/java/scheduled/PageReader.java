package scheduled;

import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;
import entities.Categoria;
import entities.Pagina;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.text.similarity.LevenshteinDistance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import services.CategoriaService;
import services.NotificationService;
import services.PaginaService;

/**
 *
 * @author rlimone
 */
@Component
public class PageReader {

    @Autowired
    private PaginaService paginaService;

    @Autowired
    private CategoriaService categoriaService;

    @Autowired
    private NotificationService notificationService;

    @Scheduled(fixedDelay = 40000)
    public void lookForUpdates() {
        try {
            /* Se utiliza para recorrer las existentes, url base de categorización*/
            List<Pagina> paginaList = paginaService.findPaginasWithTag();
            /* Se utiliza para array de nuevos sitios*/
            List<Pagina> paginaInsertList = new ArrayList<>();
            /* Se utiliza para array de actualizacion de sitios*/
            List<Pagina> paginaUpdateList = new ArrayList<>();
            /* Lista de las categorias del sistema*/
            List<Categoria> catList = categoriaService.getCategorias();

            for (Pagina pagina : paginaList) {
                if (!pagina.getUrl().contains("rss") && !pagina.getUrl().contains("feed")) {
                    continue;
                }
                try (XmlReader reader = new XmlReader(new URL(pagina.getUrl()))) {
                    SyndFeed feed = new SyndFeedInput().build(reader);

                    for (SyndEntry entry : feed.getEntries()) {
                        Pagina encontradoBD = pageExists(entry.getLink(), paginaList);
                        Pagina encontradoMemoria = pageExists(entry.getLink(), paginaInsertList);

                        if (encontradoBD == null && encontradoMemoria == null) {

                            Date date;
                            if (entry.getPublishedDate() != null) {
                                date = entry.getPublishedDate();
                            } else if (entry.getUpdatedDate() != null) {
                                date = entry.getUpdatedDate();
                            } else {
                                date = new Date();
                            }

                            Pagina p = new Pagina();

                            System.out.println(entry.getLink());

                            p.setUrlUltimo(entry.getLink());

                            System.out.println(entry.getTitle());
                            p.setTituloPagina(entry.getTitle());

                            if (entry.getDescription().getValue().contains("img")) {
                                System.out.println(entry.getDescription().getValue());
                                p.setImagen(entry.getDescription().getValue());

                            } else {
                                System.out.println(entry.getDescription().getValue());
                                p.setGlosaPagina(entry.getDescription().getValue());
                            }

                            /* Se deberia poder utilizar una expresion para obtener el tag del link entry.getLink() pagina.setTagSet(tagSet); */
                            System.out.println(date);
                            p.setDateNew(date);

                            p.setUrl(pagina.getUrl());

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
                                    p.setIdCategorias(categoria);
                                }
                            }

                            if (p.getIdCategorias() == null) {
                                p.setIdCategorias(pagina.getIdCategorias());
                            }
                            paginaInsertList.add(p);

                            System.out.println("***********************************");
                        } else {
                            Date date;
                            if (entry.getPublishedDate() != null) {
                                date = entry.getPublishedDate();
                            } else if (entry.getUpdatedDate() != null) {
                                date = entry.getUpdatedDate();
                            } else {
                                date = new Date();
                            }
                            Pagina paginaToUpdate = encontradoBD == null ? encontradoMemoria : encontradoBD;
                            if (date.after(paginaToUpdate.getDateNew())) {
                                System.out.println(entry.getLink());
                                paginaToUpdate.setUrlUltimo(entry.getLink());

                                System.out.println(entry.getTitle());
                                paginaToUpdate.setTituloPagina(entry.getTitle());

                                System.out.println(entry.getDescription().getValue());
                                paginaToUpdate.setGlosaPagina(entry.getDescription().getValue());

                                /* Se deberia poder utilizar una expresion para obtener el tag del link entry.getLink() paginaToUpdate.setTagSet(tagSet); */
                                System.out.println(date);
                                paginaToUpdate.setDateLast(paginaToUpdate.getDateNew());
                                paginaToUpdate.setDateNew(date);

                                if (encontradoBD != null) {
                                    paginaUpdateList.add(paginaToUpdate);
                                }

                                System.out.println("***********************************");
                            }
                        }
                    }
                }
            }
            paginaService.insertPaginas(paginaInsertList);
            paginaService.updatePaginas(paginaUpdateList);
            notificationService.lookForNotifications(paginaUpdateList);
        } catch (Exception e) {
            e.printStackTrace();
        }
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
                if (distancia / pagina.getUrlUltimo().length() <= 0.2) {
                    encontrado = pagina;
                    break;
                }
            }
        }
        return encontrado;
    }
}

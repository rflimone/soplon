package api;

import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;
import entities.Categoria;
import entities.Pagina;
import org.apache.commons.text.similarity.LevenshteinDistance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import services.CategoriaService;
import services.PaginaService;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Configuration
@EnableScheduling
@SpringBootApplication
public class Application {

    @Autowired
    public PaginaService paginaService;

    @Autowired
    public CategoriaService catService;

//    @Scheduled(fixedDelay = 10000)
//    public void crawler() throws IOException {
//
//        List<Pagina> paginaList = paginaService.findPaginasWithTag();
//
//        for (Pagina pagina : paginaList) {
//            String url = pagina.getUrl();
//            print("Consiguiendo urls de %s...", url);
//
//            Document doc = Jsoup.connect(url).parser(Parser.xmlParser()).get();
//            Elements links = doc.select("a[href]");
//
//            print("\nLinks: (%d)", links.size());
//            for (Element link : links) {
//                for (Tag tag : pagina.getTagSet()) {
//                    if (link.absUrl("href").toLowerCase().contains(tag.getGlosaTag().toLowerCase())) {
//                        print(" * a: <%s>  (%s)", link.attr("abs:href"), trim(link.text(), 35));
//                        pagina.setUrlUltimo(link.attr("abs:href"));
//                        pagina.setDateLast(new Date());
//
//                    }
//                }
//            }
//        }
//
//        paginaService.updatePaginas(paginaList);
//    }
//
//    private static void print(String msg, Object... args) {
//        System.out.println(String.format(msg, args));
//    }
//
//    private static String trim(String s, int width) {
//        if (s.length() > width) {
//            return s.substring(0, width - 1) + ".";
//        } else {
//            return s;
//        }
//    }

    public Pagina existePagina(String currentUrl, List<Pagina> paginas) {
        Pagina encontrado = null;
        for (Pagina pagina : paginas) {

            if (pagina.getUrlUltimo().toLowerCase().equals(currentUrl.toLowerCase())) {
                encontrado = pagina;
                break;
            } else {
                LevenshteinDistance algoritmoDistancia = new LevenshteinDistance();
                Integer distancia = algoritmoDistancia.apply(pagina.getUrlUltimo().toLowerCase(), currentUrl.toLowerCase());
                if (distancia/pagina.getUrlUltimo().length() > 0.8) {
                    encontrado = pagina;
                    break;
                }
            }
        }
        return encontrado;
    }

    /**
     *
     * Método de insert será con un input de categoría humana, esto se realizará
     * porque existen sitios que pueden ser de multiples categorías y el modelo
     * considera solo 1. Además, esto evitaría problemas legales, ya que en caso
     * de abrir al "público" el ingreso de nuevos sitios, se evitan sitios
     * maliciosos o ilegales.
     *
     * Por ahora, funciona sólo para páginas de 1 sola categoría, ya que hereda
     * la categoría del sitio donde busca. *
     */
    @Scheduled(fixedDelay = 10000)
    public void rssReader() throws IOException {

        try {
            /* Se utiliza para recorrer las existentes, url base de categorización*/
            List<Pagina> paginaList = paginaService.findPaginasWithTag();
            /* Se utiliza para array de nuevos sitios*/
            List<Pagina> paginaInsertList = new ArrayList<>();
            /* Se utiliza para array de actualizacion de sitios*/
            List<Pagina> paginaUpdateList = new ArrayList<>();
            /* Lista de las categorias del sistema*/
            List<Categoria> catList = catService.getCategorias();

            for (Pagina pagina : paginaList) {
                if (!pagina.getUrl().contains("rss") && !pagina.getUrl().contains("feed")) {
                    continue;
                }
                try (XmlReader reader = new XmlReader(new URL(pagina.getUrl()))) {
                    SyndFeed feed = new SyndFeedInput().build(reader);

                    for (SyndEntry entry : feed.getEntries()) {
                        Pagina encontradoBD = existePagina(entry.getLink(), paginaList);
                        Pagina encontradoMemoria = existePagina(entry.getLink(), paginaInsertList);

                        if (encontradoBD == null && encontradoMemoria == null) {
                            
                            Date date = entry.getPublishedDate() != null ? entry.getPublishedDate() : entry.getUpdatedDate();
                            
                            Pagina p = new Pagina();

                            System.out.println(entry.getLink());

                            p.setUrlUltimo(entry.getLink());

                            System.out.println(entry.getTitle());
                            p.setTituloPagina(entry.getTitle());

                            System.out.println(entry.getDescription().getValue());
                            p.setGlosaPagina(entry.getDescription().getValue());

                            /* Se deberia poder utilizar una expresion para obtener el tag del link entry.getLink() pagina.setTagSet(tagSet); */
                            System.out.println(date);
                            p.setDateNew(date);

                            p.setUrl(pagina.getUrl());
                            
                            for (Categoria categoria : catList) {
                                StringBuilder regex = new StringBuilder();
                                if(categoria.getGlosaCategoria().contains(" ")) {
                                    regex = regex.append("(?:");
                                    for (String token : categoria.getAliasCategoria().split(" ")) {
                                        regex.append(token).append('_');
                                    }
                                    regex.setLength(regex.length()-1);
                                    regex = regex.append(")");
                                } else {
                                    regex = regex.append("(?:").append(categoria.getAliasCategoria()).append(")");
                                }
                                System.out.println(regex.toString().toLowerCase());
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
                            Date date = entry.getPublishedDate() != null ? entry.getPublishedDate() : entry.getUpdatedDate();
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

                                System.out.println("***********************************");
                            }
                        }
                    }
                }
            }
            paginaService.insertPaginas(paginaInsertList);
            paginaService.updatePaginas(paginaUpdateList);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}

package api;

import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;
import entities.Pagina;
import entities.Tag;
import java.io.IOException;
import java.net.URL;
import java.util.Date;
import java.util.List;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.parser.Parser;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import services.*;

@Configuration
@EnableScheduling
@SpringBootApplication
public class Application {

    @Autowired
    public PaginaService paginaService;

//    @Scheduled(fixedDelay = 10000)
//    public void crawler() throws IOException {
//
//        /*Modificar por entityGraph o JPQL para obtener paginas con tag o categorías*/
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


    @Scheduled(fixedDelay = 10000)
    public void rssReaderUpdater() throws IOException {

        try {
            List<Pagina> paginaList = paginaService.findPaginasWithTag();

            for (Pagina pagina : paginaList) {
                String url = pagina.getUrl();

                if (pagina.getUrl().contains("rss")) {
                    try (XmlReader reader = new XmlReader(new URL(url))) {

                        SyndFeed feed = new SyndFeedInput().build(reader);

                        System.out.println(feed.getTitle());
                        System.out.println("***********************************");
                        for (SyndEntry entry : feed.getEntries()) {

                            for (Tag tag : pagina.getTagSet()) {
                                if (entry.getLink().toLowerCase().contains(tag.getGlosaTag().toLowerCase())) {

                                    if (entry.getPublishedDate().after(pagina.getDateLast())) {
                                        System.out.println(entry.getLink());
                                        pagina.setUrlUltimo(entry.getLink());

                                        System.out.println(entry.getTitle());
                                        pagina.setTituloPagina(entry.getTitle());

                                        System.out.println(entry.getDescription().getValue());
                                        pagina.setGlosaPagina(entry.getDescription().getValue());

                                        /* Se deberia poder utilizar una expresion para obtener el tag del link entry.getLink() pagina.setTagSet(tagSet); */
    /* Se debe modificar el set de fecha, ya que el formato no es el adecuado ("Mon May 21 05:19:41 CLT 2018" to date)*/
                                        System.out.println(entry.getPublishedDate());
                                        pagina.setDateNew(entry.getPublishedDate());

                                        System.out.println("***********************************");
                                    }

                                }
                            }

                        }
                        System.out.println("Done");
                    }
                }

            }
            paginaService.updatePaginas(paginaList);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
//    
//    public void rssReaderInsert() throws IOException {
//
//        try {
//            List<Pagina> paginaList = paginaService.findPaginasWithTag();
//
//            for (Pagina pagina : paginaList) {
//                String url = pagina.getUrl();
//
//                if (pagina.getUrl().contains("rss")) {
//                    try (XmlReader reader = new XmlReader(new URL(url))) {
//
//                        SyndFeed feed = new SyndFeedInput().build(reader);
//
//                        System.out.println(feed.getTitle());
//                        System.out.println("***********************************");
//                        for (SyndEntry entry : feed.getEntries()) {
//
//                            for (Tag tag : pagina.getTagSet()) {
//                                if (!entry.getLink().toLowerCase().contains(tag.getGlosaTag().toLowerCase())) {
//
//                                    if (entry.getPublishedDate().after(pagina.getDateLast())) {
//                                        System.out.println(entry.getLink());
//                                        pagina.setUrlUltimo(entry.getLink());
//
//                                        System.out.println(entry.getTitle());
//                                        pagina.setTituloPagina(entry.getTitle());
//
//                                        System.out.println(entry.getDescription().getValue());
//                                        pagina.setGlosaPagina(entry.getDescription().getValue());
//
//                                        /* Se deberia poder utilizar una expresion para obtener el tag del link entry.getLink() pagina.setTagSet(tagSet); */
//                                        
//                                        System.out.println(entry.getPublishedDate());
//                                        pagina.setDateNew(entry.getPublishedDate());
//
//                                        System.out.println("***********************************");
//                                    }
//
//                                }
//                            }
//
//                        }
//                        System.out.println("Done");
//                    }
//                }
//
//            }
//            paginaService.insertPaginas(paginaList);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//    }
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}

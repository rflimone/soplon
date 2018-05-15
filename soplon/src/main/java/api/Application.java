package api;

import ch.qos.logback.core.CoreConstants;
import entities.Pagina;
import java.io.IOException;
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
import services.PaginaService;

@Configuration
@EnableScheduling
@SpringBootApplication
public class Application {

    @Autowired
    public PaginaService paginaService;

    @Scheduled(fixedDelay = 2000)
    public void crawler() throws IOException {

        List<Pagina> paginaList = paginaService.getPaginas();

        for (Pagina pagina : paginaList) {
            String url = pagina.getUrl();
            print("Consiguiendo urls de %s...", url);

            Document doc = Jsoup.connect(url).parser(Parser.xmlParser()).get();
            Elements links = doc.select("a[href]");

            /*
            Elements media = doc.select("[src]");
            Elements imports = doc.select("link[href]");
            
            print("\nMedia: (%d)", media.size());
            for (Element src : media) {
                if (src.tagName().equals("img")) {
                    print(" * %s: <%s> %sx%s (%s)",
                            src.tagName(), src.attr("abs:src"), src.attr("width"), src.attr("height"),
                            trim(src.attr("alt"), 20));
                } else {
                    print(" * %s: <%s>", src.tagName(), src.attr("abs:src"));
                }
            }
            
            print("\nImports: (%d)", imports.size());
            for (Element link : imports) {
                print(" * %s <%s> (%s)", link.tagName(), link.attr("abs:href"), link.attr("rel"));
            }
             */
            
            print("\nLinks: (%d)", links.size());
            for (Element link : links) {
                if(link.absUrl("href").toLowerCase().contains(url.toLowerCase()))
                print(" * a: <%s>  (%s)", link.attr("abs:href"), trim(link.text(), 35));
            }

        }

    }

    private static void print(String msg, Object... args) {
        System.out.println(String.format(msg, args));
    }

    private static String trim(String s, int width) {
        if (s.length() > width) {
            return s.substring(0, width - 1) + ".";
        } else {
            return s;
        }
    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}

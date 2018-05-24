package scheduled;

import entities.Pagina;
import entities.Tag;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import org.jsoup.Jsoup;
import org.jsoup.parser.Parser;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import services.CategoriaService;
import services.PaginaService;

@Component
public class Crawler {

    @Autowired
    public PaginaService paginaService;

    @Autowired
    public CategoriaService catService;

    //@Scheduled(fixedDelay = 10000)
    public void crawler() throws IOException {

        List<Pagina> paginaList = paginaService.findPaginasWithTag();

        for (Pagina pagina : paginaList) {
            String url = pagina.getUrl();
            print("Consiguiendo urls de %s...", url);

            org.jsoup.nodes.Document doc = Jsoup.connect(url).parser(Parser.xmlParser()).get();
            Elements links = doc.select("a[href]");

            print("\nLinks: (%d)", links.size());
            for (org.jsoup.nodes.Element link : links) {
                for (Tag tag : pagina.getTagSet()) {
                    if (link.absUrl("href").toLowerCase().contains(tag.getGlosaTag().toLowerCase())) {
                        print(" * a: <%s>  (%s)", link.attr("abs:href"), trim(link.text(), 35));
                        pagina.setUrlUltimo(link.attr("abs:href"));
                        pagina.setDateLast(new Date());

                    }
                }
            }
        }

        paginaService.updatePaginas(paginaList);
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
}

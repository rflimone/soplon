package Soplon;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;

/**
 * A simple example, used on the jsoup website.
 */
public class Soplon {
    public static void main(String[] args) throws IOException {
        Document doc = Jsoup.connect("https://readms.net/").get();
        log(doc.title());

        Elements links = doc.select("a[href]");
        for (Element l : links) {
            log("%s\n\t%s", l.attr("title"), l.absUrl("href"));
        }
    }

    private static void log(String msg, String... vals) {
        System.out.println(String.format(msg, vals));
    }
}
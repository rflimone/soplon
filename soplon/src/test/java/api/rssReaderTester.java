package api;



import java.net.URL;
import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;

public class rssReaderTester {

    public static void main(String[] args) {

        try {
            String url = "http://www.crunchyroll.com/rss/anime";

            try (XmlReader reader = new XmlReader(new URL(url))) {
                SyndFeed feed = new SyndFeedInput().build(reader);
                System.out.println(feed.getTitle());
                System.out.println("***********************************");
                for (SyndEntry entry : feed.getEntries()) {
//                    System.out.println(feed);
//                    System.out.println(entry);
                    
                    System.out.println(entry.getLink());

                    System.out.println(entry.getTitle());

                    System.out.println(entry.getDescription().getValue());

                    System.out.println(entry.getPublishedDate());
                    System.out.println("***********************************");

                }
                System.out.println("Done");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}

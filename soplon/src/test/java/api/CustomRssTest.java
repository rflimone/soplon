package api;

import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.io.FeedException;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.IOException;
import java.net.URL;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class CustomRssTest {

    @Test
    public void jaiminisboxTest() {
        String[] urls = {
                "https://jaiminisbox.com/reader/feeds/rss",
                "https://readms.net/rss"
        };
        for (String url : urls) {
            try (XmlReader reader = new XmlReader(new URL(url))) {
                SyndFeed feed = new SyndFeedInput().build(reader);
                for (SyndEntry entry : feed.getEntries()) {
                    System.out.println(String.format("Link: %s, pubDate: %s", entry.getLink(), entry.getPublishedDate()));
                }

            } catch (IOException | FeedException e) {
                e.printStackTrace();
            }
        }
    }
}

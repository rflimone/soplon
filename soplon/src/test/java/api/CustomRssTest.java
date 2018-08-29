package api;

import dtos.MainRSS;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.client.RestTemplate;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class CustomRssTest {

    @Test
    public void jaiminisboxTest() {
        String url = "https://jaiminisbox.com/reader/feeds/rss";
        //String url = "https://readms.net/rss";
        RestTemplate template = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.set("user-agent", "PostmanRuntime/7.2.0");

        HttpEntity<String> request = new HttpEntity<>(headers);
        ResponseEntity<MainRSS> exchange = template.exchange(url, HttpMethod.GET, request, MainRSS.class);
        Assert.assertTrue(exchange.getBody().getChannel() != null && exchange.getBody().getChannel().getItems() != null);
    }
}

package dtos;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;

import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.ArrayList;
import java.util.List;

@XmlRootElement
public class ChannelRSS {
    private String title;
    private String link;
    private String description;

    @JacksonXmlElementWrapper(localName = "item")
    private List<ItemRSS> items;

    public ChannelRSS() {
        items = new ArrayList<>();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<ItemRSS> getItems() {
        return items;
    }

    public void setItems(List<ItemRSS> items) {
        this.items = items;
    }
}

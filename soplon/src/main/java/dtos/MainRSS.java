package dtos;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class MainRSS {
    private ChannelRSS channel;

    public ChannelRSS getChannel() {
        return channel;
    }

    public void setChannel(ChannelRSS channel) {
        this.channel = channel;
    }
}

package api;

import java.net.MalformedURLException;
import java.net.URL;
import java.io.*;

public class RssReader {

    public static void main(String[] args) {
        /* System.out.println(readRSSFeed("http://rss.cnn.com/rss/edition.rss")); */
        System.out.println(readRSSFeed("https://readms.net/rss"));
    }

    public static String readRSSFeed(String urlAddress) {
        try {
            URL rssUrl = new URL(urlAddress);
            BufferedReader in = new BufferedReader(new InputStreamReader(rssUrl.openStream()));
            String sourceCode = "";
            String line;
            while ((line = in.readLine()) != null) {
                int titleEndIndex = 0;
                int titleStartIndex = 0;
                while (titleStartIndex >= 0) {
                    titleStartIndex = line.indexOf("<title>", titleEndIndex);
                    if (titleStartIndex >= 0) {
                        titleEndIndex = line.indexOf("</title>", titleStartIndex);
                        sourceCode += line.substring(titleStartIndex + "<title>".length(), titleEndIndex) + "\n";
                    }
                }
            }
            in.close();
            return sourceCode;
        } catch (MalformedURLException ue) {
            System.out.println("Malformed URL");
        } catch (IOException ioe) {
            System.out.println("Something went wrong reading the contents: "+ioe);
        }
        return null;
    }
}

package controller;

import entities.Ancla;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import services.Comunes;
import services.Hasher;

public class Web {
    private Ancla ancla;
    private String hashWeb;
    private int parseAnclaStatus;
    private int emailParseStatus;
  
    private Document document;

    public String getHashWeb() {
        return hashWeb;
    }

    public int getParseAnclaStatus() {
        return parseAnclaStatus;
    }

    public int getEmailParseStatus() {
        return emailParseStatus;
    }

    public Document getDocument() {
        return document;
    }
    
    /* Constructor general de crawler*/
    public Web(Ancla ancla) throws Exception {
        this.ancla = ancla;
        this.hashWeb = Hasher.toSha256(ancla.getHashAncla() + Comunes.getTimeStamp().toString());
        this.parseAnclaStatus = 0;
        this.emailParseStatus = 0;
    }
    
    /* JSoup obtiene el html*/
    public void cargaDocumentoDesdeWeb(){
        try{
            document = Jsoup.connect(ancla.getUrlAncla()).get();

        } catch (IOException ex){
            Logger.getLogger(Web.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
    
    
}

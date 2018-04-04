package entities;

import services.Comunes;
import services.Hasher;
import java.sql.Timestamp;

public class Ancla {
    private Dominios dominios;
    private String hashAncla;
    private String urlAncla;
    private int scanStatus;
    private boolean activado;
    private Timestamp modificado;
    private Timestamp creado;

    public Dominios getDominios() {
        return dominios;
    }

    public String getHashAncla() {
        return hashAncla;
    }

    public String getUrlAncla() {
        return urlAncla;
    }

    public int getScanStatus() {
        return scanStatus;
    }

    public boolean isActivado() {
        return activado;
    }

    public Timestamp getModificado() {
        return modificado;
    }

    public Timestamp getCreado() {
        return creado;
    }

    public Ancla(Dominios dominios, String urlAncla) throws Exception {
        this.dominios = dominios;
        this.hashAncla = Hasher.toSha256(urlAncla);
        this.scanStatus = 0;
        this.activado = true;
        this.modificado = Comunes.getTimeStamp();
        this.creado = Comunes.getTimeStamp();        
        this.urlAncla = urlAncla;
    }
        
    
    public Ancla(Dominios dominios, String hashAncla, String urlAncla) {
        this.dominios = dominios;
        this.hashAncla = hashAncla;
        this.urlAncla = urlAncla;
    }
    
    /* Utilizado para base de datos */
    public Ancla(Dominios dominios, String hashAncla, String urlAncla, int scanStatus, boolean activado, Timestamp modificado, Timestamp creado) {
        this.dominios = dominios;
        this.hashAncla = hashAncla;
        this.urlAncla = urlAncla;
        this.scanStatus = scanStatus;
        this.activado = activado;
        this.modificado = modificado;
        this.creado = creado;
    }
    
     
}

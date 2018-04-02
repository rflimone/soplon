package BAL;

import java.sql.Timestamp;

public class Dominios {
    private String hashDominios;
    private String urlDominios;
    private boolean activado;
    private Timestamp modificado;
    private Timestamp creado;

    public String getHashDominios() {
        return hashDominios;
    }

    public String getUrlDominios() {
        return urlDominios;
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

    public Dominios(String hashDominios, String urlDominios) {
        this.hashDominios = hashDominios;
        this.urlDominios = urlDominios;
    }
    
    /*Se deben utilizar cuando se completa información con la base de datos*/
    public Dominios(String hashDominios, String urlDominios, boolean activado, Timestamp modificado, Timestamp creado) {
        this.hashDominios = hashDominios;
        this.urlDominios = urlDominios;
        this.activado = activado;
        this.modificado = modificado;
        this.creado = creado;
    }
    
    
    
}

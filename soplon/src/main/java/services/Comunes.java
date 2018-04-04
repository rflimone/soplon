package services;

import java.sql.Timestamp;

public class Comunes {

    public static Timestamp getTimeStamp() {
        java.util.Date fecha = new java.util.Date();
        return new Timestamp(fecha.getTime());
    }
}

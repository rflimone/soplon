package utilities;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import dao.MetodoEnvioDao;
import entities.MetodoEnvio;
import java.io.IOException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * NO UTILIZAR!, CADA VEZ QUE ENVÍA MENSAJES GASTA $$$
 */
@Component
@Scope("application")
public class SmsSender {
    // Find your Account Sid and Token at twilio.com/user/account
    // Pedir estos datos a Renzo, que dejarlos aca son robables en github publico
    private static final String ACCOUNT_SID = ""; 
    private static final String AUTH_TOKEN = "";

    @Autowired
    private MetodoEnvioDao metodoEnvioDao;

    @Transactional(readOnly = true)
    public List<MetodoEnvio> getAllMetodoEnvio() {
        return metodoEnvioDao.getAllMetodoEnvio();
    }

    public void sendSms(String user, int userCel, String message) throws IOException {
        try {

            Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

            Message sms
                    = /*PARA*/ Message.creator(new PhoneNumber(Integer.toString(userCel)),
                            /*DESDE: Este numero es fijo, lo entrega twilio al subscribirse*/ new PhoneNumber("+56964590329"),
                            message).create();

            System.out.println(sms.getSid());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

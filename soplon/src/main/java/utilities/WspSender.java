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

@Component
@Scope("application")
public class WspSender {

    // Find your Account Sid and Token at twilio.com/user/account
    private static final String ACCOUNT_SID = "ACbc32bb9ba32dcb8a2b1c24b66370d409";
    private static final String AUTH_TOKEN = "00d116b2d8000132c843193212d02f0b";

    @Autowired
    private MetodoEnvioDao metodoEnvioDao;

    @Transactional(readOnly = true)
    public List<MetodoEnvio> getAllMetodoEnvio() {
        return metodoEnvioDao.getAllMetodoEnvio();
    }

    public void sendWsp(String user, int userCel, String message) throws IOException {
        try {
            Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
             Message wsp = /*PARA*/ Message.creator(new PhoneNumber("whatsapp:+56"+Integer.toString(userCel)),
                /*DESDE: Este numero es fijo, lo entrega twilio al subscribirse*/ new PhoneNumber("whatsapp:+14155238886"),
                message).create();

            System.out.println(wsp.getSid());
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

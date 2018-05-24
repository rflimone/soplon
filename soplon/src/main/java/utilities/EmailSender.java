package utilities;

import dao.MetodoEnvioDao;
import entities.MetodoEnvio;
import java.io.IOException;
import java.util.List;
import org.simplejavamail.email.Email;
import org.simplejavamail.email.EmailBuilder;
import org.simplejavamail.mailer.MailerBuilder;
import org.simplejavamail.mailer.config.TransportStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Scope("application")
public class EmailSender {

    @Autowired
    private MetodoEnvioDao metodoEnvioDao;

    @Transactional(readOnly = true)
    public List<MetodoEnvio> getAllMetodoEnvio() {
        return metodoEnvioDao.getAllMetodoEnvio();
    }

    public void sendMail(String user, String userMail, String message) throws IOException {
        try {

            Email email = EmailBuilder.startingBlank()
                    .from("Soplon: Notificaciones de Entretencion", "soplonne@gmail.com")
                    .to(user, userMail)
                    .withSubject("Nuevo contenido detectado")
                    .withPlainText(message)
                    .buildEmail();

            MailerBuilder
                    .withSMTPServer("smtp.gmail.com", 587, "soplonne@gmail.com", "soplonne123")
                    .withTransportStrategy(TransportStrategy.SMTP_TLS)
                    //.withDebugLogging(true)
                    .buildMailer()
                    .sendMail(email);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

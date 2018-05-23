package services;

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
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MetodoEnvioService {

    @Autowired
    private MetodoEnvioDao metodoEnvioDao;

    @Transactional(readOnly = true)
    public List<MetodoEnvio> getAllMetodoEnvio() {
        return metodoEnvioDao.getAllMetodoEnvio();
    }

    public void SendMails(String user, String userMail, String tag, String titulo_pagina, String url_actualizada, String glosa_pagina, String date_new) throws IOException {
         try {

            Email email = EmailBuilder.startingBlank()
                    .from("Soplon: Notificaciones de Entretencion", "soplonne@gmail.com")
                    .to(user, userMail)
                    .withSubject("Nuevo contenido de "+tag)
                    .withPlainText("Enhorabuena!, lo nuevo de "+titulo_pagina+" ya esta diponible en "+url_actualizada)
                    .withPlainText("En detalle, se trata de "+glosa_pagina)
                    .withPlainText("Esto fue subido al sitio en fecha "+date_new)
                    .withPlainText("Esperamos disfrutes de este contenido")
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

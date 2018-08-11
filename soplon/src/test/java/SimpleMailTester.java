

import org.simplejavamail.email.Email;
import org.simplejavamail.email.EmailBuilder;
import org.simplejavamail.mailer.MailerBuilder;
import org.springframework.context.annotation.Configuration;
import org.simplejavamail.mailer.config.TransportStrategy;
import org.springframework.beans.factory.annotation.Autowired;

@Configuration
public class SimpleMailTester {
    
    @Autowired 
    public static void main(String[] args) {
        
        /**
         * Revidar como gatillar el envio automatico a usuarios dependiendo de su seleccion de metodo de envio. 
         * Se debe realizar el envio cuando un campo al cual el este subscrito sea actualizado o a;adido
         */
        
        try {

            Email email = EmailBuilder.startingBlank()
                    .from("Soplon: Notificaciones de Entretencion", "soplonne@gmail.com")
                    .to("Renzo Limone", "rflimone@gmail.com")
                    .withSubject("Soplon test mail")
                    .withPlainText("test test test")
                    .buildEmail();

            MailerBuilder
                    .withSMTPServer("smtp.gmail.com", 587, "soplonne@gmail.com", "soplonne123")
                    .withTransportStrategy(TransportStrategy.SMTP_TLS)
                    .withDebugLogging(true)
                    .buildMailer()
                    .sendMail(email);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
}

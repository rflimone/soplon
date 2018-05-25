package services;

import dao.UserDao;
import entities.Pagina;
import entities.Subscripcion;
import entities.Usuario;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import utilities.EmailSender;
import utilities.SmsSender;

@Service
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class NotificationService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private EmailSender emailSender;

    @Autowired
    private SmsSender smsSender;

    @Transactional(readOnly = false)
    public void lookForNotifications(List<Pagina> paginaUpdateList) throws IOException {
        if (paginaUpdateList.isEmpty()) {
            return;
        }
        List<Usuario> userList = userDao.findUserWithSubscription(paginaUpdateList);

        for (Usuario user : userList) {
            StringBuilder builder = new StringBuilder();
            for (Subscripcion subscripcion : user.getSubscripciones()) {
                builder.append(makeNotificationPlainText(subscripcion.getPagina()));
            }
            
            emailSender.sendMail(user.getNombres(), user.getEmail(), builder.toString());

            //Aca esta fallando, ya que se necesita identificar el metodo de envio, pero solo podemos obtener la subscripcion.
//            if (user.getSubscripciones().equals("Email")) {
//                emailSender.sendMail(user.getNombres(), user.getEmail(), builder.toString());
//            NO DESCOMENTAR EL IF DE SMS, GASTA $$$
//            } else if (user.getSubscripciones().equals("SMS")) {
//                smsSender.sendSms(user.getNombres(), user.getCelular(), builder.toString());
//            } else if (user.getSubscripciones().equals("PUSH")) {
//                //No hay utilities de push aún.
//            }
        }

    }

    private String makeNotificationPlainText(Pagina pagina) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
        String detalle = pagina.getGlosaPagina() != null ? pagina.getGlosaPagina() : pagina.getImagen();
        if (pagina.getGlosaPagina() != null) {
            return String.format(
                    "\nEnhorabuena!, lo nuevo de %s ya esta diponible en %s\nEn detalle, se trata de '%s'\nEsto fue subido al sitio en fecha %s\n\n",
                    pagina.getTituloPagina(),
                    pagina.getUrlUltimo(),
                    detalle,
                    sdf.format(pagina.getDateNew()));
        } else {
            return String.format(
                    "\nEnhorabuena!, lo nuevo de %s ya esta diponible en %s\nEsto fue subido al sitio en fecha %s\n\n",
                    pagina.getTituloPagina(),
                    pagina.getUrlUltimo(),
                    sdf.format(pagina.getDateNew()));
        }

    }
}

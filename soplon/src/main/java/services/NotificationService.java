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
import utilities.*;

@Service
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class NotificationService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private EmailSender emailSender;

    @Autowired
    private SmsSender smsSender;
    
    @Autowired
    private WspSender wspSender;

    @Transactional(readOnly = true)
    public void lookForNotifications(List<Pagina> paginaUpdateList) throws IOException {
        if (paginaUpdateList.isEmpty()) {
            return;
        }
        Boolean envioCorreo;
        Boolean envioSMS;
        Boolean envioPushNotification;

        List<Usuario> userList = userDao.findUserWithSubscription(paginaUpdateList);

        for (Usuario user : userList) {
            envioCorreo = Boolean.FALSE;
            envioSMS = Boolean.FALSE;
            envioPushNotification = Boolean.FALSE;

            StringBuilder builder = new StringBuilder();
            StringBuilder builderSms = new StringBuilder();


            for (Subscripcion subscripcion : user.getSubscripciones()) {
                builder.append(makeNotificationPlainText(subscripcion.getPagina()));
                builderSms.append(makeNotificationSms(subscripcion.getPagina()));
                
            

                if (subscripcion.getMetodoEnvio().getGlosaMetodoEnvio().equalsIgnoreCase("email")) {
                    envioCorreo = Boolean.TRUE;
                } else if (subscripcion.getMetodoEnvio().getGlosaMetodoEnvio().equalsIgnoreCase("sms")) {
                    envioSMS = Boolean.TRUE;
                } else if (subscripcion.getMetodoEnvio().getGlosaMetodoEnvio().equalsIgnoreCase("push")) {
                    envioPushNotification = Boolean.TRUE;
                }
            }

            if (envioCorreo) {
                emailSender.sendMail(user.getNombres(), user.getEmail(), builder.toString());
            }
            if (envioSMS) {
                smsSender.sendSms(user.getNombres(), user.getCelular(), builderSms.toString());
            }
            if (envioPushNotification) {
                wspSender.sendWsp(user.getNombres(), user.getCelular(), builderSms.toString());
            }
            
            builder.setLength(0);
            builderSms.setLength(0);
        }

    }

    private String makeNotificationPlainText(Pagina pagina) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
        String detalle = pagina.getGlosaPagina() != null ? pagina.getGlosaPagina() : pagina.getImagen();
        if (pagina.getGlosaPagina() != null) {
            return String.format(
                    "\nEnhorabuena!, lo nuevo de %s ya esta diponible en %s\nEn detalle," + " se trata de '%s'\nEsto fue subido al sitio en fecha %s\n\n",
                    pagina.getTituloPagina(),
                    pagina.getUrlUltimo(),
                    detalle,
                    sdf.format(pagina.getDateNew()));
        } else {
            return String.format(
                    "\nEnhorabuena!, lo nuevo de %s ya esta diponible en %s\nEsto fue subido al sitio en fecha %s\n\n",
                    pagina.getTituloPagina(),
                    pagina.getUrlUltimo().replaceAll("_",""),
                    sdf.format(pagina.getDateNew()));
        }

    }
    
    private String makeNotificationSms(Pagina pagina) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
          return String.format(
                    "Ya esta diponible %s en %s\nCon en fecha %s\n\n",
                    pagina.getTituloPagina(),
                    pagina.getUrlUltimo(),
                    sdf.format(pagina.getDateNew()));
    }
    
}

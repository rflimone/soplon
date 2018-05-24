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

@Service
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class NotificationService {

    @Autowired
    private UserDao userDao;
    
    @Autowired
    private EmailSender emailSender;

    @Transactional(readOnly = false)
    public void lookForNotifications(List<Pagina> paginaUpdateList) throws IOException {
        if (paginaUpdateList.isEmpty()) return;
        List<Usuario> userList = userDao.findUserWithSubscription(paginaUpdateList);
        
        for (Usuario user : userList) {
            StringBuilder builder = new StringBuilder();
            for (Subscripcion subscripcion : user.getSubscripciones()) {
                builder.append(makeNotificationPlainText(subscripcion.getPagina()));
            }
            emailSender.sendMail(user.getNombres(), user.getEmail(), builder.toString());
        }
        
    }
    
    private String makeNotificationPlainText(Pagina pagina) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
        return String.format(
                "\nEnhorabuena!, lo nuevo de %s ya esta diponible en %s\nEn detalle, se trata de %s\nEsto fue subido al sitio en fecha %s\n\n\n\n"
                , pagina.getTituloPagina()
                , pagina.getUrlUltimo()
                , pagina.getGlosaPagina()
                , sdf.format(pagina.getDateNew())
        );
    }
}

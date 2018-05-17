package services;

import dao.SubscripcionDao;
import entities.Subscripcion;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class SubscripcionService {
    @Autowired
    private SubscripcionDao subscripcionDao;

    @Transactional(readOnly = true)
    public List<Subscripcion> getSubscripcion() {
        return subscripcionDao.getSubscripcion();
    }

    @Transactional
    public void updateSubscripcion(Subscripcion subscripcion) {
        subscripcionDao.updateSubscripcion(subscripcion);
    }

    @Transactional
    public void insertSubscripcion(Subscripcion subscripcion) {
        subscripcionDao.insertSubscripcion(subscripcion);
    }

}

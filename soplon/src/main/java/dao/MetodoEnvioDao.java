package dao;

import entities.MetodoEnvio;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

@Repository
public class MetodoEnvioDao {

    @PersistenceContext
    private EntityManager em;

    public List<MetodoEnvio> getAllMetodoEnvio() {
        Query query = em.createNamedQuery("MetodoEnvio.findAll", MetodoEnvio.class);
        return query.getResultList();
    }
    
    public List<MetodoEnvio> getMetodoEnvio() {
        Query query = em.createNamedQuery("MetodoEnvio.findAll", MetodoEnvio.class);
        return query.getResultList();
    }

    public void insertMetodoEnvio(MetodoEnvio metEnvio) {
        em.persist(metEnvio);
    }
    
    public void updateMetodoEnvio(MetodoEnvio metEnvio) {
        em.merge(metEnvio);
    }
}

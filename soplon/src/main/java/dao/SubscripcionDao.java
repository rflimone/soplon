package dao;

import entities.Subscripcion;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

@Repository
public class SubscripcionDao {

    @PersistenceContext
    private EntityManager em;

    public List<Subscripcion> getSubscripcion() {
        Query query = em.createNamedQuery("Subscripcion.findAll", Subscripcion.class);
        return query.getResultList();
    }

    public void insertSubscripcion(Subscripcion subscripcion) {
        em.persist(subscripcion);
    }
    
    public void updateSubscripcion(Subscripcion subscripcion) {
        em.merge(subscripcion);
    }
}

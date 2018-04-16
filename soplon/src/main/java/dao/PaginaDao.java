package dao;

import entities.Pagina;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

@Repository
public class PaginaDao {

    @PersistenceContext
    private EntityManager em;

    public List<Pagina> getPaginas() {
        Query query = em.createNamedQuery("Pagina.findAll", Pagina.class);
        return query.getResultList();
    }

    public void insertPagina(Pagina pagina) {
        em.persist(pagina);
    }
    
    public void updatePagina(Pagina pagina) {
        em.merge(pagina);
    }
}

package dao;

import entities.*;
import java.util.List;
import javafx.scene.paint.Color;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

@Repository
public class PaginaDao {

    @PersistenceContext
    private EntityManager em;

    public List<Pagina> getPaginas() {
        Query query = em.createNamedQuery("Pagina.findAll", Pagina.class);
        return query.getResultList();
    }

    public List<Pagina> findPaginasWithTag() {
        StringBuilder jql = new StringBuilder();
        jql.append("SELECT DISTINCT p FROM Pagina p ");
        jql.append("LEFT JOIN FETCH p.tagSet ts ");

        TypedQuery<Pagina> q = em.createQuery(jql.toString(), Pagina.class);

        return q.getResultList();
    }

    public void insertPagina(Pagina pagina) {
        em.persist(pagina);
    }

    public Pagina updatePagina(Pagina pagina) {
        return em.merge(pagina);
    }
    
    public void updatePaginas(List<Pagina> paginaList) {
        for (Pagina pagina : paginaList) {
            em.merge(pagina);
        }        
    }
}

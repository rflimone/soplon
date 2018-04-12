package dao;

import entities.Pagina;
import entities.Usuario;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

@Repository
public class PaginaDao {

    @PersistenceContext
    private EntityManager em;

    public List<Usuario> getPaginas() {
        Query query = em.createNamedQuery("Paginas.findAll", Usuario.class);
        return query.getResultList();
    }

    public void insertPagina(Pagina pagina) {
        em.persist(pagina);
    }
    
    public void updatePagina(Pagina pagina) {
        em.merge(pagina);
    }
}

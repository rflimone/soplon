package dao;

import entities.Categoria;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

@Repository
public class CategoriaDao {

    @PersistenceContext
    private EntityManager em;

    public List<Categoria> getCategorias() {
        Query query = em.createNamedQuery("Categoria.findAll", Categoria.class);
        return query.getResultList();
    }

    public void insertCategoria(Categoria categoria) {
        em.persist(categoria);
    }
    
    public void updateCategoria(Categoria categoria) {
        em.merge(categoria);
    }
}

package dao;

import entities.*;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
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

    public Pagina savePagina(Pagina pagina) {
        return em.merge(pagina);
    }

    public Categoria findCategoria(Pagina p) {
        StringBuilder jql = new StringBuilder();
        jql.append("SELECT c FROM Pagina p ");
        jql.append("LEFT JOIN p.idCategorias c ");
        jql.append("WHERE p.id = :id ");

        Query query = em.createQuery(jql.toString(), Categoria.class);
        query.setParameter("id", p.getIdPaginas());
        try {
            return (Categoria) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    public List<Tag> findTag(Pagina p) {
        StringBuilder jql = new StringBuilder();
        jql.append("SELECT t FROM Pagina p ");
        jql.append("LEFT JOIN p.tagSet t ");
        jql.append("WHERE p.id = :id ");

        Query query = em.createQuery(jql.toString(), Tag.class);
        query.setParameter("id", p.getIdPaginas());
        return query.getResultList();
    }

    public List<Pagina> findPaginasByTag(String glosa) {
        StringBuilder jpql = new StringBuilder();

        jpql.append("SELECT p FROM Pagina p ");
        jpql.append("INNER JOIN p.tagSet t ");
        jpql.append("WHERE UPPER(t.glosaTag) = UPPER(:glosa) ");

        Query q = em.createQuery(jpql.toString(), Pagina.class);
        q.setParameter("glosa", glosa);

        return q.getResultList();
    }

    public List<Pagina> findByCategoria(String categoria) {
        StringBuilder jpql = new StringBuilder();

        jpql.append("SELECT p FROM Pagina p ");
        jpql.append("INNER JOIN p.idCategorias c ");
        jpql.append("WHERE UPPER(c.glosaCategoria) = UPPER(:categoria) ");

        Query q = em.createQuery(jpql.toString(), Pagina.class);
        q.setParameter("categoria", categoria);

        return q.getResultList();
    }
}

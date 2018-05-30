package dao;

import entities.Tag;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class TagDao {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @PersistenceContext
    private EntityManager em;

    public List<Tag> getTag() {
        Query query = em.createNamedQuery("Tag.findAll", Tag.class);
        return query.getResultList();
    }

    public void insertTag(Tag tag) {
        em.persist(tag);
    }
    
    public void updateTag(Tag tag) {
        em.merge(tag);
    }

    public Tag findByGlosa(String glosa) {
        Query query = em.createNamedQuery("Tag.findByGlosa", Tag.class);
        query.setMaxResults(1);
        query.setParameter("glosa", glosa);

        try {
            return (Tag) query.getSingleResult();
        } catch (NoResultException e) {
            logger.debug("No hay resultados");
            return null;
        }
    }

    public Tag findWithPaginas(String glosa) {
        StringBuilder jpql = new StringBuilder();

        jpql.append("SELECT DISTINCT t FROM Tag t ")
                .append("LEFT JOIN FETCH t.paginas ")
                .append("WHERE UPPER(t.glosaTag) = UPPER(:glosa) ");

        Query query = em.createQuery(jpql.toString(), Tag.class);
        query.setMaxResults(1);
        query.setParameter("glosa", glosa);

        try {
            return (Tag) query.getSingleResult();
        } catch (NoResultException e) {
            logger.debug("No hay resultados");
            return null;
        }
    }

    public Tag save(Tag tag) {
        return em.merge(tag);
    }

    public Tag findWithPaginas(Integer id) {
        StringBuilder jpql = new StringBuilder();

        jpql.append("SELECT DISTINCT t FROM Tag t ")
                .append("LEFT JOIN FETCH t.paginas ")
                .append("WHERE t.idTags = :id ");

        Query query = em.createQuery(jpql.toString(), Tag.class);
        query.setMaxResults(1);
        query.setParameter("id", id);

        try {
            return (Tag) query.getSingleResult();
        } catch (NoResultException e) {
            logger.debug("No hay resultados");
            return null;
        }
    }

    public List<Tag> findWithPaginas() {
        StringBuilder jpql = new StringBuilder();

        jpql.append("SELECT DISTINCT t FROM Tag t ")
                .append("LEFT JOIN FETCH t.paginas ");

        Query query = em.createQuery(jpql.toString(), Tag.class);
        return query.getResultList();
    }
}

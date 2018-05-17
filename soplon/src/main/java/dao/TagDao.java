package dao;

import entities.Tag;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

@Repository
public class TagDao {

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
}

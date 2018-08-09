/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Pagina;
import entities.Usuario;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

/**
 *
 * @author rlimone
 */
@Repository
public class UserDao {

    @PersistenceContext
    private EntityManager em;

    public List<Usuario> getUser() {
        Query query = em.createNamedQuery("Usuario.findAll", Usuario.class);
        return query.getResultList();
    }

    public List<Usuario> findUserWithSubscription(List<Pagina> paginas) {
        StringBuilder jql = new StringBuilder();
        jql.append("SELECT DISTINCT u FROM Usuario u ");
        jql.append("LEFT JOIN FETCH u.subscripciones s ");
        jql.append("LEFT JOIN FETCH s.metodoEnvio ");
        jql.append("WHERE s.pagina in :paginas");

        Query q = em.createQuery(jql.toString(), Usuario.class);

        q.setParameter("paginas", paginas);
        
        return q.getResultList();
    }

}

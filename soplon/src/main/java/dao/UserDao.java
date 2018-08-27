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
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import static org.hibernate.annotations.common.util.impl.LoggerFactory.logger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

/**
 *
 * @author rlimone
 */
@Repository
public class UserDao {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @PersistenceContext
    private EntityManager em;

    public List<Usuario> getUser() {
        Query query = em.createNamedQuery("Usuario.findAll", Usuario.class);
        return query.getResultList();
    }

    public Usuario getUserByUsername(String email) {
        Query query = em.createNamedQuery("Usuario.findByUsername", Usuario.class);

        query.setMaxResults(1);
        query.setParameter("email", email);

        try {
            return (Usuario) query.getSingleResult();
        } catch (NoResultException e) {
            logger.debug("No hay resultados");
            return null;
        }
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

    public Usuario getUserById(Integer id) {
        Query query = em.createNamedQuery("Usuario.findById", Usuario.class);

        query.setMaxResults(1);
        query.setParameter("id_usuarios", id);

        try {
            return (Usuario) query.getSingleResult();
        } catch (NoResultException e) {
            logger.debug("No hay resultados");
            return null;
        }
    }

    public void insertUsuario(Usuario usuario) {
        em.persist(usuario);
    }

    public Usuario saveUsuario(Usuario usuario) {
        return em.merge(usuario);
    }

    public void deleteUserById(Integer id) {
        Usuario user = em.find(Usuario.class, id);

        em.getTransaction().begin();
        em.remove(user);
        em.getTransaction().commit();
    }

}

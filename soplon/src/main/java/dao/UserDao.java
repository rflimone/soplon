/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Usuario;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
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
    
}

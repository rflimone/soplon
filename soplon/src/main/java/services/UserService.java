package services;

import api.CustomUserDetails;
import dao.UserDao;
import entities.Usuario;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author rlimone
 */
@Service
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class UserService {

    @Autowired
    private UserDao userDao;

    @Transactional(readOnly = true)
    public List<Usuario> getUsers() {
        return userDao.getUser();
    }

    public Usuario getUserByUsername(String username) {
        return userDao.getUserByUsername(username);
    }

    public CustomUserDetails getUserDetailByUsername(String username) {
        Usuario user = userDao.getUserByUsername(username);
        CustomUserDetails userDetails = new CustomUserDetails();
        userDetails.setUsername(user.getEmail());
        userDetails.setPassword(user.getPassword());
        return userDetails;
    }

    @Transactional
    public Usuario updateUsuario(Usuario usuario) {
        return userDao.saveUsuario(usuario);
    }

    @Transactional
    public void deleteUsuario(Integer id) {
        userDao.deleteUserById(id);
    }

    @Transactional
    public Usuario insertUsuario(Usuario usuario) {
        return userDao.saveUsuario(usuario);
    }

}

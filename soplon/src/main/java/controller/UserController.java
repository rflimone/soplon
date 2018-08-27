package controller;

import services.UserService;
import entities.Usuario;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author rlimone
 */
@RestController
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping(value = "/private/user/get-all")
    public List<Usuario> getUsers() {
        return userService.getUsers();
    }

    @GetMapping(value = "/private/user/getByEmail")
    public Usuario getUserByUsername(String username) {
        return (Usuario) userService.getUserByUsername(username);
    }

    @PostMapping(value = "/private/user/update-user")
    public ResponseEntity<?> postUser(@RequestBody Usuario usuario) {
        userService.updateUsuario(usuario);
        return ResponseEntity.ok("OK");
    }

    @PostMapping(value = "/private/user/insert-user")
    public ResponseEntity<?> insertUser(@RequestBody Usuario usuario) {
        userService.insertUsuario(usuario);
        return ResponseEntity.ok("OK");
    }
}

package controller;

import services.UserService;
import entities.Usuario;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
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

    @GetMapping(value = "/private/user", produces = "application/json")
    public Usuario getUserByUsername(@RequestParam String username) {
        return userService.getUserByUsername(username);
    }

    @PutMapping(value = "/private/user", consumes = "application/json")
    public ResponseEntity<?> postUser(@RequestBody Usuario usuario) {
        userService.updateUsuario(usuario);
        return ResponseEntity.ok("OK");
    }

    @PostMapping(value = "/private/user", consumes = "application/json")
    public ResponseEntity<?> insertUser(@RequestBody Usuario usuario) {
        userService.insertUsuario(usuario);
        return ResponseEntity.ok("OK");
    }

    @DeleteMapping(value = "/private/user/{id}")
    public ResponseEntity<?> deleteUser(@PathVariable Integer id) {
        userService.deleteUsuario(id);
        return ResponseEntity.ok("OK");
    }
}

package controller;

import services.UserService;
import entities.Usuario;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
}

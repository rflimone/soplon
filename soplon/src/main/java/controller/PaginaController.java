package controller;

import services.PaginaService;
import entities.Pagina;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author rlimone
 */
@RestController
public class PaginaController {
    @Autowired
    private PaginaService userService;
    
    @GetMapping(value = "/pagina/get-all")
    public List<Pagina> getPaginas() {
        return userService.getPaginas();
    }
}
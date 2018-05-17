package controller;

import services.PaginaService;
import entities.Pagina;
import entities.Tag;
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
public class PaginaController {
    @Autowired
    private PaginaService paginaService;
    
    @GetMapping(value = "/pagina/get-all")
    public List<Pagina> getPaginas() {
        return paginaService.getPaginas();
    }
    
    @GetMapping(value = "/pagina/getbytag")
    public List<Pagina> findPaginasWithTag(){
        return paginaService.findPaginasWithTag();
    }
    
    @PostMapping(value = "/pagina/update-page")
    public ResponseEntity<?> postPagina(@RequestBody Pagina pagina) {
        paginaService.updatePagina(pagina);
        return ResponseEntity.ok("OK");
    }
    
    @PostMapping(value = "/pagina/insert-page")
    public ResponseEntity<?> insertPagina(@RequestBody Pagina pagina) {
        paginaService.insertPagina(pagina);
        return ResponseEntity.ok("OK");
    }
    
}
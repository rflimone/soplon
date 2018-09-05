package controller;

import services.CategoriaService;
import entities.Categoria;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CategoriaController {
    @Autowired
    private CategoriaService categoriaService;
    
    @GetMapping(value = "private/categorias", produces = "application/json")
    public List<Categoria> getCategorias() {
        return categoriaService.getCategorias();
    }
    
    @PostMapping(value = "/categoria/update-categoria")
    public ResponseEntity<?> postCategoria(@RequestBody Categoria categoria) {
        categoriaService.updateCategoria(categoria);
        return ResponseEntity.ok("OK");
    }
    
    @PostMapping(value = "/categoria/insert-categoria")
    public ResponseEntity<?> insertCategoria(@RequestBody Categoria categoria) {
        categoriaService.insertCategoria(categoria);
        return ResponseEntity.ok("OK");
    }
    
}
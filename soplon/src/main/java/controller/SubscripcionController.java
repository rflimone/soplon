package controller;

import services.SubscripcionService;
import entities.Subscripcion;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SubscripcionController {
    @Autowired
    private SubscripcionService subscripcionService;
    
    @GetMapping(value = "/subscripcion/get-all")
    public List<Subscripcion> getSubscripcion() {
        return subscripcionService.getSubscripcion();
    }
    
    @PostMapping(value = "/subscripcion/update-subscripcion")
    public ResponseEntity<?> postSubscripcion(@RequestBody Subscripcion subscripcion) {
        subscripcionService.updateSubscripcion(subscripcion);
        return ResponseEntity.ok("OK");
    }
    
    @PostMapping(value = "/subscripcion/insert-subscripcion")
    public ResponseEntity<?> insertSubscripcion(@RequestBody Subscripcion subscripcion) {
        subscripcionService.insertSubscripcion(subscripcion);
        return ResponseEntity.ok("OK");
    }
    
}
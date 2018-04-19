package controller;

import services.MetodoEnvioService;
import entities.MetodoEnvio;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MetodoEnvioController {

    @Autowired
    private MetodoEnvioService metodoEnvioService;

    @GetMapping(value = "/metodoEnvio/get-all")
    public List<MetodoEnvio> getAllMetodoEnvio() {
        return metodoEnvioService.getAllMetodoEnvio();
    }
}

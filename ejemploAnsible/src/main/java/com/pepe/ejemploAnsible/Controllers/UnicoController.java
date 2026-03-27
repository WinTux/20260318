package com.pepe.ejemploAnsible.Controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
public class UnicoController {
    @GetMapping
    public String unicoEndpoint(){
        return "Este es un valor unico";
    }

}

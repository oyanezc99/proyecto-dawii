package com.cibertec.proyecto.api_products.controller;

import com.cibertec.proyecto.api_products.model.bd.Rol;
import com.cibertec.proyecto.api_products.service.rol.RolService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/rol")
@RequiredArgsConstructor
public class RolController {
    private final RolService rolService;

    @GetMapping("/findAll")
    public ResponseEntity<List<Rol>> listarRoles(){
        return new ResponseEntity<>(rolService.findAll(), HttpStatus.OK);
    }
    @PostMapping("/add")
    public ResponseEntity<Rol> agregarRol(@RequestBody Rol rol){
        return  new ResponseEntity<>(rolService.add(rol), HttpStatus.CREATED);
    }
}

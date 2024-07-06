package com.cibertec.proyecto.api_rol.controller;

import com.cibertec.proyecto.api_rol.model.bd.Rol;
import com.cibertec.proyecto.api_rol.service.RolService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/rol")
@RequiredArgsConstructor
public class RolController {
    private final RolService rolService;

    @PostMapping("/crear")
    public ResponseEntity<String> crearRol(@RequestBody Rol rol){
        try {
            rolService.crearRol(rol);
            return new ResponseEntity<>("Rol creado correctamente", HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>("Error al crear el rol: Violación de integridad", HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping("/actualizar")
    public ResponseEntity<String> actualizarRol(@RequestBody Rol rol){
        try {
            rolService.actualizarRol(rol);
            return new ResponseEntity<>("Rol actualizado correctamente", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Error al actualizar el rol: Violación de integridad", HttpStatus.BAD_REQUEST);
        }
    }
    @PostMapping("/eliminar")
    public ResponseEntity<String> eliminarRol(@RequestParam(name = "id") Integer id){
        try {
            rolService.eliminarRol(id);
            return new ResponseEntity<>("Rol eliminar correctamente", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Error al elimnar el rol: Violación de integridad", HttpStatus.BAD_REQUEST);
        }
    }
    @GetMapping("/obtener")
    public ResponseEntity<Rol> obtenerRolId(@RequestParam(name = "id") Integer id){
        Rol rol = rolService.obtenertRolPorId(id);
        return new ResponseEntity<>(rol, HttpStatus.OK);
    }
    @GetMapping("/listar")
    public ResponseEntity<List<Rol>> listarRoles(@RequestParam(name = "dato") String dato){
        List<Rol> roles = rolService.listarRoles(dato);
        return new ResponseEntity<>(roles, HttpStatus.OK);
    }
}

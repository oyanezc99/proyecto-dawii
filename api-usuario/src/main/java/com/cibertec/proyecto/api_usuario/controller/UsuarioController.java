package com.cibertec.proyecto.api_usuario.controller;

import com.cibertec.proyecto.api_usuario.model.bd.Usuario;
import com.cibertec.proyecto.api_usuario.service.UsuarioService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/usuario")
@RequiredArgsConstructor
public class UsuarioController {
    private final UsuarioService usuarioService;

    @PostMapping("/crear")
    public ResponseEntity<String> crearUsuario(@RequestBody Usuario usuario){
        try {
            usuarioService.crearUsuario(usuario);
            return new ResponseEntity<>("Usuario creado correctamente", HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>("Error al crear el usuario: Violación de integridad", HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping("/actualizar")
    public ResponseEntity<String> actualizarUsuario(@RequestBody Usuario usuario){
        try {
            usuarioService.actualizarUsuario(usuario);
            return new ResponseEntity<>("Usuario actualizado correctamente", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Error al actualizar el usuario: Violación de integridad", HttpStatus.BAD_REQUEST);
        }
    }
    @PostMapping("/eliminar")
    public ResponseEntity<String> eliminarUsuario(@RequestParam(name = "id") Integer id){
        try {
            usuarioService.eliminarUsuario(id);
            return new ResponseEntity<>("Usuario eliminar correctamente", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Error al elimnar el usuario: Violación de integridad", HttpStatus.BAD_REQUEST);
        }
    }
    @GetMapping("/obtener")
    public ResponseEntity<Usuario> obtenerUsuarioId(@RequestParam(name = "id") Integer id){
        Usuario usuario = usuarioService.leerUsuario(id);
        return new ResponseEntity<>(usuario, HttpStatus.OK);
    }
    @GetMapping("/listar")
    public ResponseEntity<List<Usuario>> listarUsuarioes(@RequestParam(name = "dato") String dato){
        List<Usuario> usuarioes = usuarioService.listarUsuarios(dato);
        return new ResponseEntity<>(usuarioes, HttpStatus.OK);
    }
}

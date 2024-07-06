package com.cibertec.proyecto.api_usuario.service;

import com.cibertec.proyecto.api_usuario.model.bd.Usuario;

import java.util.List;

public interface UsuarioService {
    void crearUsuario(Usuario usuario);
    void actualizarUsuario(Usuario usuario);
    void eliminarUsuario(Integer id);
    Usuario leerUsuario(Integer id);
    List<Usuario> listarUsuarios(String dato);
}

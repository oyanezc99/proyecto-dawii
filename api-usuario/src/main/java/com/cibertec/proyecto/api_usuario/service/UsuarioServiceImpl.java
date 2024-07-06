package com.cibertec.proyecto.api_usuario.service;

import com.cibertec.proyecto.api_usuario.model.bd.Usuario;
import com.cibertec.proyecto.api_usuario.repository.UsuarioRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UsuarioServiceImpl implements UsuarioService {

    private final UsuarioRepository usuarioRepository;

    @Override
    public void crearUsuario(Usuario usuario) {
        usuarioRepository.crearUsuario(
                usuario.getNombre(),
                usuario.getApellido(),
                usuario.getDni(),
                usuario.getSexo(),
                usuario.getTelefono(),
                usuario.getEmail(),
                usuario.getUsuario(),
                usuario.getContraseña(),
                usuario.getF_nacimiento().toString(),
                usuario.getRol());
    }

    @Override
    public void actualizarUsuario(Usuario usuario) {
        usuarioRepository.actualizarUsuario(
                usuario.getId(),
                usuario.getNombre(),
                usuario.getApellido(),
                usuario.getDni(),
                usuario.getSexo(),
                usuario.getTelefono(),
                usuario.getEmail(),
                usuario.getUsuario(),
                usuario.getContraseña(),
                usuario.getF_nacimiento().toString(),
                usuario.getRol());
    }

    @Override
    public void eliminarUsuario(Integer id) {
        Usuario usuario = usuarioRepository.leerUsuario(id);
        usuarioRepository.eliminarUsuario(usuario.getId());
    }

    @Override
    public Usuario leerUsuario(Integer id) {
        return usuarioRepository.leerUsuario(id);
    }

    @Override
    public List<Usuario> listarUsuarios(String dato) {
        return usuarioRepository.leerTodosUsuarios(dato);
    }
}

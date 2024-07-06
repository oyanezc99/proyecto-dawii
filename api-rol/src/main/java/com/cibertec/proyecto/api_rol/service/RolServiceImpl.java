package com.cibertec.proyecto.api_rol.service;

import com.cibertec.proyecto.api_rol.model.bd.Rol;
import com.cibertec.proyecto.api_rol.repository.RolRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RolServiceImpl implements RolService {

    private final RolRepository rolRepository;

    @Override
    public void crearRol(Rol rol) {
        rolRepository.crearRol(rol.getNombre(),rol.getDescripcion());
    }

    @Override
    public void actualizarRol(Rol rol) {
        rolRepository.actualizarRol(rol.getId(),rol.getNombre(),rol.getDescripcion());
    }

    @Override
    public void eliminarRol(Integer id) {
        Rol rol = rolRepository.obtenerRolPorId(id);
        rolRepository.eliminarRol(rol.getId());
    }

    @Override
    public Rol obtenertRolPorId(Integer id) {
        return rolRepository.obtenerRolPorId(id);
    }

    @Override
    public List<Rol> listarRoles(String dato) {
        return rolRepository.listarRoles(dato);
    }
}

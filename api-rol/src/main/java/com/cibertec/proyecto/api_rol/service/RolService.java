package com.cibertec.proyecto.api_rol.service;
import com.cibertec.proyecto.api_rol.model.bd.Rol;

import java.util.List;

public interface RolService {
    void crearRol(Rol rol);
    void actualizarRol(Rol rol);
    void eliminarRol(Integer id);
    Rol obtenertRolPorId(Integer id);
    List<Rol> listarRoles(String dato);
}

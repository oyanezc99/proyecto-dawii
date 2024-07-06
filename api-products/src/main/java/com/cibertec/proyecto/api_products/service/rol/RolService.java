package com.cibertec.proyecto.api_products.service.rol;

import com.cibertec.proyecto.api_products.model.bd.Rol;

import java.util.List;

public interface RolService {
    public List<Rol> findAll();
    public Rol findByRolName(String rolName);
    public Rol add(Rol rol);
    public void delete(Integer id);
}

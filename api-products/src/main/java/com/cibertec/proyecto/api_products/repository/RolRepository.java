package com.cibertec.proyecto.api_products.repository;

import com.cibertec.proyecto.api_products.model.bd.Rol;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RolRepository extends JpaRepository<Rol,Integer> {
    Rol findByNombre(String rolName);
}

package com.cibertec.proyecto.api_rol.repository;

import com.cibertec.proyecto.api_rol.model.bd.Rol;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RolRepository extends JpaRepository<Rol,Integer> {

    @Modifying
    @Transactional
    @Query(nativeQuery = true, value = "CALL sp_CrearRol(:p_nombre,:p_descripcion)")
    void crearRol(@Param("p_nombre") String nombre, @Param("p_descripcion") String descripcion);

    @Modifying
    @Transactional
    @Query(nativeQuery = true, value = "CALL sp_ActualizarRol(:p_id,:p_nombre,:p_descripcion)")
    void actualizarRol(@Param("p_id") Integer id, @Param("p_nombre") String nombre, @Param("p_descripcion") String descripcion);

    @Modifying
    @Transactional
    @Query(nativeQuery = true, value = "CALL sp_EliminarRol(:p_id)")
    void eliminarRol(@Param("p_id") Integer id);

    @Query(nativeQuery = true, value = "CALL sp_LeerRol(:p_id)")
    Rol obtenerRolPorId(@Param("p_id") Integer id);

    @Query(nativeQuery = true, value = "CALL sp_LeerTodosRoles(:p_nombre_descripcion)")
    List<Rol> listarRoles(@Param("p_nombre_descripcion") String nombreDescripcion);
}

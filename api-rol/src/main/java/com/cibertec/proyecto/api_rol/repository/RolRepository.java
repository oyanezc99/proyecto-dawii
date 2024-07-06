package com.cibertec.proyecto.api_rol.repository;

import com.cibertec.proyecto.api_rol.model.bd.Rol;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RolRepository extends JpaRepository<Rol,Integer> {

    @Procedure(name = "sp_CrearRol")
    void crearRol(@Param("p_nombre") String nombre, @Param("p_descripcion") String descripcion);

    @Procedure(name = "sp_ActualizarRol")
    void actualizarRol(@Param("p_id") Integer id, @Param("p_nombre") String nombre, @Param("p_descripcion") String descripcion);

    @Procedure(name = "sp_EliminarRol")
    void eliminarRol(@Param("p_id") Integer id);

    @Query(nativeQuery = true, value = "CALL sp_ObtenerRolPorId(:p_id)")
    Rol obtenerRolPorId(@Param("p_id") Integer id);

    @Query(nativeQuery = true, value = "CALL sp_LeerTodosRoles(:p_nombre_descripcion)")
    List<Rol> listarRoles(@Param("p_nombre_descripcion") String nombreDescripcion);
}

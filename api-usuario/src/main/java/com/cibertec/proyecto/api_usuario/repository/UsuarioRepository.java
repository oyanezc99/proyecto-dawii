package com.cibertec.proyecto.api_usuario.repository;

import com.cibertec.proyecto.api_usuario.model.bd.Usuario;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UsuarioRepository extends JpaRepository<Usuario,Integer> {

    @Modifying
    @Transactional
    @Query(nativeQuery = true, value = "CALL sp_CrearUsuario(:p_nombre, :p_apellido, :p_dni, :p_sexo, :p_telefono, :p_email, :p_nombre_usuario, :p_contrasena, :p_fecha_nacimiento, :p_idrol)")
    void crearUsuario(
            @Param("p_nombre") String nombre,
            @Param("p_apellido") String apellido,
            @Param("p_dni") String dni,
            @Param("p_sexo") String sexo,
            @Param("p_telefono") String telefono,
            @Param("p_email") String email,
            @Param("p_nombre_usuario") String nombreUsuario,
            @Param("p_contrasena") String contrasena,
            @Param("p_fecha_nacimiento") String fechaNacimiento,
            @Param("p_idrol") Integer idRol
    );

    @Modifying
    @Transactional
    @Query(nativeQuery = true, value = "CALL sp_ActualizarUsuario(:p_idusuario, :p_nombre, :p_apellido, :p_dni, :p_sexo, :p_telefono, :p_email, :p_nombre_usuario, :p_contrasena, :p_fecha_nacimiento, :p_idrol)")
    void actualizarUsuario(
            @Param("p_idusuario") Integer idUsuario,
            @Param("p_nombre") String nombre,
            @Param("p_apellido") String apellido,
            @Param("p_dni") String dni,
            @Param("p_sexo") String sexo,
            @Param("p_telefono") String telefono,
            @Param("p_email") String email,
            @Param("p_nombre_usuario") String nombreUsuario,
            @Param("p_contrasena") String contrasena,
            @Param("p_fecha_nacimiento") String fechaNacimiento,
            @Param("p_idrol") Integer idRol
    );


    @Modifying
    @Transactional
    @Query(nativeQuery = true, value = "CALL sp_EliminarUsuario(:p_idusuario)")
    void eliminarUsuario(@Param("p_idusuario") Integer idUsuario);

    @Query(nativeQuery = true, value = "CALL sp_LeerUsuario(:p_idusuario)")
    Usuario leerUsuario(@Param("p_idusuario") Integer idUsuario);

    @Query(nativeQuery = true, value = "CALL sp_LeerTodosUsuarios(:p_nombre_usuario_email)")
    List<Usuario> leerTodosUsuarios(@Param("p_nombre_usuario_email") String dato);

}

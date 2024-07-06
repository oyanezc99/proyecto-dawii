package com.cibertec.proyecto.api_usuario.model.bd;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

import java.sql.Timestamp;

@Data
@Table(name="usuario")
@Entity
public class Usuario {
    @Id
    @Column(name = "idusuario")
    private Integer id;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "apellido")
    private String apellido;

    @Column(name = "dni")
    private String dni;

    @Column(name = "sexo")
    private String sexo;

    @Column(name = "telefono")
    private String telefono;

    @Column(name = "email")
    private String email;

    @Column(name = "nombre_usuario")
    private String usuario;

    @Column(name = "contrasena")
    private String contraseña;

    @Column(name = "fecha_nacimiento")
    private Timestamp f_nacimiento;

    @Column(name = "fecha_registro")
    private Timestamp f_registro;

    @Column(name = "activo")
    private boolean isActivo;

    @Column(name = "idrol")
    private Integer rol;

}

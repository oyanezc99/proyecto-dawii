package com.cibertec.proyecto.api_products.model.bd;


import jakarta.persistence.*;
import lombok.Data;

import java.sql.Timestamp;

@Data
@Table(name = "usuario")
@Entity
public class Usuario {
    @Id
    @Column(name = "idUsuario")
    private Integer id;
    @Column(name = "nomUsuario")
    private String nombre;
    @Column(name = "pws")
    private String password;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="idRol", referencedColumnName = "idRol")
    private Rol rol_id;
    @Column(name = "nomCompleto")
    private String nombre_completo;
    @Column(name = "email")
    private String correo;
    @Column(name = "fechaRegistro")
    private Timestamp fechaR;

}

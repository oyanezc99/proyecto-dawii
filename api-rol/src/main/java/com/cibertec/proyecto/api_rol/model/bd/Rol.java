package com.cibertec.proyecto.api_rol.model.bd;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Data
@Table(name="rol")
@Entity
public class Rol {
    @Id
    @Column(name = "idRol")
    private Integer id;
    @Column(name = "nombre")
    private String nombre;
    @Column(name = "descripcion")
    private String descripcion;
    @Column(name = "activo")
    private boolean isActivo;
}

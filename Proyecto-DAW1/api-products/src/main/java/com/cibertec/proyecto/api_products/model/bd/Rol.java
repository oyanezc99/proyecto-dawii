package com.cibertec.proyecto.api_products.model.bd;

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
    @Column(name = "nomRol")
    private String nombre;
    @Column(name = "descpRol")
    private String descripcion;

    @OneToMany(mappedBy = "rol_id")
    private List<Usuario> usuarios;
}

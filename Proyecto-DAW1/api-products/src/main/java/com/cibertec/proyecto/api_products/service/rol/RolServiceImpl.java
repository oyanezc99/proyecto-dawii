package com.cibertec.proyecto.api_products.service.rol;

import com.cibertec.proyecto.api_products.model.bd.Rol;
import com.cibertec.proyecto.api_products.repository.RolRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RolServiceImpl implements RolService {

    private final RolRepository rolRepository;


    @Override
    public List<Rol> findAll() {
        return rolRepository.findAll();
    }

    @Override
    public Rol findByRolName(String rolName) {
        return rolRepository.findByNombre(rolName);
    }

    @Override
    public Rol add(Rol rol) {
        return rolRepository.save(rol);
    }

    @Override
    public void delete(Integer id) {
        var rolExits = rolRepository.findById(id).get();
        rolRepository.delete(rolExits);
    }
}

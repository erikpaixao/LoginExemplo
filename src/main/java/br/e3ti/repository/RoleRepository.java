package br.e3ti.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.e3ti.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
}

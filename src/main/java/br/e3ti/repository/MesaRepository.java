package br.e3ti.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.e3ti.model.Mesa;

public interface MesaRepository extends JpaRepository<Mesa, Long>{

	Mesa findById(Long id);
}

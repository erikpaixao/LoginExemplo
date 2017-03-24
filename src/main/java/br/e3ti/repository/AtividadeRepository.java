package br.e3ti.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.e3ti.model.Atividade;

public interface AtividadeRepository extends JpaRepository<Atividade, Long>{
}

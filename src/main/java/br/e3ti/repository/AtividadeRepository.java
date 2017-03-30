package br.e3ti.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.e3ti.model.Atividade;
import br.e3ti.model.User;

public interface AtividadeRepository extends JpaRepository<Atividade, Long>{

	User findById(Long id);
}

package br.e3ti.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.e3ti.model.Produto;

public interface ProdutoRepository extends JpaRepository<Produto, Long>{

	Produto findById(Long id);
}

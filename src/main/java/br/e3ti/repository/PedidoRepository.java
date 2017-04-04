package br.e3ti.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.e3ti.model.Pedido;

public interface PedidoRepository extends JpaRepository<Pedido, Long>{

	Pedido findById(Long id);
}

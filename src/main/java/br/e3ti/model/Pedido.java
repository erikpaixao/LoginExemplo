package br.e3ti.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Pedido {
	
	@Id
	@GeneratedValue
	private Long id;
	@OneToMany
	private List<Produto> produtos;
	@OneToOne
	private Mesa mesa;
	private Float valorPedido;

	public Pedido() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<Produto> getProdutos() {
		return produtos;
	}

	public void setProdutos(List<Produto> produtos) {
		this.produtos = produtos;
	}

	public Mesa getMesa() {
		return mesa;
	}

	public void setMesa(Mesa mesa) {
		this.mesa = mesa;
	}

	public Float getValorPedido() {
		return valorPedido;
	}

	public void setValorPedido(Float valorPedido) {
		this.valorPedido = valorPedido;
	}

}

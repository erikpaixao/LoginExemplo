package br.e3ti.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Mesa {
	@Id
	@GeneratedValue
	private Long id;
	@OneToMany
	private List<Pedido> pedidos;
	private Float valorTotal;
	private Boolean isFinalizada;

	public Mesa() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<Pedido> getPedidos() {
		return pedidos;
	}

	public void setPedidos(List<Pedido> pedidos) {
		this.pedidos = pedidos;
	}

	public Float getValorTotal() {
		return valorTotal;
	}

	public void setValorTotal(Float valorTotal) {
		this.valorTotal = valorTotal;
	}

	public Boolean getIsFinalizada() {
		return isFinalizada;
	}

	public void setIsFinalizada(Boolean isFinalizada) {
		this.isFinalizada = isFinalizada;
	}

}

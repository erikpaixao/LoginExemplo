package br.e3ti.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Atividade {

	@Id
	@GeneratedValue
	private Long id;
	private String descricao;
	private Date dataCriacao;
	private Date prazoFinal;
	private Boolean isRealizado;
	@ManyToOne
	private User usuario;
	@Enumerated
	private TipoAtividade tipoAtividade;

	public Atividade() {
	}

	public User getUsuario() {
		return usuario;
	}

	public void setUsuario(User usuario) {
		this.usuario = usuario;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Date getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public Date getPrazoFinal() {
		return prazoFinal;
	}

	public void setPrazoFinal(Date prazoFinal) {
		this.prazoFinal = prazoFinal;
	}

	public Boolean getIsRealizado() {
		return isRealizado;
	}

	public void setIsRealizado(Boolean isRealizado) {
		this.isRealizado = isRealizado;
	}

	public TipoAtividade getTipoAtividade() {
		return tipoAtividade;
	}

	public void setTipoAtividade(TipoAtividade tipoAtividade) {
		this.tipoAtividade = tipoAtividade;
	}

}

package org.infracommerce.loja.models;

import java.math.BigDecimal;

import javax.persistence.Embeddable;

@Embeddable
public class Preco {


	private BigDecimal valor;
	 private TipoPreco tipo;
	 
	 public BigDecimal getValor() {
		return valor;
	}
	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}
	public TipoPreco getTipo() {
		return tipo;
	}
	public void setTipo(TipoPreco tipo) {
		this.tipo = tipo;
	}
	
	@Override
	public String toString() {
		return "Preco [valor=" + valor + ", tipo=" + tipo.name() + "]";
	}
	
}

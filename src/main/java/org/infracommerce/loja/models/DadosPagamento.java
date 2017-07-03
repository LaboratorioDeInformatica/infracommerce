package org.infracommerce.loja.models;

import java.math.BigDecimal;

public class DadosPagamento {

	private BigDecimal value;
	
	public DadosPagamento(BigDecimal value){
		this.setValue(value);
	}

	public DadosPagamento(){}
	
	public BigDecimal getValue() {
		return value;
	}

	public void setValue(BigDecimal value) {
		this.value = value;
	}
}

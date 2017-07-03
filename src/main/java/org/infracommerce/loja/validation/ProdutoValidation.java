package org.infracommerce.loja.validation;

import org.infracommerce.loja.models.Produto;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class ProdutoValidation implements Validator {
	


	@Override
	public boolean supports(Class<?> clazz) {
	    return Produto.class.isAssignableFrom(clazz);
	
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "titulo", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "descricao", "field.required");
		
		
	}
}

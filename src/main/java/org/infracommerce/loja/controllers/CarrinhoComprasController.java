package org.infracommerce.loja.controllers;

import org.infracommerce.loja.dao.ProdutoDao;
import org.infracommerce.loja.models.CarrinhoCompras;
import org.infracommerce.loja.models.CarrinhoItem;
import org.infracommerce.loja.models.Produto;
import org.infracommerce.loja.models.TipoPreco;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/cart")
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class CarrinhoComprasController {

	@Autowired
	ProdutoDao produtoDAO;
	
	@Autowired
	CarrinhoCompras carrinho;
	
	@RequestMapping("/add")
	public ModelAndView add(Integer produtoId,  TipoPreco tipoPreco){
		ModelAndView modelAndView = new ModelAndView("redirect:/cart");
		CarrinhoItem carrinhoItem = criaItem(produtoId, tipoPreco);
		carrinho.add(carrinhoItem);
		return modelAndView ;
	}
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView itens(){
		return new ModelAndView("cart/itens");
	}
	
	private CarrinhoItem criaItem(Integer produtoId,  TipoPreco tipoPreco){
		Produto produto = produtoDAO.find(produtoId);
		CarrinhoItem carrinhoItem = new CarrinhoItem(produto, tipoPreco);
		return carrinhoItem;
	}
	
	@RequestMapping("/remover")
	public ModelAndView remover(Integer produtoId, TipoPreco tipoPreco){
	    carrinho.remover(produtoDAO.find(produtoId), tipoPreco);
	    return new ModelAndView("redirect:/cart");
	}
}

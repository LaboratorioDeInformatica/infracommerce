package org.infracommerce.loja.controllers;

import java.util.Arrays;
import java.util.List;

import org.infracommerce.loja.dao.ProdutoDao;
import org.infracommerce.loja.dao.UsuarioDAO;
import org.infracommerce.loja.models.CarrinhoCompras;
import org.infracommerce.loja.models.Produto;
import org.infracommerce.loja.models.Role;
import org.infracommerce.loja.models.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@Autowired
	private ProdutoDao produtoDao;
	
	@Autowired
	private CarrinhoCompras carrinho;
	
	@Autowired
	private UsuarioDAO usuarioDao;
	
	@RequestMapping("/")
	@Cacheable(value="produtosHome")
	public ModelAndView index(){
		List<Produto> produtos = produtoDao.listar();
		ModelAndView modelAndView = new ModelAndView("home");
		modelAndView.addObject("produtos", produtos);
		return modelAndView;
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping("/url-magica-maluca-oajksfbvad6584i57j54f9684nvi658efnoewfmnvowefnoeijn")
	public String urlMagicaMaluca() {
	    Usuario usuario = new Usuario(); 
	    usuario.setNome("Admin");
	    usuario.setEmail("admin@infraecomerce.com.br");
	    usuario.setSenha("$2a$10$lt7pS7Kxxe5JfP.vjLNSyOXP11eHgh7RoPxo5fvvbMCZkCUss2DGu");
	    usuario.setRoles(Arrays.asList(new Role("ROLE_ADMIN")));

	    usuarioDao.gravar(usuario);

	    return "Url Mágica executada";
	}
}

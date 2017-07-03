package org.infracommerce.loja.controllers;

import java.util.List;

import javax.validation.Valid;

import org.infracommerce.loja.dao.ProdutoDao;
import org.infracommerce.loja.infra.FileSaver;
import org.infracommerce.loja.models.Produto;
import org.infracommerce.loja.models.TipoPreco;
import org.infracommerce.loja.validation.ProdutoValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/produtos")
public class ProdutosController {

	@Autowired
	private ProdutoDao produtoDao;
	
	@InitBinder
	public void InitBinder(WebDataBinder binder){
	    binder.addValidators(new ProdutoValidation());
	}
	
	@Autowired
    private FileSaver fileSaver;
	
	@RequestMapping("/form")
    public ModelAndView form(Produto produto){

        ModelAndView modelAndView = new ModelAndView("produtos/form");
        modelAndView.addObject("tipos", TipoPreco.values());

        return modelAndView;
    }
	
	@RequestMapping(method=RequestMethod.POST)
	@CacheEvict(value="produtosHome", allEntries=true)
	public ModelAndView  grava( @Valid Produto produto ,BindingResult result, RedirectAttributes redirectAttributes ){
		
		/* String path = fileSaver.write("arquivos-sumario", sumario);
		    produto.setSumarioPath(path);*/
		
		if(result.hasErrors()){
	        return form(produto);
	    }
		
		produtoDao.gravar(produto);
		 redirectAttributes.addFlashAttribute("sucesso","Produto cadastrado com sucesso!");
		
		 return new ModelAndView("redirect:produtos");
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView listar(){
	    List<Produto> produtos = produtoDao.listar();
	    ModelAndView modelAndView = new ModelAndView("/produtos/lista");
	    modelAndView.addObject("produtos", produtos);
	    return modelAndView;
	}
	
	@RequestMapping("/detalhe/{id}")
	public ModelAndView detalhe(@PathVariable("id") Integer id){
		ModelAndView modelAndView  =  new ModelAndView("produtos/detalhe");
		Produto produto = produtoDao.find(id);
		modelAndView.addObject("produto", produto);
		return modelAndView;
	}
	
	
}

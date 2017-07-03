package org.infracommerce.loja.controllers;

import java.util.concurrent.Callable;

import org.infracommerce.loja.models.CarrinhoCompras;
import org.infracommerce.loja.models.DadosPagamento;
import org.infracommerce.loja.models.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
@RequestMapping("/pagamento")
@Controller
public class PagamentoController {

  @Autowired
  private CarrinhoCompras carrinho;
  
  @Autowired
  private CarrinhoCompras carrinhoCompras;
  
  

  @Autowired
  private RestTemplate restTemplate;

  @Autowired
  private MailSender sender;

  @RequestMapping(value="/finalizar", method=RequestMethod.POST)
  public Callable<ModelAndView> finalizar(@AuthenticationPrincipal Usuario usuario, 
      RedirectAttributes model) {
    return () -> {
     

      try {
        String response = "Compra Realizada com sucesso";
        System.out.println(response);

      //  enviaEmailCompraProduto(usuario);
        carrinho.removerAll();
        model.addFlashAttribute("sucesso", response);
        return new ModelAndView("redirect:/produtos");
      } catch (HttpClientErrorException e) {
        e.printStackTrace();
        model.addFlashAttribute("falha", "Valor maior que o permitido");
        return new ModelAndView("redirect:/produtos");
      }
      
      
    };
  }

  private void enviaEmailCompraProduto(Usuario usuario) {
    SimpleMailMessage email = new SimpleMailMessage();

    email.setSubject("Compra finalizada com sucesso");
   // email.setTo(usuario.getEmail());
    email.setTo("hashimotodiego@hotmail.com");
    email.setText("Compra aprovada com sucesso no valor de " + carrinho.getTotal());
    email.setFrom("compras@infracommerce.com.br");

    sender.send(email);
  }

}
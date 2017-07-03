<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<tags:pageTemplate titulo="Seu carrinho de compras">
 
 
	
	<jsp:attribute name="extraScripts">
        <script> console.log("Finalização de compra de ${carrinhoCompras.quantidade} itens"); </script>
    </jsp:attribute>
	
	<jsp:body>
	<c:url value="/" var="contextPath" />
	<section class="container middle">
		  <h2 id="cart-title">Seu carrinho de compras </h2>
		  
		  
		    <table id="cart-table">
		      <colgroup>
		        <col class="item-col"/>
		        <col class="item-price-col"/>
		        <col class="item-quantity-col"/>
		        <col class="line-price-col"/>
		        <col class="delete-col"/>
		      </colgroup>
		      <thead>
		        <tr>
		          <th class="cart-img-col"></th>
		          <th width="65%">Item</th>
		          <th width="10%">Preço</th>
		          <th width="10%">Quantidade</th>
		          <th width="10%">Total</th>
		          <th width="5%"></th>
		        </tr>
		      </thead>
		      <tbody>
		      <c:forEach items="${carrinhoCompras.itens}" var="item">
			      <tr>
			          <td class="cart-img-col"><img src="${contextPath}resources/imagens/carrinho.jpg" width="71px" height="100px" 
    style="margin-left: 25px;"
			          /></td>
			          <td class="item-title">${item.produto.titulo}</td>
			          <td class="numeric-cell">${item.preco}</td>
			          <td class="quantity-input-cell"><input type="number" min="0" readonly="readonly" id="quantidade"
			           name="quantidade" value="${carrinhoCompras.getQuantidade(item)}"/></td>
			          <td class="numeric-cell"> ${carrinhoCompras.getTotal(item)}</td>
			          <td class="remove-item">
				        <form:form  servletRelativeAction="${s:mvcUrl('CCC#remover').arg(0, item.produto.id).arg(1,item.tipoPreco).build() }" method="post">
				          
				          	 <input type="submit" value="excluir">
				          </form:form >
			          </td>
			         
			      </tr>
			  </c:forEach>
		      </tbody>
			      <tfoot>
			        <tr>
			          <td colspan="1">
			          	<form:form  action="${s:mvcUrl('PC#finalizar').build()}" method="post">
			          			<input type="submit" class="checkout" name="checkout" value="Finalizar compra" /></td>
			         	</form:form >
			          <td class="quantity-input-cell"><input type="submit" class="update-cart" disabled="disabled" name="update" value=""/></td>
			          <td class="numeric-cell"> ${carrinhoCompras.total} </td>
			          <td>
			          </td>
			          <td></td><td></td>
			        </tr>
			      </tfoot>
		    </table>
		  
		  <h2>Ja conhece nossos outros produtos?</h2>
		  <ul id="collection" class="related-books">          
		          
		  </ul>
		  
		  <h2><a href="${s:mvcUrl('HC#index').build() }">Veja nossos produtos!</a></h2>
		</section> 
	</jsp:body>
</tags:pageTemplate>
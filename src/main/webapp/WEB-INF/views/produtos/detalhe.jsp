<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="${produto.titulo}">
<c:url value="/" var="contextPath" />
    <article id="${produto.id}">
        <header id="product-highlight" class="clearfix">
       
            <div id="product-overview" class="container">
                <img width="280px" height="395px" src="${contextPath}resources/imagens/carrinho.jpg"  class="product-featured-image" />
                <h1 class="product-title">${produto.titulo}</h1>
                <p class="product-author">
                    <span class="product-author-link"></span>
                  </p>    
                <p class="book-description"> ${produto.descricao}</p>
            </div>
        </header>
        <section class="buy-options clearfix">  
            <form:form servletRelativeAction="/cart/add" method="post" cssClass="container">
                <ul id="variants" class="clearfix">
                    <input type="hidden" name="produtoId" value="${produto.id}" />
                    <c:forEach items="${produto.precos}" var="preco">
                        <li class="buy-option">
                            <input type="radio" name="tipoPreco" class="variant-radio" id="tipo" value="${preco.tipo}"  checked="checked"  />
                            <label  class="variant-label"> ${preco.tipo} </label>
                            <small class="compare-at-price">R$ 39,90</small>
                            <p class="variant-price">${preco.valor}</p>
                          </li>
                    </c:forEach>           
                </ul>
                <button type="submit" class="submit-image icon-basket-alt" alt="Compre Agora" title="Compre Agora ${produto.titulo}"></button>
              </form:form>
        </section>
        <div class="container">
              <section class="summary">
               
              </section>
              <section class="data product-detail">
                <h2 class="section-title">Dados do Produto:</h2>

              </section>
        </div>
    </article>    

</tags:pageTemplate>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="Livros, Celulares, Ferramentas e etc">
 <c:url value="/" var="contextPath" />
    <section id="index-section" class="container middle">
        <h1 class="cdc-call">Últimos dias com os preços promocionais. Aproveite!</h1>
        <ul class="clearfix book-collection">
            <c:forEach items="${produtos}" var="produto">
            <li>
                <a href="${s:mvcUrl('PC#detalhe').arg(0, produto.id).build()}" class="block clearfix">
                    <h2 class="product-title">${produto.titulo}</h2>
                    <img width="143" height="202"
                        src="${contextPath}resources/imagens/carrinho.jpg"
                        alt="Produtos" title="Produtos" />
                    <small class="buy-button">Compre</small>
                </a>
            </li>
            </c:forEach>
        </ul>

        <h2 class="cdc-call">Aenean placerat. In vulputate urna eu arcu.</h2>
        <ul id="cdc-diferenciais" class="clearfix">
            <li class="col-left">
                <h3> Duis viverra diam non justo. In nisl. Nullam sit amet</h3>
                <p>
                    <span class="sprite" id="sprite-drm"></span> 
                   Aliquam erat volutpat. Suspendisse potenti. Morbi mattis felis at nunc. Duis viverra diam non justo. In nisl. Nullam sit amet
                </p>
            </li>
            <li class="col-right">
                <h3> Duis viverra diam non justo. In nisl. Nullam sit amet</h3>
                <p>
                    <span class="sprite" id="sprite-renome"></span> 
                    Aliquam erat volutpat. Suspendisse potenti. Morbi mattis felis at nunc. Duis viverra diam non justo. In nisl.
                </p>
            </li>
            <li class="col-left">
                <h3>Duis viverra diam non justo. In nisl.</h3>
                <p>
                    <span class="sprite" id="sprite-atualizacoes"></span> 
                    Aliquam erat volutpat. Suspendisse potenti. Morbi mattis felis at nunc. Duis viverra diam non justo. In nisl.
                </p>
            </li>
            <li class="col-right">
                <h3>Duis viverra diam non justo. In nisl.</h3>
                <p>
                    <span class="sprite" id="sprite-caelum"></span> 
                   Duis viverra diam non justo. In nisl.Duis viverra diam non justo. In nisl.
                </p>
            </li>
        </ul>
    </section>

</tags:pageTemplate>
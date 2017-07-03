<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
    	
    	<c:url value="/resources/css" var="cssPath" />
		<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" />
		<link rel="stylesheet" href="${cssPath}/bootstrap-theme.min.css" />
		
		<style type="text/css">
        body{
            padding-top: 60px;
        }
    </style>
		
        <meta charset="UTF-8">
        <title>Celular, Notebooks, Livros, Ferramentas e etc - InfraCommerce</title>
    </head>
   <body>
   
 <nav class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
        <a class="navbar-brand" href="${s:mvcUrl('HC#index').build() }">InfraCommerce</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="${s:mvcUrl('PC#listar').build()}">Lista de Produtos</a></li>
        <li><a href="${s:mvcUrl('PC#form').build()}">Cadastro de Produtos</a></li>
    </ul>
    </div><!-- /.navbar-collapse -->
  </div>
</nav>
  
  
  
   
   <div class="container">
   <h1>Lista de Produtos</h1>
   <p> ${sucesso} </p>
    <p> ${falha} </p>
    <table class="table table-bordered table-striped table-hover">
    <tr>
        <th>Título</th>
        <th>Descrição</th>
        <th>Preços</th>
    </tr>

    <c:forEach items="${produtos}" var="produto">
        <tr>
          <td>
          <a href="${s:mvcUrl('PC#detalhe').arg(0, produto.id).build()}">${produto.titulo}</a>
          </td>
            <td>${produto.descricao}</td>
            <td>${produto.precos}</td>
        </tr>
    </c:forEach>
</table>
</div>
</body>
</html>
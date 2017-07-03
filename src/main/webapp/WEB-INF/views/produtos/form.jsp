<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<c:url value="/resources/css" var="cssPath" />
		<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" />
		<link rel="stylesheet" href="${cssPath}/bootstrap-theme.min.css" />
		
		<style type="text/css">
        body{
            padding: 60px 0px;
        }
    </style>
    	
<meta charset="UTF-8">
<title>Produtos</title>
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
      <a class="navbar-brand" href="${s:mvcUrl('HC#index').build() }">Home</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="${s:mvcUrl('PC#listar').build()}">Lista de Produtos</a></li>
        <li><a href="${s:mvcUrl('PC#form').build()}">Cadastro de Produtos</a></li>
    </ul>
    
    <ul class="nav navbar-nav navbar-right">
 	 <li><a href="#"><security:authentication property="principal" var="usuario"/>
 	 Usuario: ${usuario.username}
 	 </a></li>
	</ul>
    
    </div><!-- /.navbar-collapse -->
  </div>
</nav>
  
  
  
   
   <div class="container">
		<h1>Cadastro de Produtos</h1>
	<form:form action="${ s:mvcUrl('PC#grava').build() }" method="post" commandName="produto" enctype="multipart/form-data">
    <div class="form-group">
        <label>Título</label> 
        <form:input path="titulo" cssClass="form-control"/>
        <form:errors path="titulo" />
    </div>
   <div class="form-group">
        <label>descricao</label>
        <form:textarea  path="descricao"  cssClass="form-control" />
        <form:errors path="descricao" />
    </div>
   
    <c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
        <div>
            <label>${tipoPreco}</label> 
            <form:input path="precos[${status.index}].valor"  cssClass="form-control" /> 
            <form:hidden path="precos[${status.index}].tipo" value="${tipoPreco}" />
        </div>
    </c:forEach>
    
    
    <button type="submit" class="btn btn-primary">Cadastrar</button>
</form:form>
</div>
</body>
</html>
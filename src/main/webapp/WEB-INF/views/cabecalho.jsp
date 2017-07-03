<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>${produto.titulo} - Infracommerce</title>

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
	<c:url value="/" var="contextPath" />
    <link href="https://plus.googlecom/108540024862647200608" rel="publisher"/>
    <link href="${contextPath}resources/css/cssbase-min.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700'
			rel='stylesheet'/>
		<link href="${contextPath}resources/css/fonts.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/fontello-ie7.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/fontello-embedded.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/fontello.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/style.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/layout-colors.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/responsive-style.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/guia-do-programador-style.css" 
			rel="stylesheet" type="text/css"  media="all"  />
	    <link href="${contextPath}resources/css/produtos.css" 
	    	rel="stylesheet" type="text/css"  media="all"  />
	    	<link href="${contextPath}resources/css/book-collection.css"
			rel="stylesheet" type="text/css" media="all" />
		
</head>
<body>

<header id="layout-header">
    <div class="clearfix container">
        <a href="${s:mvcUrl('HC#index').build()}" id="logo">
                            <img src="${contextPath}resources/imagens/logo.png" />
        </a>
        <div id="header-content">
            <nav id="main-nav">
                <ul class="clearfix">
                    <li>
                        <a href="${s:mvcUrl('CCC#itens').build()}" rel="nofollow"> 
                           
                            <s:message code="menu.carrinho"
                            arguments="${carrinhoCompras.quantidade}"/>
                        </a>
                    </li>
                    <li><a href="#" rel="nofollow"> <fmt:message key="menu.sobre"/></a></li>
                  	
					<li>
					    <a href="?locale=pt" rel="nofollow">
					        <fmt:message key="menu.pt"/>
					    </a>
					</li>
					
					<li>
					    <a href="?locale=en_US" rel="nofollow">
					        <fmt:message key="menu.en"/>
					    </a>
					</li>
					                  
                </ul>
            </nav>
        </div>
    </div>
</header>
<nav class="categories-nav">
    <ul class="container">
        <li class="category"><a href="${s:mvcUrl('CCC#itens').build()}"> 
         <fmt:message key="navegacao.categoria.home"/> </a></li>
        <li class="category"><a href="#">
                <fmt:message key="navegacao.categoria.celular"/> </a>
       </li>
        <li class="category"><a href="#">
                <fmt:message key="navegacao.categoria.ferramentas"/></a>
       </li>
        <li class="category"><a href="#">
                <fmt:message key="navegacao.categoria.brinquedos"/></a>
       </li>
        <li class="category"><a href="#">
                <fmt:message key="navegacao.categoria.livro"/> </a>
       </li>
        <li class="category"><a href="#">
                <fmt:message key="navegacao.categoria.roupas"/> </a>
       </li>
        <li class="category"> <a href="#"> 
         <fmt:message key="navegacao.categoria.outros"/> </a>
        </li>
    </ul>
</nav>
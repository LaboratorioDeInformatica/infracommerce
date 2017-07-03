
<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ attribute name="bodyClass" required="false"%>
<%@ attribute name="titulo" required="true"%>
<%@ attribute name="extraScripts" fragment="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <title>${titulo} - Infracommerce</title>
	<link href="https://plus.googlecom/108540024862647200608" rel="publisher"/>
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'/>
  
</head>
<body class="${bodyClass}">

    <%@ include file="/WEB-INF/views/cabecalho.jsp" %>

    <jsp:doBody />
    
    <jsp:invoke fragment="extraScripts"></jsp:invoke>

    <%@ include file="/WEB-INF/views/rodape.jsp" %>

</body>
</html>
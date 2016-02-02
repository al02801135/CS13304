<%-- Directiva --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Saludo</title>
</head>
	<body>
		<%--Expresión --%>
		<h3>Hola <%=request.getParameter("nombre")%></h3>
		<p>Este es un servlet que imprime contenido en HTML</p>
		
	</body>
</html>
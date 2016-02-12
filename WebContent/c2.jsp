<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><c:out value="${initParam.tema}" /></title>
</head>
<body>
	<h2>Out, set:</h2>
	<ol>
		<li>Trata de acceder a la variable <b>texto</b> en los parámetros de la solicitud. 
			<b><c:out value="${param.texto}" default="Variable \"texto\" sin definir" /></b>
		</li>
		<li>Crea una nueva variable <b>texto2</b> a base del param <b>texto</b>.
			<c:set value="${param.texto}" var="texto2" scope="page"/>
		</li>
		<li>Accede a <b>texto2</b>:
			<c:out value="${pageScope.texto2}" default="Variable \"texto2\" sin definir"/>
		</li>
	</ol>
</body>
</html>
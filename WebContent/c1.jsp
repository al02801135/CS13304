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
	<h2>Out, set, remove:</h2>
	<ol>
		<li>Trata de acceder a la variable <b>texto2</b> la cual no se ha
			definido: <c:out value="${texto2}" default="Variable \"texto2\" sin definir" />
		</li>
		<li>Define variable <b>texto</b> con scope <b>page</b>: 
			<c:set var="texto" scope="page" 
			value="Variable \"texto\" definida por medio de c:set" />
		</li>
		<li>Trata de acceder la variable definida <b>texto</b>. 
			<c:out value="${texto}" default="Variable texto." />
		</li>
		<li>Borra la variable <b>texto</b> del scope <b>page</b>. 
			<c:remove var="texto" scope="page" />
		</li>
		<li>Accede la variable <b>texto</b> que se ha borrado: 
			<c:out value="${texto}" default="Variable \"texto\" no definida. Borrada por c:remove " />
		</li>
	</ol>
</body>
</html>
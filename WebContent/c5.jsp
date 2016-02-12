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
	<h2>forEach</h2>
	<ul>
		<c:forEach var="i" begin="0" end="${param.n}">
			<li>Elemento <c:out value="${i}"/></li>
		</c:forEach>
	</ul>
	<h2>forTokens</h2>
		<c:if test="${not empty param.cadena}" >
			<p>Cadena ${param.cadena} </p>
			<ul>
				<c:forTokens items="${param.cadena}" delims="|" var="elemento">
					<li><c:out value="${elemento}"/></li>
				</c:forTokens>
			</ul>
		</c:if>
		<c:if test="${empty param.cadena}" >
			<ul>
				<li>Falta parámetro "cadena"</li>
			</ul>	
		</c:if>
	
</body>
</html>
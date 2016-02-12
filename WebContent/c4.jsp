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
	<h2>Set, choose, when, otherwise</h2>
	<c:set var="color" value="${param.color}" />
	
	<c:choose>
		<c:when test="${color == 'rojo'}">
			<font color="red">
		</c:when>
		<c:when test="${color == 'azul'}">
			<font color="blue">
		</c:when>
		<c:otherwise>
			<font color="green">
		</c:otherwise>
	</c:choose>
	${initParam.tema}
	</font>
</body>
</html>
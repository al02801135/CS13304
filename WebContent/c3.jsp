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
	<h2>Set, URL, import</h2>
	<ol>
		<li>Trata de acceder a la variable <b>url</b> en los parámetros de la solicitud.
			definido: 
			<c:out value="${param.url}" default="Variable \"url\" sin definir" />
		</li>
		<li>Incluye URL:
			<c:url value="${param.url}">
				<c:param name="source" value="${initParam.tema}"/>
			</c:url>
			<c:import url="${param.url}" charEncoding="UTF-8"/>
		</li>
	</ol>
</body>
</html>
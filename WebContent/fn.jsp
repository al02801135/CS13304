<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${initParam.tema}</title>
<%-- 1. Valida que el parámetro texto se encuentre en la solicitud --%>
<c:set var="texto" value="${not empty param.texto ? param.texto : '' }"/>
<%-- 2. Define variable lorem como placeholder del textarea --%>
<c:set var="lorem" value="Lorem ipsum dolor sit amet, consectetur adipiscing elit."/>
</head>
<body>
<form>
	<label for="texto">Texto</label>
	<%-- 3. Si la variable texto no es vacío, lo asigna como contenido al textarea --%>
	<textarea name="texto"placeholder="${lorem }">${not empty texto ? texto : '' }</textarea>
	<input type="submit">
</form>
<h3>${initParam.tema}</h3>
<ul>
	<%-- 4. Demostración de algunas funciones --%>
	<li>toUpperCase: ${fn:toUpperCase(texto)}</li>
	<li>toLowerCase: ${fn:toLowerCase(texto)}</li>
	<li>contains: ${fn:contains(texto, 'texto')}</li>
	<li>split y length: ${fn:length(fn:split(texto, ' ')) } 
		<ul><c:forEach var="i" items="${fn:split(texto, ' ')}"><li>${i}</li></c:forEach></ul>
	</li>
	<li>join: ${fn:join(fn:split(texto, ' '), '-') }</li>
	<li>replace: ${fn:replace(texto, ' ', '_') }</li>
	<li>escapeXml: ${fn:escapeXml(texto)}</li>
</ul>
</body>
</html>
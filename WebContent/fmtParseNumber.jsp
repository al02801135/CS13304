<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${initParam.tema}</title>
<%-- 
	1. Obtiene el parámetro de la solicitud si existe para
	formatear, con el formato ¤#####.###, es decir 
	¤ moneda, # dígitos, '.' separador decimal y # tres
	números decimales
	
--%>
<c:if test="${not empty param.ahorros }">
	<fmt:parseNumber value="${param.ahorros }" 
	pattern="¤#####.###" var="ahorros"/>
</c:if>
<c:if test="${ empty param.ahorros }">
	<c:set var="ahorros" value="0"/>
</c:if>
</head>
<body>
<%-- 
	2. Define variable meta para referencia
 --%>
<c:set var="meta" value="35000"/>
<h3>parseNumber de currency</h3>
<%-- 
	3. 	tag formatNumber con tipo currency
--%>
<form>
	<label for="ahorro">Cantidad ahorrada de 
	<fmt:formatNumber value="${meta}" type="currency"/> </label>
	<input type="text" name="ahorros" 
		placeholder="$#####.###" 
		value="${not empty param.ahorros ? param.ahorros : ''}"/>
	<input type="submit" value="Enviar"/>
</form>
<h3>formatNumber currency</h3>
<ul>
	<li>Tipo Currency locale: <fmt:formatNumber value="${ahorros}" type="currency"/></li>
	<li>Tipo Currency USD: <fmt:formatNumber value="${ahorros}" type="currency" currencyCode="USD"/></li>
	<li>Tipo Currency MXN: <fmt:formatNumber value="${ahorros * 18.83}" type="currency" currencyCode="MXN"/></li>
	<li>Tipo Currency CAD: <fmt:formatNumber value="${ahorros * 1.38}" type="currency" currencyCode="CAD"/></li>
</ul>
<h3>formatNumber number y percentage</h3>
<ul>
<%--
	4. tag formatNumber con tipo number y percent
 --%>
	<li>Tipo number y minFractionDigits 5: <fmt:formatNumber value="${ahorros}" type="number" minFractionDigits="5"/></li>
	<li>Tipo percent sin atributos: <fmt:formatNumber value="${ahorros/meta}" type="percent"/></li>
	<li>Tipo percent y minFractionDigits 2: <fmt:formatNumber value="${ahorros/meta}" type="percent" minFractionDigits="2"/></li>
</ul>
</body>
</html>
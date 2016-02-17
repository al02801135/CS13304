<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page errorPage="error.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${initParam.tema}</title>
</head>
<body>
<%-- 
	1. Define variables ahorros y meta
 --%>
<c:set var="ahorros" value="15485.50"/>
<c:set var="meta" value="35000"/>
<%-- 
    1 US Dollar equals 18.83 Mexican Peso
	1 US Dollar equals 1.38 Canadian Dollar
 --%>
<h3>formatNumber moneda</h3>
<%-- 
	2. Tag formatNumber con diferentes prefijos 
	valores de moneda. Note que el tipo de cambio no es 
	proporcionado por el tag.
 --%>
<ul>
	<li>Tipo Currency locale: <fmt:formatNumber value="${ahorros}" type="currency"/></li>
	<li>Tipo Currency USD: <fmt:formatNumber value="${ahorros}" type="currency" currencyCode="USD"/></li>
	<li>Tipo Currency MXN: <fmt:formatNumber value="${ahorros * 18.83}" type="currency" currencyCode="MXN"/></li>
	<li>Tipo Currency CAD: <fmt:formatNumber value="${ahorros * 1.38}" type="currency" currencyCode="CAD"/></li>
</ul>
<h3>formatNumber number y percentage</h3>
<ul>
<%--
	3. tag formatNumber con tipo number y percent
 --%>
	<li>Tipo number y minFractionDigits 5: <fmt:formatNumber value="${ahorros}" type="number" minFractionDigits="5"/></li>
	<li>Tipo percent sin atributos: <fmt:formatNumber value="${1-ahorros/meta}" type="percent"/></li>
	<li>Tipo percent y minFractionDigits 2: <fmt:formatNumber value="${1- ahorros/meta}" type="percent" minFractionDigits="2"/></li>
</ul>
</body>
</html>
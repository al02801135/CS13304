<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${initParam.tema}</title>
<%-- 
	1. Obtiene objeto de java.util.Date el cual será usado
	 en caso que no se reciba ningun valor en el parámetro
	 fechaHora dentro de la solicitud. 
	
--%>
<jsp:useBean id="ahora" class="java.util.Date" />
<c:if test="${not empty param.fechaHora }">
	<fmt:parseDate value="${param.fechaHora }" pattern="yyyy-MM-dd HH:mm:ss" var="fechaHora"/>
</c:if>
<c:if test="${ empty param.fechaHora }">
	<c:set var="fechaHora" value="${ahora }"/>
</c:if>
</head>
<body>
<h3>parseDate</h3>
<form>
	<label for="fechaHora">Fecha y hora</label>
	<input type="text" name="fechaHora" 
		placeholder="yyyy-MM-dd HH:mm:ss" 
		value="${not empty param.fechaHora ? param.fechaHora : ''}"/>
	<input type="submit" value="Enviar"/>
</form>
<ul>
	<%-- 2. Imprime la fecha y hora sin formato, 
		solo su representación en string --%>
	<li>DateTime Sin formato: <c:out value="${fechaHora}"/></li>
	<%-- 3. Del objeto 'fechaHora' solo imprime el tiempo --%>
	<li>Sólo tiempo: <fmt:formatDate type="time" value="${fechaHora}" /></li>
	<%-- 4. Del objeto 'fechaHora' sólo imprime la fecha --%>
	<li>Sólo fecha: <fmt:formatDate type="date" value="${fechaHora}" /></li>
	<%-- 5. Del objeto 'fechaHora' sólo imprime el tiempo en su formato largo --%>
	<li>Sólo tiempo: <fmt:formatDate value="${fechaHora}" type="time" timeStyle="long" /></li>
	<%-- 6. Del objeto 'fechaHora' sólo imprime la fecha en formato corto --%>
	<li>Sólo fecha: <fmt:formatDate value="${fechaHora}" type="date" dateStyle="short" /></li>
	<%-- 7. Formatea el fechaHora 'ahora' con el patrón indicado --%>
	<li>Con patrón: <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss z" value="${fechaHora}" /></li>
	<%-- 8. Formatea el 'fechaHora' ahora con el patrón 
			indicado y con diferente zona horaria --%>
	<li>Zona horaria: <fmt:formatDate value="${fechaHora}" 
							pattern="yyyy-MM-dd HH:mm:ss z" 
							timeZone="US/Central"/></li>
</ul>
</body>
</html>
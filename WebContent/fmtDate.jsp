<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${initParam.tema}</title>
</head>
<body>
<%--
	1. Define variable ahora con la fecha y hora actual
 --%>
<c:set var="ahora" value="<%=new java.util.Date()%>" />
<h3>formatDate</h3>
<ul>
	<%-- 2. Imprime la fecha y hora sin formato, 
		solo su representación en string --%>
	<li>DateTime Sin formato: <c:out value="${ahora}"/></li>
	<%-- 3. Del objeto 'ahora' solo imprime el tiempo --%>
	<li>Sólo tiempo: <fmt:formatDate type="time" value="${ahora}" /></li>
	<%-- 4. Del objeto 'ahora' sólo imprime la fecha --%>
	<li>Sólo fecha: <fmt:formatDate type="date" value="${ahora}" /></li>
	<%-- 5. Del objeto 'ahora' sólo imprime el tiempo en su formato largo --%>
	<li>Sólo tiempo: <fmt:formatDate value="${ahora}" type="time" timeStyle="long" /></li>
	<%-- 6. Del objeto 'ahora' sólo imprime la fecha en formato corto --%>
	<li>Sólo fecha: <fmt:formatDate value="${ahora}" type="date" dateStyle="short" /></li>
	<%-- 7. Formatea el objeto 'ahora' con el patrón indicado --%>
	<li>Con patrón: <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss z" value="${ahora}" /></li>
	<%-- 8. Formatea el 'ahora' ahora con el patrón 
			indicado y con diferente zona horaria --%>
	<li>Zona horaria: <fmt:formatDate value="${ahora}" 
							pattern="yyyy-MM-dd HH:mm:ss z" 
							timeZone="US/Central"/></li>
</ul>
</body>
</html>
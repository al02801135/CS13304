<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Date" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${initParam.tema}</title>
<%-- 
	1. Obtiene objeto de java.util.Date como referencia
	
--%>
<jsp:useBean id="ahora" class="java.util.Date" />
<%-- 
	2. Obtiene una lista de los IDs
	 disponibles de las TimeZones --%>
<c:set var="timeZones" value="<%=java.util.TimeZone.getAvailableIDs() %>"/>
<body>
<h3>TimeZone, parseDate</h3>
<%-- 3. Imprime el valor formateado de 'ahora' --%>
<p>Ahora: <strong><fmt:formatDate value="${ahora}" 
					pattern="yyyy-MM-dd HH:mm:ss z"/></strong> 
	y procesará en <strong>${fn:length(timeZones)}</strong> zonas horarias.</p>
<ul>
<%-- 
	4. Itera los elementos de timeZones para formatear
	 'ahora' de acuerdo al id. 
--%>
	<c:forEach var="zone" items="${timeZones}">
		<li>${zone}: 
		<fmt:timeZone value="${zone}">
			<fmt:formatDate value="${ahora}" timeZone="${zone}"
	              pattern="yyyy-MM-dd HH:mm:ss z" />
		</fmt:timeZone></li>
	</c:forEach>
</ul>
</body>
</html>
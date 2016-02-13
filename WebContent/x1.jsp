<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${initParam.tema}</title>
</head>
<body>
	<h2>Parse, forEach, out:</h2>
	<c:set var="urlRSS" value="http://aristeguinoticias.com/feed/"/>
	<p>Últimos artículos de ${urlRSS}:</p>
	<c:import url="${urlRSS }" var="xmlRSS" charEncoding="UTF-8"/>
	<x:parse doc="${xmlRSS}" var="parsedDoc"/>
	<ul>
		<x:forEach select="$parsedDoc/rss/channel/item" var="item">
			<c:set var="item_link">
				<x:out select="link"/>
			</c:set>
			<li><a href="${item_link}"><x:out select="title" /></a> - 
			<x:out select="description" /> -
			Publicado: <x:out select="pubDate" /></li>
		</x:forEach>
	</ul>
</body>
</html>
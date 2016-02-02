<%-- Directivas --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ page import="java.util.Random,java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Saludo</title>
</head>
	<%--Declaración --%>
	<%! 
		int numerosInt = new Integer(10); 
		ArrayList<Integer> randomList = new ArrayList<Integer>();
		Random rand = new Random(); 
		int[] randomNum = new int[10];
	%>
	<body>
		<%--Expresión --%>
		<h3>Hola <%=request.getParameter("nombre")%></h3>
		
		<%--Scriptlet --%>
		<% 
			String numerosStr = request.getParameter("n");
			if (numerosStr != null) 
				numerosInt = Integer.parseInt(numerosStr);
			randomNum = new Random().ints(1, 100).distinct().limit(numerosInt).toArray();
		%>
		<p>Este es un servlet que imprime contenido <%=randomNum.length%> números aleatorios</p>
		<ul>
		<%--Scriptlet --%>
			<% for (int i: randomNum) {%>
				<%--Expresión --%>
				<li><%=i %></li>
				<% randomList.add(i); %>
			<% } %>
		</ul>
	</body>
</html>
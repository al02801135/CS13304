<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Saludo</title>
</head>
<body>
	<h3><%=request.getAttribute("saludo") %></h3>
	<p>Generado  <%=request.getAttribute("fecha") %></p>
</body>
</html>
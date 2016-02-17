<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${initParam.tema}</title>
</head>
<body>
<%-- 1. Define URL de conexión --%>
<c:set var="url" 
value="jdbc:sqlite:/path/completo/codigo/CS13304/WebContent/db/Chinook_Sqlite.sqlite"/>
<%-- 2. Crea referencia dataSource en URL con SQLite--%>
<sql:setDataSource var="db1" driver="org.sqlite.JDBC"
     url="${url}"/>
 <%-- 3. Crea query --%>
<sql:query dataSource="${db1}" var="consulta">
select * from employee
</sql:query>
<h3>setDataSource, query</h3>
<ul>
<%--  4. Itera resultados  --%>
	<c:forEach items="${consulta.rows }" var="element">
		<li>(${element.EmployeeId }) ${element.FirstName} ${element.LastName}: ${element.BirthDate }: 
	</c:forEach>
</ul>

</body>
</html>
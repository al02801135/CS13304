<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 
     1. Validar si existe el parámetro locale, variable locale o
     pageContext.request.locale para asignarlo en la variable
     locale 
--%>
<c:set var="locale" 
	value="${not empty param.locale ? param.locale : not empty locale ? locale : pageContext.request.locale}" 
	scope="page" />
<%-- 
     2. Configurar el locale de acuerdo al 
     contenido de la variable locale.
--%>
<fmt:setLocale value="${locale}" />
<%--
	3. Carga el bundle de acuerdo al locale asignado previamente
	con la estructura paquete.nombreDeArchivo
 --%>
<fmt:setBundle basename="me.jmll.i18n.login"/>
<html lang="${locale}">

<head>
        <title>${initParam.tema}</title>
</head>
    <body>
    <h2>setLocale, setBundle, message</h2>
    <%--
    	4. Obtiene el mensaje login.locale.text y agrega el parámetro
    	{0} con valor ${ pageContext.request.locale }
     --%>
    <p><fmt:message>
    	login.locale.text
    	<fmt:param value="${ pageContext.request.locale }"/>
    </fmt:message> 
    <%--
    	5. Valida que la variable sea diferente al contenido
    	del locale del cliente. Si es así, imprime el contenido 
    	de la variable locale.
     --%>
    <c:if test="${locale != pageContext.request.locale}" >
    	(<c:out value="${locale}"/>) 
    </c:if>.</p>
    <%-- 
		6. Configura idioma manualmente y envía el formulario en 
		cuanto cambie el valor del elemento select. Obtiene la llave
		login.lang.label
    --%>
        <form name="lang-form">
            <label for="locale"> <fmt:message key="login.lang.label" />:</label>
            <select id="locale" name="locale" onchange="submit()">
                <option value="en" ${locale == 'en' ? 'selected' : ''}>English</option>
                <option value="fr" ${locale == 'fr' ? 'selected' : ''}>French</option>
                <option value="es" ${locale == 'es' ? 'selected' : ''}>Español</option>
            </select>
        </form>
        <%--
        	7. Obtiene las llaves adecuadas para las etiquetas de los elementos
        	de login, además del texto para el link de recuperar contraseña y
        	el mensaje del betón para enviar los datos.
         --%>
        <form method="post">
            <label for="username"><fmt:message key="login.username.label" />:</label>
            <input type="text" id="username" name="username">
            <br>
            <label for="password"><fmt:message key="login.password.label" />:</label>
            <input type="password" id="password" name="password">
            <br>
            <a href="#"><fmt:message key="login.help.text"/></a>
            <br>
            <fmt:message key="login.submit.button" var="buttonValue" />
            <input type="submit" name="submit" value="${buttonValue}">
        </form>

    </body>
</body>
</html>
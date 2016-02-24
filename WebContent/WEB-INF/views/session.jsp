<%@ taglib prefix="b" tagdir="/WEB-INF/tags/bootstrap" %>
<%@ include file="/WEB-INF/includes/base.jsp" %>

<b:base title="${initParam.tema}">
	<div class="container">
		<h1>Session</h1>
		<ul>
			<li>Session Id: <strong>${sessionScope.sessionId }</strong></li>
			<li>Creation Time: <strong>${sessionScope.creationTime}</strong></li>
			<li>Last Accessed Time: <strong>${sessionScope.lastAccessedTime}</strong></li>
			<li>Max Inactive Interval: <strong>${sessionScope.maxInactiveInterval}</strong></li>
			<li>Visits: <strong>${sessionScope.visits }</strong></li>
		</ul>
		<h1>Cookies</h1>
		<ul>
			<c:forEach var="ck" items="${cookie}">
				<li>${ck.key}: <strong>${ck.value.value}</strong></li>
			</c:forEach>
		</ul>
	</div>
</b:base>
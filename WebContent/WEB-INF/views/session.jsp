<log:setLogger logger="me.jmll.controller.Session" />
<log:entry/>
<b:base title="${initParam.tema}">
	<log:debug message="Hit por SessionID: ${sessionScope.sessionId }"/>
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
		<log:info message="Cantidad de cookies ${fn:length(cookie)}"/>
			<c:forEach var="ck" items="${cookie}">
				<li>${ck.key}: <strong>${ck.value.value}</strong></li>
			</c:forEach>
		</ul>
	</div>
</b:base>
<log:exit/>
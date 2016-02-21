<%@ taglib prefix="b" tagdir="/WEB-INF/tags/bootstrap" %>

<b:base title="Hello Bootstrap" lang="en_US">
	<%-- TagFile Container <div class="container|container-fluid"> --%>
	<b:container fluid="false">
	<%-- TagFile pageHeader <div class="page-header"> --%>
	<b:pageHeader title="CS13304" subTitle="Tema 6"/>
	<%-- TagFile jumbotron <div class="jumbotron"> --%>
		<b:jumbotron title="Actividad 1">
			Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec sapien at 
			lectus aliquam scelerisque vel nec massa. 
			Donec eget dolor sollicitudin arcu sagittis auctor. Duis nec orci tristique, 
			pretium mauris vitae, pretium arcu.
		</b:jumbotron>
		<%-- TagFile jumbotron <div class="alert alert-success|warning|danger|info" >--%>
		<b:alert type="success" dismissable="true">Success Alert! </b:alert>
		<b:alert type="info" dismissable="false">Informational Alert!</b:alert>
		<b:alert type="danger" dismissable="true" fadeIn="true">
			Danger Error! Click <a href="#">here</a> to debug.
		</b:alert>
		<b:alert type="warning" dismissable="true" fadeIn="true">Warning Alert!</b:alert>
	</b:container>
</b:base>

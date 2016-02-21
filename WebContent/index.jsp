<%@ taglib prefix="btBase" tagdir="/WEB-INF/tags/bootstrap" %>
<%@ taglib prefix="f" uri="http://jmll.me/jsp/jstl/file"%>

<btBase:content title="Hello Bootstrap" lang="en_US">
	<div class="container">
		<h1>Utilizando custom tag en TLD</h1>
		  <ul>
		    <li><f:fileDown attributeName="archivo" downloadController="DownloadImage" fileName="Foto1.png"/></li>
		    <li><f:fileDown attributeName="archivo" downloadController="DownloadDoc" fileName="Doc1.doc" openNewWindow="true"/></li>
		    <li><f:fileDown attributeName="archivo" downloadController="DownloadISO" fileName="Ubuntu.iso"/></li>
		  </ul>
		<!-- Obtenido de http://getbootstrap.com/css/#forms -->
	</div>
</btBase:content>
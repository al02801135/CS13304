<%@ taglib prefix="btBase" tagdir="/WEB-INF/tags/bootstrap" %>

<btBase:content title="Hello Bootstrap" lang="en_US">
	<div class="container">
		<h1>Utilizando content.tag</h1>
		<!-- Obtenido de http://getbootstrap.com/css/#forms -->
		<form>
		  <div class="form-group">
		    <label for="exampleInputEmail1">Email</label>
		    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">Contraseña</label>
		    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Contraseña">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputFile">Archivo</label>
		    <input type="file" id="exampleInputFile">
		    <p class="help-block">Ejemplo de ayuda en bloque.</p>
		  </div>
		  <div class="checkbox">
		    <label>
		      <input type="checkbox"> Selecciona
		    </label>
		  </div>
		  <button type="submit" class="btn btn-default">Enviar</button>
		</form>
		<!-- Obtenido de http://getbootstrap.com/css/#forms -->
	</div>
</btBase:content>
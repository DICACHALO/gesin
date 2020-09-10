<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>REGISTRO DE NUEVO USUARIO</title>
	    <link rel="stylesheet" href="assets/css/formulario.css"/>
	</head>
	<body>
		<header id="header">
			<nav>
				<ul>
				<li><a href="home.php">Volver</a></li>
				</ul>
			</nav>
		</header>

		<!-- Sidebar -->
		<section id="sidebar">
			<div class="inner">
				<nav>
					<ul>
					<img id="logo" src="images/logo.png" alt="Logo GESIN" weight="110" height="130" />
					</ul>
				</nav>
			</div>
		</section>

		<form class="contact_form" action="nuevousuario2.php" method="post" name="contact_form">
			<ul>
		    <li>
		         <h2>Digite los datos del nuevo usuario</h2>
		         <span class="required_notification">* Datos obligatorios</span>
		    </li>
		    <li>
		        <label for="name">Cédula: </label>
		        <input type="text" name="cedula" id="cedula" value="" placeholder="Cédula" required />
		    </li>
			<li>
		        <label for="name">Nombre completo: </label>
		        <input type="text" name="nombre" id="demo-name" value="" placeholder="Nombre completo" required/>
		    </li>
			<li>
		        <label for="name">Contraseña: </label>
		        <input type="password" name="pass" id="contraseña" value="" placeholder="Contraseña" required/>
		    </li>

		    <li>
		        <label for="name">Rol: </label>
		        <select name="ROL" id="demo-category">
		        <option value="t">Administrador</option>
		        <option value="f">Usuario</option>     
		        </select>           
		    </li>
		    <ul>
		    	<li><input type="submit" value="Enviar" />
				<input type="reset" value="Cancelar"/></li>
		    </ul>
		</form>
	</body>
</html>
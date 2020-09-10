<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>ACTUALIZAR SEDE</title>
	    <link rel="stylesheet" href="css/formularioproducto.css"/>
	</head>
	<body>
		<section id="sidebar"> <!--MENÚ LATERAL PARA IR AL INICIO O SALIR DE LA APLICACIÓN -->
			<div class="inner">
				<nav>
					<ul>
						<li><img id="logo" src="images/logo.png" alt="Logo GESIN" weight="110" height="130" /></li>
						<li><a href="home.php">Inicio</a></li>
						<li><a href="index.html">Salir</a></li>
					</ul>
				</nav>
			</div>
		</section>

		<form class='contact_form' action='actualizarsede2.php' method='post' name='contact_form'>
			<ul>
		    <li>
		    <h2>Actualice la información de la sede</h2>   
		    </li>
		    <li> 
				<?php
				include("conexion.php"); //Conexión con la base de datos
				$id_sede = $_GET['id_sede']; //Captura de datos del formulario sede
				$consulta = "SELECT id_sede,nom_sede FROM tab_sede WHERE id_sede=$id_sede";
				$resultado = pg_query($consulta)or die ('Error. Intente de nuevo'. pg_last_error());
				while ($fila = pg_fetch_array($resultado)){
				echo "<li>
					  <label for='name'>IDENTIFICACIÓN: </label>
					  <input type='text' name='id_sede' id='' value='".$fila['id_sede']."' placeholder='' required />
					  </li>";
				echo "<li>
					  <label for='name'>NOMBRE: </label>
					  <input type='text' name='nom_sede' id='' value='".$fila['nom_sede']."' placeholder='' required />
					  </li>";
					 }
				echo "</table>";
				pg_close($dbconn); //Cierra conexión con la base de datos
				?>

		    <ul>
		    	<li align="center"><input type='submit' value='Enviar'/>
				</li>
		    </ul></form>		    
	<footer align="right"><br>
		<a href="lista_proveedores.php">Volver</a><br>
	</footer>
	</body>
</html>
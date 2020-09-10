<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>ACTUALIZAR CATEGORIAS</title>
	    <link rel="stylesheet" href="css/formularioproducto.css"/>
	</head>
	<body>
		<section id="sidebar">
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

		<form class='contact_form' action='actualizarcategorias2.php' method='post' name='contact_form'>
			<ul>
		    <li>
		    <h2>Actualice la información de la categoria del producto</h2>   
		    </li>
		    <li>        
				<?php
				include("conexion.php"); //Conexión con la base de datos
				$id_categoria = $_GET['id_categoria'];
				$consulta = "SELECT id_categoria,nom_categoria FROM tab_categoria WHERE id_categoria=$id_categoria";
				$resultado = pg_query($consulta)or die ('Error. Intente de nuevo'. pg_last_error());
				while ($fila = pg_fetch_array($resultado)){
				echo "<li><label for='name'>IDENTIFICACIÓN: </label>
						  <input type='text' name='id_categoria' id='' value='".$fila['id_categoria']."' placeholder='' required /></li>";
				echo "<li><label for='name'>NOMBRE: </label>
						  <input type='text' name='nom_categoria' id='' value='".$fila['nom_categoria']."' placeholder='' required />
					  </li>";}
				echo "</table>";
				pg_close($dbconn); //Cierra la base de datos
				?>
		    <ul>
		    	<li><input type='submit' value='Enviar'/>
				<input type='reset' value='Limpiar'/></li>
		    </ul></form>		    
	<footer align="right"><br>
		<a href="lista_categoria.php">Volver</a><br>
	</footer>
	</body>
</html>
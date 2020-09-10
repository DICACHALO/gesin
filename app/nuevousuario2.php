<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>REGISTRO DE NUEVO USUARIO</title>
	    <link rel="stylesheet" href="assets/css/formulario.css"/>
	</head>
	<body>
		<?php
		include ("conexion.php"); // Conectando y seleccionado la base de datos gesin 
		$numeralrol=$_POST['ROL'];		
		$sql="INSERT INTO tab_usuario (id_usuario,nom_usuario,id_rol,contraseña) 
		values('$_REQUEST[cedula]','$_REQUEST[nombre]','$numeralrol','$_REQUEST[pass]');";
		$respuesta=pg_query($sql)or die('Error. Intente de nuevo'.pg_last_error());
		pg_close($dbconn); //Cierra conexión con la base de datos
		echo "El registro se ha realizado con éxito.";
		//Retornando a la página principal
		echo'
		<html>
		<head>
		<meta http-equiv="REFRESH" content="2;url=home.php">
		</head>
		</html>
		';
		?>
	</body>
</html>
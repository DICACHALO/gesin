<?php

	include("conexion.php"); //Conecta con la base de datos

	$id_usuario = $_GET['id_usuario']; //Captura identificación del usuario que se desea eliminar

	$consulta = "DELETE FROM tab_usuario WHERE id_usuario=$id_usuario;"; //Borra el dato

	$resultado = pg_query($consulta);

	pg_close($dbconn); //Cierra conexión con la base de datos
	
	//Retorna a la página principal
	echo"

	<html>
		<head>
			<meta http-equiv='REFRESH' content='0;url=home.php'>
		</head>
	</html>

	";

?>

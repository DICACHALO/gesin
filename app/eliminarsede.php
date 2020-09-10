<?php

	include("conexion.php"); //Conecta con la base de datos

	$id_sede = $_GET['id_sede']; //Captura identificación de la sede que se desea eliminar

	$consulta = "DELETE FROM tab_sede WHERE id_sede=$id_sede;"; //Borra el dato

	$resultado = pg_query($consulta);

	pg_close($dbconn); //Cierra conexión con la base de datos

	//Retorna a la página de las sedes
	echo"

	<html>
		<head>
			<meta http-equiv='REFRESH' content='0;url=lista_sede.php'>
		</head>
	</html>

	";

?>

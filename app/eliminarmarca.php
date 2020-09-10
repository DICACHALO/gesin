<?php

	include("conexion.php"); //Conecta con la base de datos

	$id_marca = $_GET['id_marca'];

	$consulta = "DELETE FROM tab_marca WHERE id_marca=$id_marca";

	$resultado = pg_query($consulta);

	pg_close($dbconn); //Cierra conexión

	//Regresa a la página de proveedores
	echo"

	<html>
		<head>
			<meta http-equiv='REFRESH' content='0;url=lista_marcas.php'>
		</head>
	</html>

	";

?>

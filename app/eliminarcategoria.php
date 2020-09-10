<?php

	include("conexion.php"); //Conecta con la base de datos

	$id_categoria = $_GET['id_categoria'];

	$consulta = "DELETE FROM tab_categoria WHERE id_categoria=$id_categoria";

	$resultado = pg_query($consulta);

	pg_close($dbconn); //Cierra conexión

	//Regresa a la página de proveedores
	echo"

	<html>
		<head>
			<meta http-equiv='REFRESH' content='0;url=lista_categorias.php'>
		</head>
	</html>

	";

?>

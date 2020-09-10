<?php

	include("conexion.php"); //Conecta con la base de datos

	$id_proveedor = $_GET['id_proveedor'];

	$consulta = "DELETE FROM tab_proveedor WHERE id_proveedor=$id_proveedor;";

	$resultado = pg_query($consulta);

	pg_close($dbconn); //Cierra conexión

	//Regresa a la página de proveedores
	echo"

	<html>
		<head>
			<meta http-equiv='REFRESH' content='0;url=lista_proveedores.php'>
		</head>
	</html>

	";

?>

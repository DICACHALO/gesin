<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>REGISTRO DE NUEVA MARCA</title>
	   	</head>
	<body>
		<?php
		include ("conexion.php"); //Conecta con la base de datos
		$sql="INSERT INTO tab_marca (nom_marca) 
		values('$_REQUEST[nom_marca]');"; //Consulta para insertar la nueva información del proveedor
		$respuesta=pg_query($sql)or die('Error. Intente de nuevo'.pg_last_error());
		pg_close($dbconn); //Cierra conexión
		
//Para volver a la página de proveedores
		echo '
		<html>
			<head>
				<meta http-equiv="REFRESH" content="0;url=lista_marcas.php">
			</head>
		</html>
		';
		?>
	</body>
</html>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>REGISTRO DE NUEVO PROVEEDOR</title>
	   	</head>
	<body>
		<?php
		include ("conexion.php"); //Conecta con la base de datos
		$sql="INSERT INTO tab_proveedor (id_proveedor,nom_proveedor) 
		values('$_REQUEST[id_proveedor]','$_REQUEST[nom_proveedor]');"; //Consulta para insertar la nueva información del proveedor
		$respuesta=pg_query($sql)or die('Error. Intente de nuevo'.pg_last_error());
		pg_close($dbconn); //Cierra conexión
		
//Para volver a la página de proveedores
		echo '
		<html>
			<head>
				<meta http-equiv="REFRESH" content="0;url=lista_proveedores.php">
			</head>
		</html>
		';
		?>
	</body>
</html>
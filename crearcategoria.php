<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>REGISTRO DE NUEVA CATEGORIA</title>
	   	</head>
	<body>
		<?php
		include ("conexion.php"); //Conecta con la base de datos
		$sql="INSERT INTO tab_categoria (nom_categoria) 
		values('$_REQUEST[nom_categoria]');"; //Consulta para insertar la nueva información del proveedor
		$respuesta=pg_query($sql)or die('Error. Intente de nuevo'.pg_last_error());
		pg_close($dbconn); //Cierra conexión
		
//Para volver a la página de proveedores
		echo '
		<html>
			<head>
				<meta http-equiv="REFRESH" content="0;url=lista_categorias.php">
			</head>
		</html>
		';
		?>
	</body>
</html>
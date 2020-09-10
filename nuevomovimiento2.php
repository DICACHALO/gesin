<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>NUEVO MOVIMIENTO</title>
	    <link rel="stylesheet" href="assets/css/main.css"/>
	</head>
	<body>
		<?php
		include ("conexion.php"); // Conectando y seleccionado la base de datos gesin 
		$movimiento=$_POST['movimiento'];
		$tipomovimiento=$_POST['tipomovimiento'];
		$sede=$_POST['sede'];
		$codigo=$_POST['id_producto'];	
		// Realizando una consulta SQL
		$sql="INSERT INTO tab_movimiento (id_producto,fecha,factura,movimiento,tipo_movimiento,cantidad,id_sede,observaciones) VALUES ($codigo,'$_REQUEST[fecha]','$_REQUEST[factura]','$movimiento','$tipomovimiento','$_REQUEST[cantidad]',$sede,'$_REQUEST[observaciones]');";
		$respuesta=pg_query($sql)or die('Error. Intente de nuevo'.pg_last_error());
		pg_close($dbconn); //Cierra conexión con la base de datos
		echo "El registro se ha realizado con éxito.";
		//Retorna al formulario inicial
		echo'
		<html>
		<head>
		<meta http-equiv="REFRESH" content="2;url=nuevomovimiento.php">
		</head>
		</html>
		';
		?>
	</body>
</html>
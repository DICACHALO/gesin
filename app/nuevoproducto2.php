<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>REGISTRO DE NUEVO PRODUCTO</title>
	    <link rel="stylesheet" href="assets/css/formulario.css"/>
	</head>
	<body>
		<?php
		include ("conexion.php"); // Conectando y seleccionado la base de datos gesin 
		$tipo=$_POST['tipo'];
		$marca=$_POST['marca'];
		$categoria=$_POST['categoria'];
		$proveedor=$_POST['proveedor'];	
		$estado=$_POST['estado'];	
		// Realizando una consulta SQL			
		$sql="INSERT INTO tab_producto 
		(id_producto,nom_producto,nom_maquina,tipo,descripcion,precio_costo,
		precio_venta,id_marca,id_categoria,id_proveedor,min_inventario,ind_estado) 
		values
		('$_REQUEST[codigo]','$_REQUEST[producto]','$_REQUEST[nmaquina]','$tipo','$_REQUEST[descripcion]','$_REQUEST[costo]','$_REQUEST[venta]',$marca,$categoria,$proveedor,'$_REQUEST[mininventario]',$estado);";
		$respuesta=pg_query($sql)or die('Error. Intente de nuevo'.pg_last_error());
		pg_close($dbconn); //Cierra conexión con la base de datos
		echo "El registro se ha realizado con éxito.";
		echo'
		<html>
		<head>
		<meta http-equiv="REFRESH" content="2;url=nuevoproducto.php">
		</head>
		</html>
		';
		?>
	</body>
</html>
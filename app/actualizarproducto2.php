<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>ACTUALIZAR PRODUCTO</title>
	    <link rel="stylesheet" href="assets/css/formulario.css"/>
	</head>
	<body>
		<?php
		include ("conexion.php");
			//Se capturan las variables que vienen del formulario en actualizarproducto.php
			$id_producto=$_POST['codigo'];
			$nom_producto=$_POST['producto'];
			$nom_maquina=$_POST['nmaquina'];
			$tipo=$_POST['tipo'];
			$descripcion=$_POST['descripcion'];
			$precio_costo=$_POST['costo'];
			$precio_venta=$_POST['venta'];
			$marca=$_POST['marca'];
			$categoria=$_POST['categoria'];
			$proveedor=$_POST['proveedor'];	
			$estado=$_POST['estado'];
			$min_inventario=$_POST['mininventario'];
			//Inicia actualización con la base de datos
			$sql="UPDATE tab_producto SET 
			id_producto=$id_producto, 
			nom_producto='$nom_producto', 
			nom_maquina='$nom_maquina', 
			tipo='$tipo',
			descripcion='$descripcion',
			precio_costo=$precio_costo,
			precio_venta=$precio_venta,
			id_marca=$marca,
			id_categoria=$categoria,
			id_proveedor=$proveedor,
			ind_estado='$estado',
			min_inventario='$min_inventario'
		WHERE id_producto=$id_producto;";
		$respuesta=pg_query($sql)or die('Error. Intente de nuevo'.pg_last_error());
		pg_close($dbconn); //Cierra conexión con la base de datos
		echo "El registro se ha realizado con éxito.";
		echo'
		<html>
		<head>
		<meta http-equiv="REFRESH" content="2;url=home.php"> 
		</head>
		</html>
		'; //Redirecciona la página principal
		?>
	</body>
</html>
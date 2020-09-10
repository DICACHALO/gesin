<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>ACTUALIZAR PROVEEDOR</title>
	    <link rel="stylesheet" href="assets/css/formulario.css"/>
	</head>
	<body>
		<?php
		include ("conexion.php"); //Conexión con la base de datos
		$id_proveedor=$_POST['id_proveedor']; //Aqui se capturan las variables del formulario actualizarproveedor.php
		$nom_proveedor=$_POST['nom_proveedor'];
		
		$sql="UPDATE tab_proveedor SET id_proveedor=$id_proveedor,nom_proveedor='$nom_proveedor' 
			  WHERE id_proveedor=$id_proveedor;";
		$respuesta=pg_query($sql)or die('Error. Intente de nuevo'.pg_last_error());
		pg_close($dbconn); //Cierra conexión con la base de datos
		echo "El registro se ha realizado con éxito.";
		echo'
		<html>
		<head>
		<meta http-equiv="REFRESH" content="2;url=lista_proveedores.php">
		</head>
		</html>
		'; //Redirecciona a la página principal de proveedores
		?>
	</body>
</html>
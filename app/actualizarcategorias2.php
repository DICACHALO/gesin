<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>ACTUALIZAR CATEGORIAS</title>
	    <link rel="stylesheet" href="assets/css/formulario.css"/>
	</head>
	<body>
		<?php
		include ("conexion.php"); //Conexión con la base de datos
		$id_categoria=$_POST['id_categoria']; //Aqui se capturan las variables del formulario actualizarproveedor.php
		$nom_categoria=$_POST['nom_categoria'];
		
		$sql="UPDATE tab_categoria SET id_categoria=$id_categoria,nom_categoria='$nom_categoria' 
			  WHERE id_categoria=$id_categoria;";
		$respuesta=pg_query($sql)or die('Error. Intente de nuevo'.pg_last_error());
		pg_close($dbconn); //Cierra conexión con la base de datos
		echo "El registro se ha realizado con éxito.";
		echo'
		<html>
		<head>
		<meta http-equiv="REFRESH" content="2;url=lista_categorias.php">
		</head>
		</html>
		'; //Redirecciona a la página principal de proveedores
		?>
	</body>
</html>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>ACTUALIZAR MARCAS</title>
	    <link rel="stylesheet" href="assets/css/formulario.css"/>
	</head>
	<body>
		<?php
		include ("conexion.php"); //Conexión con la base de datos
		$id_marca=$_POST['id_marca']; //Aqui se capturan las variables del formulario actualizarmarcas1.php
		$nom_marca=$_POST['nom_marca'];
		
		$sql="UPDATE tab_marca SET id_marca=$id_marca,nom_marca='$nom_marca' 
			  WHERE id_marca=$id_marca;";
		$respuesta=pg_query($sql)or die('Error. Intente de nuevo'.pg_last_error());
		pg_close($dbconn); //Cierra conexión con la base de datos
		echo "El registro se ha realizado con éxito.";
		echo'
		<html>
		<head>
		<meta http-equiv="REFRESH" content="2;url=lista_marcas.php">
		</head>
		</html>
		'; //Redirecciona a la página principal de marcas
		?>
	</body>
</html>
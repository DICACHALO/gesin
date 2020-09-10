<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>REGISTRO DE SEDE</title>
	    <link rel="stylesheet" href="assets/css/formulario.css"/>
	</head>
	<body>
		<?php
		include ("conexion.php"); //Conexión con la base de datos
		$id_sede=$_POST['id_sede'];
		$nom_sede=$_POST['nom_sede'];
		
		$sql="UPDATE tab_sede SET id_sede=$id_sede,nom_sede='$nom_sede' 
			  WHERE id_sede=$id_sede;"; //Consulta para acctualizar la tabla de las sedes
		$respuesta=pg_query($sql)or die('Error. Intente de nuevo'.pg_last_error()); //Si los datos no se muestran identifica el error
		pg_close($dbconn); //Cierra conexión
		echo "El registro se ha realizado con éxito.";
		echo'
		<html>
		<head>
		<meta http-equiv="REFRESH" content="2;url=lista_sede.php">
		</head>
		</html>
		';
		?>
	</body>
</html>
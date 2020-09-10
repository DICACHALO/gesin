<html>
 <head> 
 	<title>REGISTRAR SEDE</title> 
	<meta charset="utf-8" />
	<link rel="stylesheet" href="assets/css/main.css" />
 </head>

 <body>
	<?php
	include ("conexion.php"); // Conectando y seleccionado la base de datos gesin 
	$sql="INSERT INTO tab_sede (nom_sede) values('$_REQUEST[nombre]');";
	$respuesta=pg_query($sql)or die('Error. Intente de nuevo'.pg_last_error());
	pg_close($dbconn); //Cierra conexión con la base de datos
	echo "El registro se ha realizado con éxito.";
	//Retornar a la página de las sedes
	echo"
	<html>
		<head>
			<meta http-equiv='REFRESH' content='0;url=lista_sede.php'>
		</head>
	</html>
	";
	?>
 </body>
</html>
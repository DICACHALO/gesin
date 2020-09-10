<html>
<head>
		<title>LIBROS</title> <!--Este archivo lista los productos del tipo LIBROS -->
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
<body>

  <?php
  include ("conexion.php"); //Conexión con la base de datos

  $registros=pg_query($dbconn,"select id_producto, nom_producto from tab_producto where tipo='LIBRO'") // Realizando una consulta SQL
  or die ('La consulta fallo: ' . pg_error($dbconn));
  echo "
        <table class='alt' border='1'>
        <tr>
        <th><center>CODIGO</center></th>
        <th><center>PRODUCTO</center></th>
        </tr>
        ";
  while ($reg=pg_fetch_array($registros)) //Bucle para mostrar todos los resltados encontrados
    { //Imprimir la consulta
     echo "<tr><td>".$reg['id_producto']."</td><td>"
     .$reg['nom_producto']."</td>";
    }
  echo "</table>";
  pg_close($dbconn); //Cierra conexión con la base de datos
  ?>
<!--RETORNA A LA PÁGINA PRINCIPAL -->
  <footer align="center">
    <a href="home.php">Volver</a>
  </footer>

</body>
</html>
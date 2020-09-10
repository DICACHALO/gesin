<html>
<head>
		<title>Consultar sedes</title> <!--Este archivo lista y añade sedes -->
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
<body>

  <?php
  include ("conexion.php"); // Conectando y seleccionado la base de datos gesin 
  // Realizando una consulta SQL
  $registros=pg_query($dbconn,"select id_sede, nom_sede from tab_sede") or die ('La consulta fallo: ' . pg_error($dbconn));
  echo "
    <table class='alt' border='1'>
    <tr>
    <th><center>CODIGO</center></th>
    <th><center>SEDE</center></th>
    <th><center>ACTUALIZAR</center></th>
    <th><center>ELIMINAR</center></th>
    </tr>
    "; //Imprimir la consulta
  while ($reg=pg_fetch_array($registros)) //Bucle para mostrar todos los resultados encontrados
  {
     echo "<tr><td>".$reg['id_sede']."</td><td>"
     .$reg['nom_sede']."</td>"."<td style='font-size:28;''><center><a href='actualizarsede.php?id_sede=".$reg[0]."'>+</a></center></td><td><center><a href='eliminarsede.php?id_sede=".$reg[0]."'>X</a> </center></td>";
    }
  echo "</table>";
  pg_close($dbconn);//Cierra conexión con la base de datos
  ?>
  
  <footer align="center">
    <a href="home.php">Volver</a>
  </footer>

</body>
</html>
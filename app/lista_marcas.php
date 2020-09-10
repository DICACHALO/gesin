<html>
 <head> <title>MARCAS</title> <!--Este archivo lista y añade proveedores -->
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
 </head>

  <body>
    <h3><center>LISTA DE MARCAS</center></h3>
  <section>
    <?php
    // Conectando y seleccionado la base de datos gesin 
    include ("conexion.php");

    session_start();

    // Realizando una consulta SQL
    $query = 'select id_marca,nom_marca from tab_marca;';
    $result = pg_query($query) or die('La consulta fallo: ' . pg_last_error());

    //Imprimir la consulta

    echo "
    <table>
    <tr>
    <td> <center> ID</center> </td>
    <td>MARCA</td>
    <td><center>ACTUALIZAR</center></td>
    <td><center>ELIMINAR</center></td>
    </tr>
    ";

    while ($fila = pg_fetch_array($result)){ //Bucle para mostrar todos los resultados encontrados
    echo "<tr><td><center>".$fila['id_marca']."</td></center><td>".$fila['nom_marca']."</td>"."<td style='font-size:38;''><center><a href='actualizarmarcas1.php?id_marca=".$fila[0]."'>+</a></center></td>"."<td style='font-size:23;''><center><a href='eliminarmarca.php?id_marca=".$fila[0]."'>X</a></center></td></tr>";
    }
    echo "<br> <hr>";
    echo "</table>";

    //Añadir un registro
    echo "
    <table border=1 width=50%>
    <tr>
      <form action='crearmarca.php' method='POST'>
      <td><input type='text' name='nom_marca' placeholder='Nueva marca'></td>
      <td><input type='submit' value='GUARDAR'></td><td></td>
    </tr>
    ";
    echo "</table>";
    pg_close($dbconn);//Cierra conexión con la base de datos
    ?>
  </section>

<!--RETORNA A LA PÁGINA PRINCIPAL -->
  <footer align="center">
    <br><a href="home.php">Volver</a><br>
  </footer>

   </body>
 </html>
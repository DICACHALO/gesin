<html>
 <head> <title>PROVEEDORES</title> <!--Este archivo lista y añade proveedores -->
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
 </head>

  <body>
    <h3><center>LISTA DE PROVEEDORES</center></h3>
    <a href="imprimir_proveedor.php">DESCARGAR LISTADO</a>
    <section>
    <?php
    // Conectando y seleccionado la base de datos gesin 
    include ("conexion.php");

    session_start();

    // Realizando una consulta SQL
    $query = "SELECT id_proveedor,nom_proveedor FROM tab_proveedor ORDER BY 1;";
    $result = pg_query($query) or die('La consulta fallo: ' . pg_last_error());

    //Imprimir la consulta

    echo "
    <table>
    <tr>
    <td> <center> IDENTIFICACIÓN </center> </td>
    <td>NOMBRE DEL PROVEEDOR</td>
    <td><center>ACTUALIZAR</center></td>
    <td><center>ELIMINAR</center></td>
    </tr>
    ";

    while ($fila = pg_fetch_array($result)){ //Bucle para mostrar todos los resultados encontrados
    echo "<tr><td><center>".$fila['id_proveedor']."</td></center><td>".$fila['nom_proveedor']."</td>"."<td style='font-size:38;''><center><a href='actualizarproveedor.php?id_proveedor=".$fila[0]."'>+</a></center></td>"."<td style='font-size:23;''><center><a href='eliminarproveedor.php?id_proveedor=".$fila[0]."'>X</a></center></td></tr>";
    }
    echo "<br> <hr>";
    echo "</table>";

    //Añadir un registro
    echo "
    <table border=1 width=50%>
    <tr>
      <form action='crearproveedor.php' method='POST'>
      <td><input type='text' name='nom_proveedor' placeholder='Nuevo proveedor'></td>
      <td><input type='text' name='id_proveedor' placeholder='Identificación'></td>
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
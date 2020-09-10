<html>
 <head> <title>CATEGORIAS</title> <!--Este archivo lista y añade proveedores -->
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
 </head>

  <body>
    <h3><center>LISTA DE CATEGORIAS DE PRODUCTOS</center></h3>
  <section>
    <?php
    // Conectando y seleccionado la base de datos gesin 
    include ("conexion.php");

    session_start();

    // Realizando una consulta SQL
    $query = 'select id_categoria,nom_categoria from tab_categoria;';
    $result = pg_query($query) or die('La consulta fallo: ' . pg_last_error());

    //Imprimir la consulta

    echo "
    <table>
    <tr>
    <td> <center> COD </center> </td>
    <td>CATEGORIA</td>
    <td><center>ACTUALIZAR</center></td>
    <td><center>ELIMINAR</center></td>
    </tr>
    ";

    while ($fila = pg_fetch_array($result)){ //Bucle para mostrar todos los resultados encontrados
    echo "<tr><td><center>".$fila['id_categoria']."</td></center><td>".$fila['nom_categoria']."</td>"."<td style='font-size:38;''><center><a href='actualizarcategorias1.php?id_categoria=".$fila[0]."'>+</a></center></td>"."<td style='font-size:23;''><center><a href='eliminarcategoria.php?id_categoria=".$fila[0]."'>X</a></center></td></tr>";
    }
    echo "<br> <hr>";
    echo "</table>";

    //Añadir un registro
    echo "
    <table border=1 width=50%>
    <tr>
      <form action='crearcategoria.php' method='POST'>
      <td><input type='text' name='nom_categoria' placeholder='Nueva categoria'></td>
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
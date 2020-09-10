<html>
 <head> <title>PROVEEDORES</title> <!--Este archivo lista y añade proveedores -->
		<meta charset="utf-8" />
		
 </head>

  <body>
    <h3><center>LISTA DE PROVEEDORES</center></h3>
    <a href="javascript:print(document);">Imprimir</a>

    <?php
    // Conectando y seleccionado la base de datos gesin 
    include ("conexion.php");

    session_start();

    // Realizando una consulta SQL
    $query = "SELECT id_proveedor,nom_proveedor FROM tab_proveedor ORDER BY 1;";
    $result = pg_query($query) or die('La consulta fallo: ' . pg_last_error());

    //Imprimir la consulta

    echo "
    <table border='2'>
    <tr>
    <td> <center> IDENTIFICACIÓN </center> </td>
    <td>NOMBRE DEL PROVEEDOR</td>
    </tr>
    ";

    while ($fila = pg_fetch_array($result)){ //Bucle para mostrar todos los resultados encontrados
    echo "<tr><td><center>".$fila['id_proveedor']."</td></center><td>".$fila['nom_proveedor']."</td>";
    }
    echo "<br> <hr>";
    echo "</table>";

    pg_close($dbconn);//Cierra conexión con la base de datos
    ?>
   </body>
 </html>
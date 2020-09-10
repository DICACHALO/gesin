<html>
 <head> <title>PRODUCTOS</title> <!--Este archivo lista y añade proveedores -->
		<meta charset="utf-8" />
		
 </head>

  <body>
    <h3><center>LISTA DE PRODUCTOS</center></h3>
    <a href="javascript:print(document);">Imprimir</a>

    <?php
    // Conectando y seleccionado la base de datos gesin 
    include ("conexion.php");

    session_start();

    // Realizando una consulta SQL
    $query = "SELECT a.id_producto,a.nom_producto, b.nom_marca, c.nom_proveedor, a.precio_costo, a.precio_venta FROM tab_producto a, tab_marca b, tab_proveedor c WHERE a.id_marca=b.id_marca and a.id_proveedor=c.id_proveedor ORDER BY 1;";
    $result = pg_query($query) or die('La consulta fallo: ' . pg_last_error());

    //Imprimir la consulta

    echo "
    <table border='2'>
    <tr>
    <th><center>CODIGO</center></th>
    <th>PRODUCTO</th>
    <th>MARCA</th>
    <th>PROVEEDOR</th>
    <th>PRECIO COSTO</th>
    <th>PRECIO VENTA</th>
    </tr>
    ";

    while ($fila = pg_fetch_array($result))//Bucle para mostrar todos los resultados encontrados
    { 
    echo "<tr><td><center>".$fila['id_producto']."</td></center><td>".$fila['nom_producto']."</td><td><center>".$fila['nom_marca']."</td><td><center>".$fila['nom_proveedor']."</td><td>"."$".number_format($fila[4])."</td>"."<td>"."$".number_format($fila[5])."</td>"; 
    }
    echo "<br> <hr>";
    echo "</table>";

    pg_close($dbconn);//Cierra conexión con la base de datos
    ?>
   </body>
 </html>
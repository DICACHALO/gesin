<html>
 <head> <title>CANTIDAD PRODUCTOS</title> 
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
 </head>

  <body>
    <h3><center>REPORTE DE PRODUCTOS POR CANTIDAD</center></h3><br>
    <section>
      <?php
      function inventariocantidad(){
                include("conexion.php"); //Conexión con la base de datos
                $consulta = 'SELECT b.id_producto, a.nom_producto, b.saldo_inicial, b.entradas, b.salidas, b.saldo_final FROM tab_producto a, tab_inventario b WHERE a.id_producto=b.id_producto ORDER BY 1';
                $resultado = pg_query($consulta)or die ('Error. Intente de nuevo'. pg_last_error());
                echo "
                <table class='alt' border='1'>
                <tr>
                <th><center>CODIGO</center></th>
                <th><center>PRODUCTO</center></th>
                <th><center>SALDO INICIAL</center></th>
                <th><center>ENTRADAS</center></th>
                <th><center>SALIDAS</center></th>
                <th><center>SALDO FINAL</center></th>
                </tr>
                ";
                  while ($fila = pg_fetch_array($resultado)){
                  echo "<tr><td>".$fila['id_producto']."</td><td>"
                                 .$fila['nom_producto']."</td><td><center>"
                                 .$fila['saldo_inicial']."</td><td><center>"
                                 .$fila['entradas']."</td><td><center>"
                                 .$fila['salidas']."</td><td><center>"
                                 .$fila['saldo_final']."</center></td>";}  
                  echo "</table><br><hr>";
                  pg_close();
                  }
                inventariocantidad();
              ?> <!--termina funcion para mostrar productos-->  
    </section>

    <footer align="center">
      <a href="home.php">Volver</a>
    </footer>
   </body>
 </html>
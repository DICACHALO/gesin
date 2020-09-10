<html>
 <head> <title>INFORME PRODUCTOS</title> 
		<meta charset="utf-8" />
 </head>

  <body>
    <h3><center>REPORTE DE PRODUCTOS CON PRECIOS</center></h3><br>
    <p><a href="javascript:print(document);">Imprimir</a><br></p>
    <section>
    <?php
    function inventarioprecios(){
            include("conexion.php");
            $consulta = 'SELECT * FROM informe';
            $consulta2= 'SELECT total_entradas::money, total_salidas::money, total_inventario::money FROM totales;';
            $resultado = pg_query($consulta)or die ('Error. Intente de nuevo'. pg_last_error());
            $resultado2 = pg_query($consulta2)or die ('Error. Intente de nuevo'. pg_last_error());
            echo "
            <table class='alt' border='1'>
                <tr>
                <td rowspan='2'><center>CODIGO</center></td>
                <td rowspan='2'><center>PRODUCTO</center></td>
                <td rowspan='2'><center>MARCA</center></td>
                <td rowspan='2'><center>SALDO INICIAL</center></td>
                <td colspan='2'><center>ENTRADAS</center></td>
                <td colspan='2'><center>SALIDAS</center></td>
                <td rowspan='2'><center>SALDO</center></td>
                <td rowspan='2'><center>INVENTARIO COSTO TOTAL</center></td>
                </tr>
                <tr>
                <td><center>PRODUCTOS</center></td>
                <td><center>VALOR</center></td>
                <td><center>PRODUCTOS</center></td>
                <td><center>VALOR</center></td>
                </tr>
                ";
            while ($fila = pg_fetch_array($resultado)){
            echo  "<tr><td>".$fila['id_producto']."</td><td>"
                            .$fila['nom_producto']."</td><td><center>"
                            .$fila['nom_marca']."</td><td><center>"
                            .$fila['saldo_inicial']."</td><td><center>"
                            .$fila['entradas']."</td><td><center>"
                            ."$".number_format($fila['valor_entradas'])."</td><td><center>"
                            .$fila['salidas']."</td><td><center>"
                            ."$".number_format($fila['valor_salidas'])."</td><td><center>"
                            .$fila['saldo_final']."</td><td><center>"
                            ."$".number_format($fila['inventario_costo_total'])."</center></td>";}           
            echo "</table><br><hr>";

            while ($fila2 = pg_fetch_array($resultado2)){
             
             echo" <table class='alt' border='1'>
             <tr>
                <td><center></center></td>
                <td><center>TOTAL COMPRAS</center></td>
                <td><center>TOTAL VENTAS</center></td>
                <td><center>TOTAL COSTO DE INVENTARIO ACTUAL</center></td>
                </tr>
                <tr>
                <td></td>
                <td><center>".$fila2['total_entradas']."</center></td>
                <td><center>".$fila2['total_salidas']."</center></td>
                <td><center>".$fila2['total_inventario']."</center></td>
                </tr></table><br><hr>";
                }
            pg_close($dbconn);
            }
        inventarioprecios();
        ?> <!--termina funcion para mostrar productos-->  
    </section>

   </body>
 </html>
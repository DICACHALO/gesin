<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>MOVIMIENTO</title>
	    <link rel="stylesheet" href="css/formularioproducto.css"/>
	</head>
	<body>
		
		<!-- Sidebar -->
		<section id="sidebar">
			<div class="inner">
				<nav>
					<img id="logo" src="images/logo.png" alt="Logo GESIN" weight="110" height="130" />
				</nav>
			</div>
		</section>

		<section id="sidebar">
			<div class="inner">
				<nav>
					<ul>
						<li><img id="logo" src="images/logo.png" alt="Logo GESIN" weight="110" height="130" /></li>
							<li><a href="home.php">Inicio</a></li>
							<li><a href="index.html">Salir</a></li>
					</ul>
				</nav>
			</div>
		</section>

		<form class="contact_form" action="nuevomovimiento2.php" method="post" name="mov_form">
			<ul>
		    <li>
		         <h2>Registre la información del movimiento</h2>
		         <span class="required_notification">* Datos obligatorios</span>
		    </li>
		      <li>
		        <label for="movimiento">Movimiento*: </label>
		        <select aria-required="true" name="movimiento" id="movimiento" required>
		        <option selected="selected" value="" >--SELECCIONAR--</option>';
		        <option value="Compra">Compra</option>
		        <option value="Venta">Venta</option>
		        <option value="Devolución">Devolución</option>
		        <option value="Remisión">Remisión</option>     
		        </select>           
		    </li>
		     <li>
		        <label for="tipomovimiento">Tipo de movimiento*: </label>
		        <select required name="tipomovimiento" id="">
		        <option selected="selected" value="">--SELECCIONAR--</option>';
		        <option value="entrada">Entrada</option>
		        <option value="salida">Salida</option>
		        <option value="saldoinicial">Saldoinicial</option>      
		        </select>           
		    </li>
		    <li>
		        <label for="name">Código*: </label>
		        <?php
	     		include ("conexion.php"); // Conectando y seleccionado la base de datos gesin 
	       		$orden="SELECT id_producto, nom_producto FROM tab_producto ORDER BY 1;"; // Realizando una consulta SQL
	 
	            if($consulta=pg_query($orden))
	              {              
	                  echo '<select required name="id_producto" id="id_producto">
	                              <option selected="selected" value="">--SELECCIONAR--</option>';
	                              while($fila=pg_fetch_row($consulta)) //Bucle para mostrar todos los registros
	                                  {
	                                    $id=$fila[0];
	                                    $nombre=$fila[1];
	                                    echo '<option value="'.$id.'">'.$id.'</option>';
	                                  }
	                              echo '</select>';
             }else
              echo "Error al ejecutar la consulta contra la base de datos.";
				?>
		    </li>
			
			<li>
		        <label for="name">Factura*: </label>
		        <input type="text" name="factura" maxlength="12" id="" value="" placeholder="" required/>
		    </li>
			<li>
		        <label for="name">Fecha*: </label>
		        <input type="date" name="fecha" id="" value="" placeholder="dd/mm/aa" min="2016/01/01" required/>
		    </li>
		    <li>
		        <label for="name">Cantidad*: </label>
		        <input type="numeric" name="cantidad" id="" value="" placeholder="" minlength="1" maxlength="5" required/>
		    </li>
		    <li>
		        <label for="name">Sede: </label>
		        
		        <?php
     		include ("conexion.php"); // Conectando y seleccionado la base de datos gesin 
       		$orden="SELECT id_sede, nom_sede FROM tab_sede;"; // Realizando una consulta SQL
 
            if($consulta=pg_query($orden))
              {              
                  echo '<select required name="sede" id="sede">
                              <option selected="selected" value="">--SELECCIONAR--</option>';
                              while($fila=pg_fetch_row($consulta)) //Bucle para mostrar todos los registros
                                  {
                                    $id=$fila[0];
                                    $nombre=$fila[1];
                                    echo '<option value="'.$id.'">'.$nombre.'</option>';
                                  }
                              echo '</select>';
             }else
              echo "Error al ejecutar la consulta contra la base de datos.";
            ?>

	    	</li>
		    <li>
		        <label for="name">Observaciones: </label>
		        <input type="text" name="observaciones" id="" value="" placeholder=""/>
		    </li>
		    <ul>
		    	<li><input type="submit" value="Enviar" />
				<input type="reset" value="Cancelar"/>
				</li>
		    </ul>
		</form>

	<footer align="right">
		<br><a href="home.php">Volver</a><br>
	</footer>
		
	</body>
</html>
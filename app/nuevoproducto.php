<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>REGISTRO DE NUEVO PRODUCTO</title>
	    <link rel="stylesheet" href="css/formularioproducto.css"/>
	</head>
	<body>
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
	
		<form class="contact_form" action="nuevoproducto2.php" method="post" name="contact_form">
			<ul>
		    <li>
		         <h2>Digite los datos del producto</h2>
		         <span class="required_notification">* Datos obligatorios</span>
		    </li>
		     <li>
		        <label for="name">Código*: </label>
		        <input type="number" min="1" max="999" maxlength="3" pattern="\S{1,4}" name="codigo" id="" value="" placeholder="" required />
		    </li>
		    <li>
		        <label for="name">Nombre del producto*: </label>
		        <input type="text" name="producto" maxlength="40" id="" value="" placeholder="" required />
		    </li>
			<li>
		        <label for="name">Nombre Máquina*: </label>
		        <input type="text" name="nmaquina" maxlength="12" id="" value="" placeholder="" required/>
		    </li>
		     <li>
		        <label for="name">Tipo: </label>
		        <select name="tipo" id="">
		        <option value="VENTA">VENTA</option>
		        <option value="COMODATO">COMODATO</option>
		        <option value="ALQUILER">ALQUILER</option> 
		        <option value="LIBRO">LIBRO</option>      
		        </select>           
		    </li>
			<li>
		        <label for="name">Descripción: </label>
		        <input type="text" name="descripcion" id="" value="" placeholder="Detalles del producto"/>
		    </li>
			<li>
		        <label for="name">Precio costo*: </label>
		        <input type="text" name="costo" id="" value="" placeholder="$" required/>
		    </li>
		    	<li>
		        <label for="name">Precio venta*: </label>
		        <input type="text" name="venta" id="" value="" placeholder="$" required/>
		    </li>
		    <li>
		        <label for="name">Marca*: </label>

			<?php
			      include ("conexion.php"); // Conectando y seleccionado la base de datos gesin 
			      $orden="SELECT id_marca, nom_marca FROM tab_marca;"; // Realizando una consulta SQL
			      if($consulta=pg_query($orden))
			        {              
			        echo '<select required name="marca" id="marca">
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
		        <label for="name">Categoria*: </label>
		     <?php
 			// Realizando una consulta SQL
     		include ("conexion.php"); // Conectando y seleccionado la base de datos gesin 
       		$orden="SELECT id_categoria, nom_categoria FROM tab_categoria;";
            if($consulta=pg_query($orden))
              {              
              echo '<select required name="categoria" id="categoria">
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
		    <label for="name">Proveedor*: </label>
		       <?php
 				include ("conexion.php"); // Conectando y seleccionado la base de datos gesin 
 				// Realizando una consulta SQL
      			$orden="SELECT id_proveedor, nom_proveedor FROM tab_proveedor;";
            	if($consulta=pg_query($orden))
              		{              
                  echo '<select required name="proveedor" id="proveedor">
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
		        <label for="name">Mínimo en inventario*: </label>
		        <input type="text" name="mininventario" id="" value="" placeholder="Cantidad mínima en bodega" required/>
		    </li>
		  	<li>
		        <label for="name">Estado: </label>
		        <select name="estado" id="demo-category">
		        <option value="TRUE">Activo</option>
		        <option value="FALSE">Inactivo</option>     
		        </select>           
		    </li>
		 <ul>
		    <li><input type="submit" value="Enviar" />
			<input type="reset" value="Limpiar"/></li>
		 </ul>
	</form>

	<footer align="right">
		<br><a href="home.php">Volver</a><br>
	</footer>

	</body>
</html>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>ACTUALIZAR PRODUCTO</title>
	    <link rel="stylesheet" href="css/formularioproducto.css"/>
	</head>
	<body>
		<section id="sidebar"> <!-- Menú lateral de accesos directos -->
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
<!-- Inicia formulario para actualizar datos del producto -->
	<form class='contact_form' action='actualizarproducto2.php' method='post' name='contact_form'>
			<ul>
		    <li><h2>Actualice la información del producto</h2>
		        <span class='required_notification'>* Datos obligatorios</span>
		    </li>
		    <li><label for='name'>Código*: </label>
		    	<?php
				include("conexion.php");
				$id_producto = $_GET['id_producto'];
				$consulta = "SELECT id_producto,nom_producto,nom_maquina,tipo,descripcion,precio_costo,precio_venta, min_inventario FROM tab_producto WHERE id_producto=$id_producto";
				$resultado = pg_query($consulta) or die ('Error. Intente de nuevo'. pg_last_error());
				while ($fila = pg_fetch_array($resultado)){  	//Bucle para mostrar todos los registros
				echo "<input type='numeric' name='codigo' maxlength='3' id='' value='$id_producto' placeholder='' required />";
				echo "</li><li><label for='name'>Nombre del producto*: 
					  </label><input type='text' name='producto' maxlength='40' id='' value='".$fila['nom_producto']."' placeholder='40 caracteres' required /></li>";
				echo "<li><label for='name'>Nombre Máquina*: </label>
					  <input type='text' name='nmaquina' maxlength='12' id='' value='".$fila['nom_maquina']."' placeholder='12 caracteres' required/>
						    </li>";
				echo "<li>
			          <label for='name'>Tipo: </label>
			          <select name='tipo' id='' >
			          <option selected='selected' value=''>--SELECCIONAR--</option>';
			          <option value='VENTA'>VENTA</option>
			          <option value='COMODATO'>COMODATO</option>
			          <option value='ALQUILER'>ALQUILER</option> 
			          <option value='LIBRO'>LIBRO</option>      
			          </select></li>";
				echo "<li><label for='name'>Descripción: </label>
					  <input type='text' name='descripcion' id='' value='".$fila['descripcion']."' placeholder='Detalles del producto'/></li>";
				echo "<li><label for='name'>Precio costo*: </label>
					  <input type='text' name='costo' maxlength='6' id='' value='".$fila['precio_costo']."' placeholder='$' required/></li>";
				echo "<li><label for='name'>Precio venta*: </label>
						        <input type='text' name='venta' maxlength='6' id='' value='".$fila['precio_venta']."' placeholder='$' required/></li>";
				echo "</li><li><label for='name'>Mínimo en inventario*: </label>
					  <input type='text' name='mininventario' maxlength='2' id='' value='".$fila['min_inventario']."' required/></li>";}
				echo "<li><label for='name'>Marca*: </label>";
				//Se traen las opciones desde la base de datos.
				$orden='SELECT id_marca, nom_marca FROM tab_marca;';
				if($consulta=pg_query($orden)){              
				echo"<select required name='marca' id='marca'>
				     <option selected='selected' value=''>--SELECCIONAR--</option>';";
				while($fila=pg_fetch_row($consulta)) //Bucle para mostrar todos los registros
                      {
                        $id=$fila[0];
                        $nombre=$fila[1];
                        echo '<option value='.$id.'>'.$nombre.'</option>';
                      }
				echo '</select>'; }
				else
				echo "Error al ejecutar la consulta.</li>";
				echo "<li><label for='name'>Categoria*: </label>";
				//Se traen las opciones categoria desde la base de datos
				$orden='SELECT id_categoria, nom_categoria FROM tab_categoria;';
				        if($consulta=pg_query($orden)){              
				        echo "<select required name='categoria' id='categoria'>
				              <option selected='selected' value=''>--SELECCIONAR--</option>'";
				        while($fila=pg_fetch_row($consulta)){ //Bucle para mostrar todos los registros
				              $id=$fila[0];
				              $nombre=$fila[1];
				        echo '<option value='.$id.'>'.$nombre.'</option>';}
				        echo "</select>";
				        }else
						echo "Error al ejecutar la consulta contra la base de datos.";
						echo "</li><li><label for='name'>Proveedor*: </label>";   
				//Se traen las opciones sobre los nombres de os proveedores desde la base de datos
				$orden='SELECT id_proveedor, nom_proveedor FROM tab_proveedor;';
				        if($consulta=pg_query($orden)){              
				        echo "<select required name='proveedor' id='proveedor'>
				              <option selected='selected' value=''>--SELECCIONAR--</option>'";
				              while($fila=pg_fetch_row($consulta)) //Bucle para mostrar todos los registros
                              {
                                $id=$fila[0];
                                $nombre=$fila[1];
                                echo '<option value='.$id.'>'.$nombre.'</option>';
                              }
                        echo '</select>';  
				              }else
				        echo "Error al ejecutar la consulta contra la base de datos.";
				?>

			<li>
	        <label for='name'>Estado: </label>
	        <select name='estado' id='demo-category'>
	        <option value='TRUE'>Activo</option>
	        <option value='FALSE'>Inactivo</option>     
	        </select>           
		    </li>
		<ul>
		 <li align="center"><input type='submit' value='Enviar'/></li>
		</ul></form>		    
	<footer align="right">
		<br><a href="home.php">Volver</a><br>
	</footer>
	</body>
</html>
<!DOCTYPE HTML>
<!--
	Hyperspace by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>GESIN</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<link rel="stylesheet" href="assets/css/main.css"/>
		<link rel="icon" type="image/png" href="assets/css/images/favicon.ico"/>
	</head>
	<body>
		<!-- Menú lateral de accesos directos -->
			<section id="sidebar">
				<div class="inner">
					<nav>
						<ul>
							<li><a href="#intro">INICIO</a></li>
							<li><a href="#one">REPORTES</a></li>
							<li><a href="#two">GESTIÓN DE PRODUCTOS</a></li>
							<li><a href="#three">USUARIOS</a></li>
							<li><a href="ingreso.html">SALIR</a></li>
						</ul>
					</nav>
				</div>
			</section>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Introducción al programa -->
					<section id="intro" class="wrapper style1 fullscreen fade-up">
						<div class="inner">
							<h2><center>** BIENVENIDO A GESIN **</center></h2>
							<br><ul class="actions">
									<p align=center><a href="nuevomovimiento.php" class="button">REGISTRAR MOVIMIENTO ®</a></p>
									<p align=center><a href="nuevoproducto.php" class="button">AÑADIR PRODUCTO ☼</a></p><hr>
									<p> Manual GESIN: <a href="Manual.doc"> Descargar</a> </p align="center"><hr>
					</section>

				<!-- One -->
					<section id="one" class="wrapper style2 spotlights">
						<section>
							<div class="content">
								<div class="inner">
									<h5>Productos que han llegado a un stock mínimo:</h5><br>
										<div class="table-wrapper">

											
										<?php
										//funcion para mostrar permanentemente los productos con bajo stock-->
										function productosbajostock(){
										include("conexion.php");
										$consulta = "SELECT id_producto,nom_producto,ind_disponibilidad AS cantidad from tab_producto WHERE ind_disponibilidad<min_inventario AND tipo='VENTA' ORDER BY 1";
										$resultado = pg_query($consulta)or die ('Error. Intente de nuevo'. pg_last_error());
										echo "
											<table class='alt' border='1'>
											<tr>
											<th><center>CODIGO</center></th>
											<th><center>PRODUCTO</center></th>
											<th><center>CANTIDAD</center></th>
											</tr>
											";
										while ($fila = pg_fetch_array($resultado)){
										echo "<tr><td>".$fila['id_producto']."</td><td>"
													   .$fila['nom_producto']."</td><td><center>"
													   .$fila['cantidad']."</center></td>";
																				  }	
										echo "</table><hr>";
										pg_close();
										}
										productosbajostock();
										?> <!--termina funcion para mostrar productos-->	

										</div>
									</div>					
								<a href="inventariocantidad.php" class="button">Informe de inventario por cantidades</a><br>
								<a href="inventarioprecios.php" class="button">Informe de inventario con precios</a>
								</div>
						</section>
					</section>

				<!-- Two -->
					<section id="two" class="wrapper style3 fade-up">
						<div class="inner">
							<div class="features">
								<section>
									<span class="icon major fa-cog"></span>
									<h3><a href="solicitud_consulta.php">En venta</a></h3>
								</section>
								<section>
									<span class="icon major fa-cog"></span>
									<h3><a href="lista_libros.php">Libros</a></h3>
								</section>
								<section>
									<span class="icon major fa-cog"></span>
									<h3><a href="lista_alquiler.php">Alquiler</a></h3>
								</section>
								<section>
									<span class="icon major fa-cog"></span>
									<h3><a href="lista_comodato.php">Comodato</a></h3>
								</section>
								<section>
									<span class="icon major fa-cog"></span>
									<h3><a href="lista_proveedores.php">Proveedores</a></h3>
								</section>
								<section>
									<span class="icon major fa-cog"></span>
									<h3><a href="registro_sede1.php">Sedes</a></h3>
								</section>
								<section>
									<span class="icon major fa-cog"></span>
									<h3><a href="lista_categorias.php">Categorías</a></h3>
								</section>
								<section>
									<span class="icon major fa-cog"></span>
									<h3><a href="lista_marcas.php">Marcas</a></h3>
								</section>
					</section>

				<!-- Three -->
					<section id="three" class="wrapper style1 fade-up">
						<div class="inner">
							<p><h2><center>LISTA DE USUARIOS</center></h2></p><hr>
							<div class="split style1"> </div>
								<div class="">
									<!-- Función para ver el listado de usuarios actual -->
									<?php
									include ("conexion.php");
									$registros=pg_query($dbconn,"select id_usuario, nom_usuario from tab_usuario") 
									or die ('La consulta fallo: ' . pg_error($dbconn));
									echo"
								    	<table class='alt' border=1>
										<tr>
										<th><center>CÉDULA</center></th>
										<th><center>NOMBRES Y APELLIDOS</center></th>
										<th><center>ELIMINAR</center></th>
										</tr>
										<tbody>";
									while ($reg=pg_fetch_array($registros)){
									echo "<tr>
									   <td>$reg[0]</td>
									   <td>$reg[1]</td>
									   <td><center>
									   <a href='eliminarusuario.php?id_usuario=".$reg[0]."'>X</a> 
									   </center></td>
									   </tr>";
									   }
		   							echo"</tbody></table>";
		  							pg_close($dbconn);
									?>			
                        		<hr><br> <a href="nuevousuario.php" class="button">Agregar usuario</a>                      
                        	</div>
					 	</div>
					</section>
			</div>
</div>
		<!-- Scripts animmación del panel lateral -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
	</body>
</html>
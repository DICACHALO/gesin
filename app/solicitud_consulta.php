<html>
	<head>
	<title>Consulta de productos</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<link rel="icon" type="image/png" href="images/favicon.ico" />
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

	<div id="wrapper">
		<section id="three" class="wrapper style1 fade-up">

<!--SECCIÓN PARA HACER CONSULTA DE PRODUCTOS SEGÚN EL CÓDIGO-->

	<div class="inner">
		<form action="" method="post">
		Ingrese el código del producto a consultar:
		<input type="text" name="id_producto" required="true">
		<br>
		<input type="submit" value="buscar" name="buscar">
		</form>
		
		<?php
		    if (isset($_POST['buscar']))
			    {
				include ("conexion.php");
				$registros=pg_query("SELECT id_producto, nom_producto, precio_costo, precio_venta from tab_producto where id_producto='$_REQUEST[id_producto]'");
		     		if ($reg=pg_fetch_array($registros))
						{
					  	echo "
						<table border=1>
						<tr>
						<th>CODIGO</th>
						<th>PRODUCTO</th>
						<th>PRECIO COSTO</th>
						<th>PRECIO VENTA</th>
						</tr>";
						echo "<td>".$reg['id_producto']."</td>";
						echo "<td>".$reg['nom_producto']."</td>";
						echo "<td>"."$".number_format($reg['precio_costo'])."</td>"; 
						echo "<td>"."$".number_format($reg['precio_venta'])."</td>";  
						echo "</table>";
						}
					else
					{
					  echo "No existe un producto con ese código";
					}pg_close();
				}
		?>
	</div>

	<div class="inner">
		<h2>LISTA DE PRODUCTOS</h2>
		<form action="" method="post">
		<ul class="actions"> 
		<li><a href="imprimir_productos.php" class="button">DESCARGAR</a></li>
		<li><input type="submit" class="button" value="EDITAR" name="lista"></li>
		
		</ul>
		</form>
	</div>

			 <?php
		  		// Conectando y seleccionado la base de datos gesin 
		 		if (isset($_POST['lista']))
		    	{
		  		include ("conexion.php");
		  		// Realizando una consulta SQL
		  		$query=pg_query("SELECT id_producto, nom_producto, precio_costo, precio_venta FROM tab_producto ORDER BY 1;");
		  		// Imprimiendo los resultados en HTML
			  echo "<table>\n";
			  echo "
						<table border=1>
						<tr>
						<th><center>CODIGO</center></th>
						<th><center>PRODUCTO</center></th>
						<th>PRECIO COSTO</th>
						<th>PRECIO VENTA</th>
						<th>ACTUALIZAR</th>
						</tr>";
			  while ($reg=pg_fetch_array($query))
						{
					  	echo "<tr><td><center>".$reg[0]."</center></td>";
						echo "<td>".$reg[1]."</td>";
						echo "<td>"."$".number_format($reg[2])."</td>";
						echo "<td>"."$".number_format($reg[3])."</td>";  
						echo "<td><center><a href='actualizarproducto.php?id_producto=".$reg[0]."'>►</a></center></td></tr>";
								}
					echo "</table>";
				  // Cerrando la conexión
			  pg_close();
			  }
		  ?>
	</section>		
</div>
</body>
</html>
<?php
$dbconn = pg_connect("host=localhost
					  dbname=gesin 
					  user=postgres 
					  password=postgresql1")
or die('No se ha podido conectar: ' . pg_last_error());
?>
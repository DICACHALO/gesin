<?php // Este archivo valida que realmente el usuario y la contraseña se encuentren registrados en la base de datos
$usr = $_POST["usr"]; //Numero de cedula del usuario de gesin 
$pwd = $_POST["pwd"]; //Contraseña
include("conexion.php");  // Conectando y seleccionado la base de datos gesin 
 $sql = pg_query("SELECT id_usuario, contraseña FROM tab_usuario WHERE id_usuario ='$usr' AND contraseña ='$pwd';")
 or die("Error. No es posible la conexión". pg_last_error());
 if (pg_fetch_array($sql))
  {
  session_start(); //Comienza una sesión
  $_SESSION['usuario']=$usr;
  $_SESSION['pwd']=$pwd;
  session_set_cookie_params(0, "/", $_SERVER["HTTP_HOST"], 0); 
  header("Location: home.php"); //Entra a la aplicación
  }
  else
   echo "USUARIO NO REGISTRADO";
  pg_close(); //Cierra conexión con la base de datos
?>
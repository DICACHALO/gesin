<?php 
include("conexion.php");  // Conectando y seleccionado la base de datos gesin 
session_set_cookie_params(0, "/", $_SERVER["HTTP_HOST"], 0);
session_start();  
if (isset($_SESSION["usr"])){
$sql="SELECT id_usuario, contraseña,id_rol FROM tab_usuario WHERE id_usuario ='$usr' AND contraseña ='$pwd';";
$busqueda=pg_query($sql); //ejecuta la consulta

while ($row=pg_fetch_array($busqueda)) {  //trae el registro
  
    $id_rol=$row[3];

    if ($id_rol==t) 
    {
    header("location:home.php"); //Entra a la aplicación
    }
    if($id_rol==f)
    {
    header("location:home.php"); 
    }
  }
}
  pg_close(); //Cierra conexión con la base de datos
?>

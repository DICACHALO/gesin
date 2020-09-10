<?php //Aqui se procesa la información necesaria para enviar un correo electronico de la persona que quiere contactarse
$para="dicachalo8706@hotmail.com";
$nombre=$_POST["name"];
$de=$_POST["emailuser"];
$mensaje=$_POST["message"];
$asunto="Contacto desde el sitio web GESIN";

$headers = "MIME-Version:1.0;\r\n";
$headers .= "Content-type:text/html; \r\n charset=iso-8859-1"; //Esta parte es con el fin que el correo no llegue como SPAM
$headers .= "From: $de \r\n";
$headers .= "To: $para; \r\n Subjet:$asunto \r\n";

if(mail($para,$asunto,$mensaje,$headers))
	{echo "Muchas gracias por su mensaje." ;
}
else {
	echo "Hubo un problema. Vuelva a intentarlo.";
}
  ?>
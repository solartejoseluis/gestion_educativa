<?php
session_start();

//obtener variables
$nptUser = $_POST['npt_user'];
$nptPassword = $_POST['npt_password'];

// CONECTAR BASE DE DATOS
$conn = @mysqli_connect("localhost", "kiron", "123456","GESTION_EDUCATIVA");
if (!$conn){
  echo "Fallo al conectar la bd";
}else{
  $resultado = mysqli_query($conn,"SELECT * FROM USUARIOS");
  if(!$resultado){
    echo "Error al ejecutar consulta";
    }else{$count='0';
      }
  };
// capturar array con resultados
while ($fila = mysqli_fetch_array($resultado)){
  $usuarioUser = $fila['usuario_user'];
  $usuarioPassword = $fila['usuario_password'];

  if($nptUser == $usuarioUser & $nptPassword == $usuarioPassword){
    $usuarioPerfil= $fila['usuario_perfil'];
    $usuarioId= $fila['usuario_id'];
    $count='1';
  }
};
// REDIRECCION DE PAGINA
if ($count=='1'){
  switch ($usuarioPerfil){
      case '1': //perfil docente
      $_SESSION['usuario_user'] = $usuarioUser;
      $_SESSION['usuario_password'] = $usuarioPassword;
      $_SESSION['usuario_id'] = $usuarioId;
      echo '<meta http-equiv="REFRESH"content="0;url=../03_docente/docente_home_view.html">';
      break;

    case '2': // perfil estudiante

      break;

    case '3': //perfil administrativo

      break;

    case '4': // perfil system_admin

      break;
  }
}else{
  echo'<meta http-equiv="REFRESH"content="0;url=error.html">';
  };

// CERRAR LA CONEXIÓN
mysqli_close($conn);

<?php
session_start();

//obtener variables
$user_local = $_POST['npt_user'];
$password_local = $_POST['npt_password'];

// CONECTAR BASE DE DATOS
$conn = @mysqli_connect("localhost", "kiron", "123456","GESTIONEDUCATIVA");

if (!$conn){
  echo "Fallo al conectar la bd";
}else{
  $resultado = mysqli_query($conn,"SELECT * FROM USERS");
  if(!$resultado){
    echo "Error al ejecutar consulta";
    }else{$count='0';
      }
  };
// capturar array con resultados
while ($fila = mysqli_fetch_array($resultado)){
  $user_bd = $fila['user_usuario'];
  $password_bd = $fila['user_password'];

  if($user_local == $user_bd & $password_local == $password_bd){
    $user_perfil= $fila['user_perfil'];
    $user_id= $fila['user_id'];

    $count='1';
  }
};
// REDIRECCION DE PAGINA
if ($count=='1'){
  switch ($user_perfil){
      case '1': //perfil estudiante
      $_SESSION['user_bd'] = $user_local;
      $_SESSION['password_bd'] = $password_local;
      $_SESSION['user_id'] = $user_id;
      echo '<meta http-equiv="REFRESH"content="0;url=../02_estudiante/estud_home_view.html">';
      break;

    case '2': // perfil docente
      $_SESSION['user_bd'] = $user_local;
      $_SESSION['password_bd'] = $password_local;
      $_SESSION['user perfil'] = $user_perfil;
      echo'<meta http-equiv="REFRESH"content="0;url=../03_docente/docen_home_view.html">';
      break;

    case '3': //perfil coordinador
      $_SESSION['user_bd'] = $user_local;
      $_SESSION['password_bd'] = $password_local;
      $_SESSION['user perfil'] = $user_perfil;
      echo'<meta http-equiv="REFRESH"content="0;url=../04_coordinador/coord_home_view.html">';
      break;

    case '3': //perfil system_admin
      $_SESSION['user_bd'] = $user_local;
      $_SESSION['password_bd'] = $password_local;
      $_SESSION['user perfil'] = $user_perfil;
      echo'<meta http-equiv="REFRESH"content="0;url=../05_system/system_home_view.html">';
      break;
  }
}else{
  echo'<meta http-equiv="REFRESH"content="0;url=login_error_view.html">';
  };

// CERRAR LA CONEXIÓN
mysqli_close($conn);
?>
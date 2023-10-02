<?php
session_start();
header('Content-Type: application/json');
require "../00_connect/pdo.php";

//RECOGER LOS DATOS DE SESION EN VARIABLES
$usuarioUser = $_SESSION['usuario_user'];
$usuarioPassword = $_SESSION['usuario_password'];
$usuarioId = $_SESSION['usuario_id'];


switch ($_GET['accion']) {


  case 'carga_pagina_principal':
    $sql = "SELECT
    CONCAT(usuario_nombres,' ',usuario_apellidos) AS nombres_completos
    FROM USUARIOS
    WHERE usuario_id = ($_SESSION[usuario_id]);
    ";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($result);
    break;


  case 'carga_dttbl_grupos_asignados_aso':
    $sql = "SELECT
    grupo_id,
    MODULOS.modulo_nombre,
    MODULOS.modulo_semestre,
    JORNADAS.jornada_nombre,
    grupo_fch_inicio,
    grupo_fch_fin
    FROM GRUPO_MATERIAS
    INNER JOIN MODULOS
    ON MODULOS.modulo_id=GRUPO_MATERIAS.modulo_id
    INNER JOIN JORNADAS
    ON JORNADAS.jornada_id=GRUPO_MATERIAS.jornada_id
    WHERE MODULOS.programa_id='1'
    AND docente_id = ($_SESSION[usuario_id]);
    ";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($result);
    break;

  case 'carga_dttbl_grupos_asignados_md':
    $sql = "SELECT
    grupo_id,
    MODULOS.modulo_nombre,
    MODULOS.modulo_semestre,
    JORNADAS.jornada_nombre,
    grupo_fch_inicio,
    grupo_fch_fin
    FROM GRUPO_MATERIAS
    INNER JOIN MODULOS
    ON MODULOS.modulo_id=GRUPO_MATERIAS.modulo_id
    INNER JOIN JORNADAS
    ON JORNADAS.jornada_id=GRUPO_MATERIAS.jornada_id
    WHERE MODULOS.programa_id='2'
    AND docente_id = ($_SESSION[usuario_id]);
    ";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($result);
    break;


  case 'listar_calificaciones_grupo':
    $sql = "SELECT
      cal_id,
      grupo_id,
      ESTUDIANTES.estudiante_id,
      ESTUDIANTES.estudiante_nombres,
      ESTUDIANTES.estudiante_apellidos,
      cal_nota1,
      ROUND((cal_nota1*0.20), 1) AS pond_nota1,
      cal_nota2,
      ROUND((cal_nota2*0.20), 1) AS pond_nota2,
      cal_nota3,
      ROUND((cal_nota3*0.20), 1) AS pond_nota3,
      cal_nota4,
      ROUND((cal_nota4*0.20), 1) AS pond_nota4,
     ROUND(((cal_nota1*0.20)+(cal_nota2*0.20) +(cal_nota3*0.40) +(cal_nota4*0.20)),1) as cal_nota_final,
      cal_nota_habilitacion
    FROM
      CALIFICACIONES
    INNER JOIN ESTUDIANTES ON CALIFICACIONES.estudiante_id = ESTUDIANTES.estudiante_id
    WHERE grupo_id=$_GET[grupo_id]
    ORDER BY ESTUDIANTES.estudiante_apellidos ASC
    ;
    ";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($result);
    break;

  case 'listar_notas_estudiante':
    $sql = "SELECT
    CALIFICACIONES.cal_id,
    CALIFICACIONES.estudiante_id,
    CALIFICACIONES.grupo_id,
    CONCAT(ESTUDIANTES.estudiante_nombres,' ', ESTUDIANTES.estudiante_apellidos) AS estudiante_nombres,
    cal_nota1,
    cal_nota1_tipo,
      ROUND((cal_nota1*0.20), 1) AS pond_nota1,
    cal_nota2,
    cal_nota2_tipo,
      ROUND((cal_nota2*0.20), 1) AS pond_nota2,
    cal_nota3,
    cal_nota3_tipo,
      ROUND((cal_nota3*0.20), 1) AS pond_nota3,
    cal_nota4,
    cal_nota4_tipo,
      ROUND((cal_nota4*0.20), 1) AS pond_nota4,
    cal_nota_final,
     ROUND(((cal_nota1*0.20)+(cal_nota2*0.20) +(cal_nota3*0.40) +(cal_nota4*0.20)),1) as cal_nota_final
    FROM CALIFICACIONES
    INNER JOIN ESTUDIANTES
    ON ESTUDIANTES.estudiante_id=CALIFICACIONES.estudiante_id
    WHERE CALIFICACIONES.estudiante_id=$_GET[estudiante_id]
    AND grupo_id=$_GET[grupo_id]
    ";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($result);
    break;

  case 'carga_slct_calificacion_tipo':
    $sql = "SELECT
  cal_tipo_id,
  cal_tipo_nombre
  FROM CALIFICACIONES_TIPO
  ";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $users_result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo '<option value="0">Seleccionar</option>';
    foreach ($users_result as $row) {
      echo '<option value="' . $row["cal_tipo_id"] . '">' . $row["cal_tipo_nombre"] . '</option>';
    };
    break;

  case 'modificar_notas':
    $sql = "UPDATE CALIFICACIONES 
    SET
      cal_nota1= '$_POST[cal_nota1]',
      cal_nota1_tipo= '$_POST[cal_nota1_tipo]',
      cal_nota2= '$_POST[cal_nota2]',
      cal_nota2_tipo= '$_POST[cal_nota2_tipo]',
      cal_nota3= '$_POST[cal_nota3]',
      cal_nota3_tipo= '$_POST[cal_nota3_tipo]',
      cal_nota4= '$_POST[cal_nota4]',
      cal_nota4_tipo= '$_POST[cal_nota4_tipo]',
      cal_nota_final= '$_POST[cal_nota_final]',
      cal_nota_final_tipo= '$_POST[cal_nota_final_tipo]'
    WHERE cal_id=$_GET[cal_id]
    ";
    $response = $pdo->exec($sql);
    echo json_encode($response);
    break;
};

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
    ESTUDIANTES.estudiante_id,
    ESTUDIANTES.estudiante_nombres,
    ESTUDIANTES.estudiante_apellidos,
    cal_nota1,
    cal_nota2,
    cal_nota3,
    cal_nota4,
    cal_notadef,
    cal_nota_habilitacion
FROM
    CALIFICACIONES
INNER JOIN ESTUDIANTES ON CALIFICACIONES.estudiante_id = ESTUDIANTES.estudiante_id
WHERE grupo_id=$_GET[grupo_id];
";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($result);
    break;
};

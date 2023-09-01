<?php
session_start();
header('Content-Type: application/json');
require "../00_connect/pdo.php";

//RECOGER LOS DATOS DE SESION EN VARIABLES
$usuarioUser = $_SESSION['usuario_user'];
$usuarioPassword = $_SESSION['usuario_password'];
$usuarioId = $_SESSION['usuario_id'];


switch ($_GET['accion']) {

  case 'carga_dttbl_grupos_asignados_aso':
    $sql = "SELECT
    grupo_id,
    MODULOS.modulo_nombre,
    MODULOS.modulo_semestre,
    grupo_fch_inicio,
    grupo_fch_fin
    FROM GRUPO_MATERIAS
    INNER JOIN MODULOS
    ON MODULOS.modulo_id=GRUPO_MATERIAS.modulo_id
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
    grupo_fch_inicio,
    grupo_fch_fin
    FROM GRUPO_MATERIAS
    INNER JOIN MODULOS
    ON MODULOS.modulo_id=GRUPO_MATERIAS.modulo_id
    WHERE MODULOS.programa_id='2'
    AND docente_id = ($_SESSION[usuario_id]);
    ";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($result);
    break;

};

<?php
session_start();
header('Content-Type: application/json');
require "../00_connect/pdo.php";


switch ($_GET['accion']) {

  case 'carga_dttbl_todas_las_calificaciones':
    $sql = "SELECT
cal_id,
CONCAT(USUARIOS.usuario_nombres,' ', USUARIOS.usuario_apellidos) AS docente,
CALIFICACIONES.estudiante_id,
CONCAT(ESTUDIANTES.estudiante_nombres,' ',ESTUDIANTES.estudiante_apellidos) AS estudiante,
CALIFICACIONES.grupo_id,
MODULOS.modulo_nombre,
GRUPO_MATERIAS.grupo_sem_ejecucion AS semestre_actual,
cal_nota1,
cal_nota1_tipo,
cal_nota2,
cal_nota2_tipo,
cal_nota3,
cal_nota3_tipo,
cal_nota4,
cal_nota4_tipo,
cal_nota_final,
cal_nota_final_tipo,
cal_nota_habilitacion
FROM CALIFICACIONES
INNER JOIN  ESTUDIANTES
ON ESTUDIANTES.estudiante_id=CALIFICACIONES.estudiante_id
INNER JOIN  GRUPO_MATERIAS
ON GRUPO_MATERIAS.grupo_id=CALIFICACIONES.grupo_id
INNER JOIN MODULOS
ON GRUPO_MATERIAS.modulo_id=MODULOS.modulo_id
INNER JOIN USUARIOS
on USUARIOS.usuario_id= GRUPO_MATERIAS.docente_id;
    ";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($result);
    break;
};

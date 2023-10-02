<?php
//header('Content-Type: application/json');
require "../00_connect/pdo.php";
$sql="SELECT
  cal_tipo_id,
  cal_tipo_nombre
  FROM CALIFICACIONES_TIPO
  ";
$stmt = $pdo-> prepare($sql);
$stmt -> execute();
$users_result = $stmt -> fetchAll(PDO::FETCH_ASSOC);
echo '<option value="0" disabled selected hidden></option>';
foreach ($users_result as $row){
echo '<option value="'.$row["cal_tipo_id"].'">'.$row["cal_tipo_nombre"].'</option>';
};
?>
<?php

require_once 'vehiculo.php';

$vh = new Vehiculo();
$vh = $vh ->listado_paginado_vehiculos(1,5);
print_r($vh);
?>
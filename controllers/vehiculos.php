<?php

require_once '../models/vehiculo.php';

if(empty($_REQUEST['op'])){
    echo "error en la solicitud";
} else {
    $option = $_REQUEST['op'];

    if ($option == "__agregar") {
        if (isset($_POST)) {
            // Receive the data from the form
            $nombre = trim($_POST['nombre']);
            $identificacion = trim($_POST['identificacion']);
            $telefono = trim($_POST['telefono']);
            $correo = trim($_POST['correo']);
            $marca = trim($_POST['marca']);
            $modelo = trim($_POST['modelo']);
            $tipo = trim($_POST['tipo']);
            $color = trim($_POST['color']);
            $placa = trim($_POST['placa']);
            $motivo = trim($_POST['motivo']);
    
            // Create a new News object
            $nv = new Vehiculo();
    
            // Add the news to the database
            $rs = $nv-> agregar_vehiculo($nombre, $identificacion, $telefono, $correo, $marca, $tipo, $modelo, $color, $placa, $motivo);
    
            // Check if the news was added successfully
            if ($rs > 0) {
                // The page was added successfully, so create a JSON response
                $arrResp = array('status' => true, 'msg' => 'SUCCESS');
                echo json_encode($arrResp);
            } else {
                // The page was not added successfully, so create a JSON response
                $arrResp = array('status' => false, 'msg' => 'ERROR');
                echo json_encode($arrResp);
            }
        }
    }

    if ($option == "__editar") {
        if (isset($_POST)) {
            // Receive the data from the form
            $id = trim($_POST['id']);
            $titulo = trim($_POST['tarea']);
            $contenido = trim($_POST['descripcion']);
    
            // Create a new News object
            $tarea = new Tareas();
    
            // Add the news to the database
            $rs = $tarea-> editar_tarea($id, $titulo, $contenido);
    
            // Check if the news was added successfully
            if ($rs > 0) {
                // The page was added successfully, so create a JSON response
                $arrResp = array('status' => true, 'msg' => 'SUCCESS');
                echo json_encode($arrResp);
            } else {
                // The page was not added successfully, so create a JSON response
                $arrResp = array('status' => false, 'msg' => 'ERROR');
                echo json_encode($arrResp);
            }
        }
    }

    if ($option == "__eliminar") {
        if (isset($_POST)) {
            // Receive the data from the form
            $id = trim($_POST['id']);
            // Create a new News object
            $tarea = new Tareas();
            $rs = $tarea->eliminar_tarea($id);
            // Check if the news was added successfully
            if ($rs) {
                // The page was added successfully, so create a JSON response
                $arrResp = array('status' => true, 'msg' => 'SUCCESS');
                echo json_encode($arrResp);
            } else {
                // The page was not added successfully, so create a JSON response
                $arrResp = array('status' => false, 'msg' => 'ERROR');
                echo json_encode($arrResp);
            }
        }
    }
    
    if ($option == "listarTareas") {
            // Receive the data from the form
            $tarea = new Tareas();
            // Add the news to the database
            $rs = $tarea-> mostrar_tareas();
    
            // Check if the news was added successfully
            //if (!empty($rs)) {
                // The page was added successfully, so create a JSON response
                $arrResp = array('status' => true, 'msg' => 'SUCCESS', 'data' => $rs);
                echo json_encode($arrResp);
            //} else {
                // The page was not added successfully, so create a JSON response
            //    $arrResp = array('status' => false, 'msg' => 'ERROR');
            //    echo json_encode($arrResp);
            //}
    }

    if($option== "__listado"){
        $tbl = new Vehiculo();
        $tbl = $tbl->cuenta_vehiculos();

        $pagina = isset($_POST['pg']) ? (int)$_POST['pg'] : 1;
        $registros = isset($_POST['registros']) ? (int)$_POST['registros'] : 2;

        $inicio = ($pagina>1) ? (($pagina*$registros)-$registros) : 0;
        
        $total_paginas = ceil($tbl/$registros); // Redondear hacia arriba
        $lp = new Vehiculo();
        $lp = $lp->listado_paginado_vehiculos($inicio, $registros);

        if(!empty($lp)){
            $arrResp=array("status"=>true,"msg"=>"OK", "data"=> $lp, "total_paginas"=> $total_paginas);
            echo json_encode($arrResp);
            die();
        }

    }
    
    if ($option == "__mostrarTarea") {
        if (isset($_POST)) {
            // Receive the data from the form
            $id = trim($_POST['id']);
            // Create a new News object
            $tarea = new Tareas();
            $rs = $tarea->mostrar_tarea_id($id);
            // Check if the news was added successfully
            if ($rs) {
                // The page was added successfully, so create a JSON response
                $arrResp = array('status' => true, 'msg' => 'SUCCESS', 'data'=> $rs);
                echo json_encode($arrResp);
            } else {
                // The page was not added successfully, so create a JSON response
                $arrResp = array('status' => false, 'msg' => 'ERROR');
                echo json_encode($arrResp);
            }
        }
    }


}

?>
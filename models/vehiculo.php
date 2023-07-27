<?php

require_once 'connect.php';

class Vehiculo {
    private $conexion;

    public function __construct(){
        $this->conexion = new ConexionBDD();
        $this->conexion = $this->conexion->connect();
    }

   
    public function vehiculo($idpropietario, $marca, $modelo, $color, $tipo, $placa, $motivo){
        $fecha = date('Y-m-d');
        $sql = "INSERT INTO vehiculo (idpropietario, marca, modelo, color, tipo, placa, fecha_ingreso, motivo) VALUES (?,?,?,?,?,?,?,?)";
        $insert = $this->conexion ->prepare($sql);
        $data = $insert->execute([$idpropietario, $marca, $modelo, $color, $tipo, $placa, $fecha, $motivo]);
        $Id = $this->conexion->lastInsertId();
        return $Id;
    }

    public function propietario($nombre, $identificacion, $telefono, $correo){
        $sql = "INSERT INTO propietarios (nombre, identificacion, telefono, correo) VALUES (?,?,?,?)";
        $insert = $this->conexion ->prepare($sql);
        $data = $insert->execute([$nombre, $identificacion, $telefono, $correo]);
        $Id = $this->conexion->lastInsertId();
        return $Id;
    }

    public function listado_paginado_vehiculos($inicio, $registros) {
        $sql = "SELECT p.idpropietario, p.nombre, p.correo, v.placa, v.color, v.tipo, v.modelo, v.marca, v.fecha_ingreso 
                FROM propietarios p 
                INNER JOIN vehiculo v ON p.idpropietario = v.idpropietario
                LIMIT $inicio, $registros";
        $stmt = $this->conexion->prepare($sql);
        $stmt->execute();
        $data = $stmt->fetchAll();
        return $data;
    }
    

    public function agregar_vehiculo($nombre, $identificacion, $telefono, $correo, $marca, $tipo, $modelo, $color, $placa, $motivo){
        $pro = self::existe_propietario($identificacion);
        $veh = self::existe_vehiculo($placa);
        if($pro == 0 &&  $veh == 0){
            $rs = self::propietario($nombre, $identificacion, $telefono, $correo);
            $vh = self::vehiculo($rs, $marca, $modelo, $color, $tipo, $placa, $motivo);
            return $vh;
        } 
        if($pro > 0 && $veh == 0){
            $id = self::idpropietario($identificacion);
            $vh = self::vehiculo($id, $marca, $modelo, $color, $tipo, $placa, $motivo);
            return $vh;
        }
    }

    public function existe_propietario($identificacion){
        $sql = "SELECT COUNT(*) as total FROM propietarios WHERE identificacion = ?";
        $stmt = $this->conexion->prepare($sql);
        $stmt -> execute([$identificacion]);
        $data = $stmt -> fetchColumn();
        return $data;
    }

    public function cuenta_vehiculos(){
        $sql = "SELECT COUNT(*) as total FROM vehiculo";
        $stmt = $this->conexion->prepare($sql);
        $stmt -> execute();
        $data = $stmt -> fetchColumn();
        return $data;
    }

    public function idpropietario($identificacion){
        $sql = "SELECT idpropietario FROM propietarios WHERE identificacion = ?";
        $stmt = $this->conexion->prepare($sql);
        $stmt -> execute([$identificacion]);
        $data = $stmt -> fetchColumn();
        return $data;
    }


    public function existe_vehiculo($placa){
        $sql = "SELECT COUNT(*) as total FROM vehiculo WHERE placa = ?";
        $stmt = $this->conexion->prepare($sql);
        $stmt -> execute([$placa]);
        $data = $stmt -> fetchColumn();
        return $data;
    }

    public function editar_tarea($id, $titulo, $contenido){
        $sql = "UPDATE tareas SET tarea = ?, descripcion = ? WHERE id = ?";
        $stmt = $this->conexion->prepare($sql);
        $data = $stmt->execute([$titulo, $contenido, $id]);
        return $data;
    }

    public function mostrar_tarea_id($id){
        $sql = "SELECT id as id, tarea as titulo, descripcion as descripcion FROM tareas WHERE id =?";
        $stmt = $this->conexion->prepare($sql);
        $stmt->execute([$id]);
        $data = $stmt -> fetchAll();
        return $data;
        
    }

    public function mostrar_tareas(){
        $sql = "SELECT * FROM tareas ORDER BY id DESC";
        $stmt = $this->conexion->prepare($sql);
        $stmt->execute();
        $data = $stmt->fetchAll();
        return $data;
        
    }

    public function eliminar_tarea($id){
        $sql = "DELETE FROM tareas  WHERE id = ?";
        $insert = $this->conexion ->prepare($sql);
        $result = $insert->execute([$id]);
        return $result;
    }

}



?>
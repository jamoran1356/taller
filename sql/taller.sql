-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 27, 2023 at 08:48 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taller`
--

-- --------------------------------------------------------

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `idempleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `identificacion` varchar(15) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `correo` varchar(200) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `cargo` varchar(25) COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`idempleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `propietarios`
--

DROP TABLE IF EXISTS `propietarios`;
CREATE TABLE IF NOT EXISTS `propietarios` (
  `idpropietario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `identificacion` varchar(15) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefono` varchar(12) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `correo` varchar(200) COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`idpropietario`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `propietarios`
--

INSERT INTO `propietarios` (`idpropietario`, `nombre`, `identificacion`, `telefono`, `correo`) VALUES
(1, 'Jesus Moran', '13563009', '4146337436', 'Jamoran1356@gmail.com'),
(2, 'John Doe1', '123456781', '414558961', 'correo1@gmail.com'),
(3, 'John Doe1', '123456781', '414558961', 'correo1@gmail.com'),
(4, 'John Doe1', '123456781', '414558961', 'correo1@gmail.com'),
(5, 'John Doe2', '123456782', '414558962', 'correo2@gmail.com'),
(6, 'John Doe3', '123456783', '414558963', 'correo3@gmail.com'),
(7, 'John Doe4', '123456784', '414558964', 'correo4@gmail.com'),
(8, 'John Doe5', '123456785', '414558965', 'correo5@gmail.com'),
(9, 'John Doe6', '123456786', '414558966', 'correo6@gmail.com'),
(10, 'John Doe7', '123456787', '414558967', 'correo7@gmail.com'),
(11, 'John Doe8', '123456788', '414558968', 'correo8@gmail.com'),
(12, 'John Doe9', '123456789', '414558969', 'correo9@gmail.com'),
(13, 'John Doe10', '1234567810', '4145589610', 'correo10@gmail.com'),
(14, 'John Doe11', '1234567811', '4145589611', 'correo11@gmail.com'),
(15, 'John Doe12', '1234567812', '4145589612', 'correo12@gmail.com'),
(16, 'John Doe13', '1234567813', '4145589613', 'correo13@gmail.com'),
(17, 'John Doe14', '1234567814', '4145589614', 'correo14@gmail.com'),
(18, 'John Doe15', '1234567815', '4145589615', 'correo15@gmail.com'),
(19, 'John Doe16', '1234567816', '4145589616', 'correo16@gmail.com'),
(20, 'John Doe17', '1234567817', '4145589617', 'correo17@gmail.com'),
(21, 'John Doe18', '1234567818', '4145589618', 'correo18@gmail.com'),
(22, 'John Doe19', '1234567819', '4145589619', 'correo19@gmail.com'),
(23, 'John Doe20', '1234567820', '4145589620', 'correo20@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
CREATE TABLE IF NOT EXISTS `vehiculo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idpropietario` int NOT NULL,
  `marca` varchar(25) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `modelo` varchar(25) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `color` varchar(15) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `tipo` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `placa` varchar(8) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `idempleado` int NOT NULL,
  `motivo` text COLLATE utf8mb4_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `vehiculo`
--

INSERT INTO `vehiculo` (`id`, `idpropietario`, `marca`, `modelo`, `color`, `tipo`, `placa`, `fecha_ingreso`, `idempleado`, `motivo`, `estado`) VALUES
(1, 1, 'Mitsubishi', 'Lancer', 'Plateado', 'Sedan', 'XSD191', '2023-07-27 00:00:00', 0, 'TREN', 0),
(2, 4, 'BMW', 'modelo1', 'Azul', '4x4', 'JUSH8521', '2023-07-27 00:00:00', 0, '', 0),
(3, 5, 'Chevrolet', 'modelo2', 'Negro', 'Sedan', 'JUSH8522', '2023-07-27 00:00:00', 0, '', 0),
(4, 6, 'Chevrolet', 'modelo3', 'Verde', 'Rustico', 'JUSH8523', '2023-07-27 00:00:00', 0, '', 0),
(5, 7, 'Mitsubishi', 'modelo4', 'Negro', 'Camioneta', 'JUSH8524', '2023-07-27 00:00:00', 0, '', 0),
(6, 8, 'BMW', 'modelo5', 'Azul', 'Sedan', 'JUSH8525', '2023-07-27 00:00:00', 0, '', 0),
(7, 9, 'Mercedes Benz', 'modelo6', 'Gris', 'Camioneta', 'JUSH8526', '2023-07-27 00:00:00', 0, '', 0),
(8, 10, 'Ford', 'modelo7', 'Azul', '4x4', 'JUSH8527', '2023-07-27 00:00:00', 0, '', 0),
(9, 11, 'Chevrolet', 'modelo8', 'Negro', 'Carga', 'JUSH8528', '2023-07-27 00:00:00', 0, '', 0),
(10, 12, 'Mercedes Benz', 'modelo9', 'Rojo', 'Camioneta', 'JUSH8529', '2023-07-27 00:00:00', 0, '', 0),
(11, 13, 'Alfa Romeo', 'modelo10', 'Azul', 'Sedan', 'JUSH8521', '2023-07-27 00:00:00', 0, '', 0),
(12, 14, 'BMW', 'modelo11', 'Negro', 'Rustico', 'JUSH8521', '2023-07-27 00:00:00', 0, '', 0),
(13, 15, 'Ford', 'modelo12', 'Negro', '4x4', 'JUSH8521', '2023-07-27 00:00:00', 0, '', 0),
(14, 16, 'Chevrolet', 'modelo13', 'Gris', 'Rustico', 'JUSH8521', '2023-07-27 00:00:00', 0, '', 0),
(15, 17, 'BMW', 'modelo14', 'Azul', '4x4', 'JUSH8521', '2023-07-27 00:00:00', 0, '', 0),
(16, 18, 'Chevrolet', 'modelo15', 'Azul', 'Rustico', 'JUSH8521', '2023-07-27 00:00:00', 0, '', 0),
(17, 19, 'Alfa Romeo', 'modelo16', 'Negro', '4x4', 'JUSH8521', '2023-07-27 00:00:00', 0, '', 0),
(18, 20, 'Mercedes Benz', 'modelo17', 'Blanco', '4x4', 'JUSH8521', '2023-07-27 00:00:00', 0, '', 0),
(19, 21, 'Mitsubishi', 'modelo18', 'Plateado', '4x4', 'JUSH8521', '2023-07-27 00:00:00', 0, '', 0),
(20, 22, 'Mitsubishi', 'modelo19', 'Blanco', 'Carga', 'JUSH8521', '2023-07-27 00:00:00', 0, '', 0),
(21, 23, 'Toyota', 'modelo20', 'Rojo', 'Sedan', 'JUSH8522', '2023-07-27 00:00:00', 0, '', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

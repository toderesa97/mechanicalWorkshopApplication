-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 17, 2017 at 10:28 
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `TALLER`
--

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `sexo` varchar(6) NOT NULL,
  `provincia` varchar(30) DEFAULT NULL,
  `domicilio` varchar(50) DEFAULT NULL,
  `fecha_alta` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clientes`
-- rest of fields have been invented

INSERT INTO `clientes` (`dni`, `nombre`, `apellidos`, `sexo`, `provincia`, `domicilio`, `fecha_alta`) VALUES
('HideDNI', 'maria', 'santana', 'Mujer', 'Las Palmas', '7 palmas', '2017-02-17 20:53:23'),
('HideDNI', 'tomas', 'reyes', 'Hombre', 'Las Palmas', 'San lorenzo', '2017-02-17 20:48:27'),
('HideDNI', 'Pablo', 'Reyes', 'Hombre', 'SC de Tenerife', 'car', '2017-02-17 21:16:40'),
('HideDNI', 'jesus', 'santana medina', 'Hombre', 'Albacete', 'carretetsa los olmos', '2017-02-16 19:44:15');

-- --------------------------------------------------------

--
-- Table structure for table `clientes_coches`
--

CREATE TABLE `clientes_coches` (
  `dni` varchar(9) NOT NULL,
  `matricula` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clientes_coches`
--
-- field 'Matriculas' have been invented 
INSERT INTO `clientes_coches` (`dni`, `matricula`) VALUES
('HideDNI', '2145-gfd'),
('HideDNI', '2308-fdt'),
('HideDNI', '2309-fdp'),
('HideDNI', '2356hgf'),
('HideDNI', '3456-gfj'),
('HideDNI', '4327-bhv'),
('HideDNI', '4434-dbt'),
('HideDNI', '4536-fde'),
('HideDNI', '5462-fgt'),
('HideDNI', '5465-fgh'),
('HideDNI', 'gc-9876-jh');

-- --------------------------------------------------------

--
-- Table structure for table `coches`
--

CREATE TABLE `coches` (
  `matricula` varchar(15) NOT NULL,
  `marca` varchar(15) NOT NULL,
  `caballaje` int(4) NOT NULL,
  `modelo` varchar(15) NOT NULL,
  `color` varchar(15) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `dni_cliente` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coches`
--

INSERT INTO `coches` (`matricula`, `marca`, `caballaje`, `modelo`, `color`, `descripcion`, `dni_cliente`) VALUES
('4536-fde', 'Audi', 220, 'clase a ', 'Item 1', 'la lechee', 'HideDNI');

-- --------------------------------------------------------

--
-- Table structure for table `mecanico`
--

CREATE TABLE `mecanico` (
  `nombre` varchar(30) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `contrasenia` varchar(30) NOT NULL,
  `iamprivate` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mecanico`
--

INSERT INTO `mecanico` (`nombre`, `usuario`, `contrasenia`, `iamprivate`) VALUES
('Tomas', '', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`dni`);

--
-- Indexes for table `clientes_coches`
--
ALTER TABLE `clientes_coches`
  ADD PRIMARY KEY (`matricula`);

--
-- Indexes for table `coches`
--
ALTER TABLE `coches`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `dni_cliente` (`dni_cliente`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coches`
--
ALTER TABLE `coches`
  ADD CONSTRAINT `coches_ibfk_1` FOREIGN KEY (`dni_cliente`) REFERENCES `clientes` (`dni`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

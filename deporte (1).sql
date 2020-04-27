-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2020 at 05:12 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `deporte`
--

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `codigo_categoria` varchar(11) NOT NULL,
  `descripcion_categoria` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`codigo_categoria`, `descripcion_categoria`) VALUES
('c10', 'Sub10'),
('c11', 'Sub11'),
('c12', 'Sub12'),
('c3', 'Sub3'),
('c4', 'Sub4'),
('c5', 'Sub5'),
('c6', 'Sub6'),
('c7', 'Sub7'),
('c8', 'Sub8'),
('c9', 'Sub9');

-- --------------------------------------------------------

--
-- Table structure for table `deporte`
--

CREATE TABLE `deporte` (
  `codigo_deporte` varchar(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deporte`
--

INSERT INTO `deporte` (`codigo_deporte`, `nombre`) VALUES
('46357', 'Futbol');

-- --------------------------------------------------------

--
-- Table structure for table `deporte_categoria_horario`
--

CREATE TABLE `deporte_categoria_horario` (
  `codigo_relacion` varchar(11) NOT NULL,
  `codigo_categoria` varchar(11) NOT NULL,
  `codigo_horario` varchar(11) NOT NULL,
  `codigo_deporte` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deporte_categoria_horario`
--

INSERT INTO `deporte_categoria_horario` (`codigo_relacion`, `codigo_categoria`, `codigo_horario`, `codigo_deporte`) VALUES
('44370', 'c10', 'cls1012', '46357'),
('45275', 'c10', 'cls68', '46357'),
('89462', 'c9', 'cls1012', '46357'),
('99618', 'c10', 'cls122', '46357');

-- --------------------------------------------------------

--
-- Table structure for table `entrenador`
--

CREATE TABLE `entrenador` (
  `id` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `entrenador_deporte`
--

CREATE TABLE `entrenador_deporte` (
  `deporte_codigo_deporte` varchar(11) NOT NULL,
  `entrenador_id` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `estudiante`
--

CREATE TABLE `estudiante` (
  `id` varchar(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `fecha_nacimiento` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `estudiante_tutor`
--

CREATE TABLE `estudiante_tutor` (
  `estudiante_id` varchar(11) NOT NULL,
  `tutor_id` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `horario`
--

CREATE TABLE `horario` (
  `codigo_horario` varchar(11) NOT NULL,
  `descripcion_horario` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `horario`
--

INSERT INTO `horario` (`codigo_horario`, `descripcion_horario`) VALUES
('cls1012', 'Clase sabados 10 am a 12 am'),
('cls122', 'Clase sabados 12 am a 2 pm'),
('cls24', 'Clase sabados 2 pm a 4 pm'),
('cls68', 'Clase sabados 6 am a 8 am'),
('cls810', 'Clase sabados 8 am a 10 am');

-- --------------------------------------------------------

--
-- Table structure for table `matricula`
--

CREATE TABLE `matricula` (
  `codigo_matricula` varchar(11) NOT NULL,
  `id` varchar(11) NOT NULL,
  `codigo_relacion` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE `persona` (
  `id` varchar(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `celular` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seguimiento`
--

CREATE TABLE `seguimiento` (
  `codigo` varchar(11) NOT NULL,
  `cumplimiento` varchar(30) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `codigo_matricula` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

CREATE TABLE `tutor` (
  `id` varchar(11) NOT NULL,
  `parentesco` varchar(20) NOT NULL,
  `direccion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `e_mail` varchar(40) NOT NULL,
  `clave` varchar(30) NOT NULL,
  `tipo_usuario` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`e_mail`, `clave`, `tipo_usuario`) VALUES
('carlos_moreno82151@elpoli.edu.co', '12344', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`codigo_categoria`);

--
-- Indexes for table `deporte`
--
ALTER TABLE `deporte`
  ADD PRIMARY KEY (`codigo_deporte`);

--
-- Indexes for table `deporte_categoria_horario`
--
ALTER TABLE `deporte_categoria_horario`
  ADD PRIMARY KEY (`codigo_relacion`),
  ADD KEY `deporte_categoria_horario_categoria_fk` (`codigo_categoria`),
  ADD KEY `deporte_categoria_horario_deporte_fk` (`codigo_deporte`),
  ADD KEY `deporte_categoria_horario_horario_fk` (`codigo_horario`);

--
-- Indexes for table `entrenador`
--
ALTER TABLE `entrenador`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entrenador_deporte`
--
ALTER TABLE `entrenador_deporte`
  ADD PRIMARY KEY (`deporte_codigo_deporte`,`entrenador_id`),
  ADD KEY `entrenador_deporte_entrenador_fk` (`entrenador_id`);

--
-- Indexes for table `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estudiante_tutor`
--
ALTER TABLE `estudiante_tutor`
  ADD PRIMARY KEY (`estudiante_id`,`tutor_id`),
  ADD KEY `estudiante_tutor_tutor_fk` (`tutor_id`);

--
-- Indexes for table `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`codigo_horario`);

--
-- Indexes for table `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`codigo_matricula`),
  ADD KEY `matricula_deporte_categoria_horario_fk` (`codigo_relacion`),
  ADD KEY `matricula_estudiante_fk` (`id`);

--
-- Indexes for table `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seguimiento`
--
ALTER TABLE `seguimiento`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `seguimiento_matricula_fk` (`codigo_matricula`);

--
-- Indexes for table `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`e_mail`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deporte_categoria_horario`
--
ALTER TABLE `deporte_categoria_horario`
  ADD CONSTRAINT `deporte_categoria_horario_categoria_fk` FOREIGN KEY (`codigo_categoria`) REFERENCES `categoria` (`codigo_categoria`),
  ADD CONSTRAINT `deporte_categoria_horario_deporte_fk` FOREIGN KEY (`codigo_deporte`) REFERENCES `deporte` (`codigo_deporte`),
  ADD CONSTRAINT `deporte_categoria_horario_horario_fk` FOREIGN KEY (`codigo_horario`) REFERENCES `horario` (`codigo_horario`);

--
-- Constraints for table `entrenador`
--
ALTER TABLE `entrenador`
  ADD CONSTRAINT `entrenador_persona_fk` FOREIGN KEY (`id`) REFERENCES `persona` (`id`);

--
-- Constraints for table `entrenador_deporte`
--
ALTER TABLE `entrenador_deporte`
  ADD CONSTRAINT `entrenador_deporte_deporte_fk` FOREIGN KEY (`deporte_codigo_deporte`) REFERENCES `deporte` (`codigo_deporte`),
  ADD CONSTRAINT `entrenador_deporte_entrenador_fk` FOREIGN KEY (`entrenador_id`) REFERENCES `entrenador` (`id`);

--
-- Constraints for table `estudiante_tutor`
--
ALTER TABLE `estudiante_tutor`
  ADD CONSTRAINT `estudiante_tutor_estudiante_fk` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`),
  ADD CONSTRAINT `estudiante_tutor_tutor_fk` FOREIGN KEY (`tutor_id`) REFERENCES `tutor` (`id`);

--
-- Constraints for table `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_deporte_categoria_horario_fk` FOREIGN KEY (`codigo_relacion`) REFERENCES `deporte_categoria_horario` (`codigo_relacion`),
  ADD CONSTRAINT `matricula_estudiante_fk` FOREIGN KEY (`id`) REFERENCES `estudiante` (`id`);

--
-- Constraints for table `seguimiento`
--
ALTER TABLE `seguimiento`
  ADD CONSTRAINT `seguimiento_matricula_fk` FOREIGN KEY (`codigo_matricula`) REFERENCES `matricula` (`codigo_matricula`);

--
-- Constraints for table `tutor`
--
ALTER TABLE `tutor`
  ADD CONSTRAINT `tutor_persona_fk` FOREIGN KEY (`id`) REFERENCES `persona` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2020 at 08:02 PM
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
-- Database: `deportepoli`
--

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `codigo` varchar(400) NOT NULL,
  `descripcion` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categoria_horario`
--

CREATE TABLE `categoria_horario` (
  `categoria_codigo` varchar(400) NOT NULL,
  `horario_codigo` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deporte`
--

CREATE TABLE `deporte` (
  `codigo` varchar(400) NOT NULL,
  `descripcion` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deporte`
--

INSERT INTO `deporte` (`codigo`, `descripcion`) VALUES
('1', 'Futbol'),
('2', 'Baloncesto'),
('3', 'Natacion'),
('4', 'Tenis'),
('5', 'Gimnasia'),
('6', 'Patinaje'),
('7', 'Artes marciales'),
('8', 'Beisbol');

-- --------------------------------------------------------

--
-- Table structure for table `deporte_categoria`
--

CREATE TABLE `deporte_categoria` (
  `deporte_codigo` varchar(400) NOT NULL,
  `categoria_codigo` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `entrenador`
--

CREATE TABLE `entrenador` (
  `id` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `estudiante`
--

CREATE TABLE `estudiante` (
  `id` varchar(400) NOT NULL,
  `nombre` varchar(400) NOT NULL,
  `apellido` varchar(400) NOT NULL,
  `fecha_nacimiento` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estudiante`
--

INSERT INTO `estudiante` (`id`, `nombre`, `apellido`, `fecha_nacimiento`) VALUES
('123', '123123123123123123123', '123123123123123123123123123123123123123123123123123123', '1998-03-04'),
('1231231', '23123', '123123', '1998-03-04'),
('132222222', '222222222222222', '222222222222222', '1998-03-04'),
('321', '11111111111', '111111111111111111', '1998-03-04'),
('32111111111', '111111111111', '111111111111111111', '2020-04-08'),
('33333333333', '3333333333333', '333333333333333', '1998-03-04');

-- --------------------------------------------------------

--
-- Table structure for table `estudiante_tutor`
--

CREATE TABLE `estudiante_tutor` (
  `estudiante_id` varchar(400) NOT NULL,
  `tutor_id` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estudiante_tutor`
--

INSERT INTO `estudiante_tutor` (`estudiante_id`, `tutor_id`) VALUES
('123', '123'),
('123', '132'),
('123', '213'),
('123', '231'),
('123', '312'),
('1231231', '213'),
('132222222', '12333333'),
('321', '321'),
('32111111111', '32111111111'),
('33333333333', '312');

-- --------------------------------------------------------

--
-- Table structure for table `horario`
--

CREATE TABLE `horario` (
  `codigo` varchar(400) NOT NULL,
  `descripcion` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `horario`
--

INSERT INTO `horario` (`codigo`, `descripcion`) VALUES
('cl1012', 'Clase sabados 10 am a 12 am'),
('cl68', 'Clase sabados 6 am a 8 am'),
('cl810', 'Clase sabados 8 am a 10 am');

-- --------------------------------------------------------

--
-- Table structure for table `matricula`
--

CREATE TABLE `matricula` (
  `codigo` varchar(400) NOT NULL,
  `estudiante_id` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `matricula_deporte`
--

CREATE TABLE `matricula_deporte` (
  `matricula_codigo` varchar(400) NOT NULL,
  `deporte_codigo` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `persoan`
--

CREATE TABLE `persoan` (
  `id` varchar(400) NOT NULL,
  `nombre` varchar(400) NOT NULL,
  `apellido` varchar(400) NOT NULL,
  `telefono` varchar(400) DEFAULT NULL,
  `celular` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `persoan`
--

INSERT INTO `persoan` (`id`, `nombre`, `apellido`, `telefono`, `celular`) VALUES
('123', '321', '123', '213', '123'),
('12333333', '333333333333', '3333333333333', '3333333', '3333333333'),
('132', '22222222', '22222222222', '2222222', '2222222222'),
('213', '333333333', '33333333333333', '3333333', '3333333333'),
('231', '123', '213', '312', '231'),
('312', '22222222', '22222222222', '2222222', '2222222222'),
('321', '11111111', '1111111111111', '1111111', '1111111111'),
('32111111', '111111111111', '11111111111111', '1111111', '1111111111'),
('32111111111', '11111111111', '111111111111111111', '1111111', '1111111111');

-- --------------------------------------------------------

--
-- Table structure for table `profesor_deporte`
--

CREATE TABLE `profesor_deporte` (
  `entrenador_id` varchar(400) NOT NULL,
  `deporte_codigo` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seguimiento`
--

CREATE TABLE `seguimiento` (
  `codigo` varchar(400) NOT NULL,
  `cumplimiento` char(1) NOT NULL,
  `descripcion` varchar(400) NOT NULL,
  `estudiante_id` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

CREATE TABLE `tutor` (
  `parentesco` varchar(400) NOT NULL,
  `id` varchar(400) NOT NULL,
  `direccion` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tutor`
--

INSERT INTO `tutor` (`parentesco`, `id`, `direccion`) VALUES
('Tia', '123', '213'),
('Hermana', '12333333', '3333333333'),
('Hermano', '132', '22222222'),
('Hermano', '213', '3333333333'),
('Padre', '231', '123'),
('Hermano', '312', '2222222222'),
('Hermana', '321', '1111111111'),
('Vecino', '32111111111', '1111111111');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `e_mail` varchar(40) NOT NULL,
  `clave` varchar(30) NOT NULL,
  `tipo_usuario` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`e_mail`, `clave`, `tipo_usuario`) VALUES
('carlos_moreno82151@elpoli.edu.co', '12344', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `categoria_horario`
--
ALTER TABLE `categoria_horario`
  ADD PRIMARY KEY (`categoria_codigo`,`horario_codigo`),
  ADD KEY `categoria_horario_horario_fk` (`horario_codigo`);

--
-- Indexes for table `deporte`
--
ALTER TABLE `deporte`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `deporte_categoria`
--
ALTER TABLE `deporte_categoria`
  ADD PRIMARY KEY (`deporte_codigo`,`categoria_codigo`),
  ADD KEY `deporte_categoria_categoria_fk` (`categoria_codigo`);

--
-- Indexes for table `entrenador`
--
ALTER TABLE `entrenador`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `matricula_estudiante_fk` (`estudiante_id`);

--
-- Indexes for table `matricula_deporte`
--
ALTER TABLE `matricula_deporte`
  ADD PRIMARY KEY (`matricula_codigo`,`deporte_codigo`),
  ADD KEY `matricula_deporte_deporte_fk` (`deporte_codigo`);

--
-- Indexes for table `persoan`
--
ALTER TABLE `persoan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profesor_deporte`
--
ALTER TABLE `profesor_deporte`
  ADD PRIMARY KEY (`entrenador_id`,`deporte_codigo`),
  ADD KEY `profesor_deporte_deporte_fk` (`deporte_codigo`);

--
-- Indexes for table `seguimiento`
--
ALTER TABLE `seguimiento`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `seguimiento_estudiante_fk` (`estudiante_id`);

--
-- Indexes for table `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`e_mail`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categoria_horario`
--
ALTER TABLE `categoria_horario`
  ADD CONSTRAINT `categoria_horario_categoria_fk` FOREIGN KEY (`categoria_codigo`) REFERENCES `categoria` (`codigo`),
  ADD CONSTRAINT `categoria_horario_horario_fk` FOREIGN KEY (`horario_codigo`) REFERENCES `horario` (`codigo`);

--
-- Constraints for table `deporte_categoria`
--
ALTER TABLE `deporte_categoria`
  ADD CONSTRAINT `deporte_categoria_categoria_fk` FOREIGN KEY (`categoria_codigo`) REFERENCES `categoria` (`codigo`),
  ADD CONSTRAINT `deporte_categoria_deporte_fk` FOREIGN KEY (`deporte_codigo`) REFERENCES `deporte` (`codigo`);

--
-- Constraints for table `entrenador`
--
ALTER TABLE `entrenador`
  ADD CONSTRAINT `entrenador_persoan_fk` FOREIGN KEY (`id`) REFERENCES `persoan` (`id`);

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
  ADD CONSTRAINT `matricula_estudiante_fk` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`);

--
-- Constraints for table `matricula_deporte`
--
ALTER TABLE `matricula_deporte`
  ADD CONSTRAINT `matricula_deporte_deporte_fk` FOREIGN KEY (`deporte_codigo`) REFERENCES `deporte` (`codigo`),
  ADD CONSTRAINT `matricula_deporte_matricula_fk` FOREIGN KEY (`matricula_codigo`) REFERENCES `matricula` (`codigo`);

--
-- Constraints for table `profesor_deporte`
--
ALTER TABLE `profesor_deporte`
  ADD CONSTRAINT `profesor_deporte_deporte_fk` FOREIGN KEY (`deporte_codigo`) REFERENCES `deporte` (`codigo`),
  ADD CONSTRAINT `profesor_deporte_entrenador_fk` FOREIGN KEY (`entrenador_id`) REFERENCES `entrenador` (`id`);

--
-- Constraints for table `seguimiento`
--
ALTER TABLE `seguimiento`
  ADD CONSTRAINT `seguimiento_estudiante_fk` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`);

--
-- Constraints for table `tutor`
--
ALTER TABLE `tutor`
  ADD CONSTRAINT `tutor_persoan_fk` FOREIGN KEY (`id`) REFERENCES `persoan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

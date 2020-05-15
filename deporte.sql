-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2020 at 03:11 AM
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
-- Table structure for table `clase`
--

CREATE TABLE `clase` (
  `codigo_relacion` varchar(11) NOT NULL,
  `id` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clase`
--

INSERT INTO `clase` (`codigo_relacion`, `id`) VALUES
('89462', '33333333412'),
('99618', '33333333412');

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
('50263', 'c3', 'cls68', '46357'),
('88994', 'c3', 'cls24', '46357'),
('89462', 'c9', 'cls1012', '46357'),
('99618', 'c10', 'cls122', '46357');

-- --------------------------------------------------------

--
-- Table structure for table `entrenador`
--

CREATE TABLE `entrenador` (
  `id` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entrenador`
--

INSERT INTO `entrenador` (`id`) VALUES
('00004382498'),
('33333333412'),
('66647587457');

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
  `fecha_nacimiento` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estudiante`
--

INSERT INTO `estudiante` (`id`, `nombre`, `apellido`, `fecha_nacimiento`) VALUES
('001122', 'Diamond', 'Stalker', '12-abr-2010'),
('1', 'nombre1', '1.0', '12-abr-2010'),
('11', '11.0', '11.0', '12-abr-2010'),
('12323235432', '312312123', '123231213', '2010-06-28'),
('13', '13.0', '13.0', '12-abr-2010'),
('15', '15.0', '15.0', '20-oct-2010'),
('15554333333', '543333333333333333333333333333', '333333333333333333333333333', '2010-06-23'),
('17', '17.0', '17.0', '12-abr-2010'),
('19938438756', '321123671328697', '26347892387946', '2010-06-16'),
('3', '3.0', '3.0', '20-oct-2010'),
('31236654645', 'CASCASDC', 'DASDASDASD', '2010-10-14'),
('33245523423', 'diamos', 'sad', '2010-05-14'),
('42342342341', 'eqweqwe', 'wqeqwe', '2010-07-27'),
('42755523423', 'EWQQQQQQQQQ', 'QQQQQQQQQQQQQQQ', '2010-06-29'),
('434323', 'Carlos', 'Moreno', '12-abr-2010'),
('6', '6.0', '6.0', '20-oct-2010'),
('65555555574', 'QWEQ', 'EWQ', '2010-06-17'),
('666261', 'das', 'da', '12-abr-2010'),
('8', '8.0', '8.0', '20-oct-2010'),
('88821378921', '4322222222222222222', '22222222222222222222', '2010-07-21'),
('89200348432', '2346782364789', '437894358706', '2010-06-21');

-- --------------------------------------------------------

--
-- Table structure for table `estudiante_tutor`
--

CREATE TABLE `estudiante_tutor` (
  `estudiante_id` varchar(11) NOT NULL,
  `tutor_id` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estudiante_tutor`
--

INSERT INTO `estudiante_tutor` (`estudiante_id`, `tutor_id`) VALUES
('12323235432', '23444444432'),
('15554333333', '12312454653'),
('19938438756', '45456456456'),
('31236654645', '45452342344'),
('33245523423', '34413667345'),
('42342342341', '31223123121'),
('42755523423', '56434444444'),
('65555555574', '35445343543'),
('88821378921', '31245476356'),
('88821378921', '65445654453'),
('89200348432', '34343434343');

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

--
-- Dumping data for table `matricula`
--

INSERT INTO `matricula` (`codigo_matricula`, `id`, `codigo_relacion`) VALUES
('09262', '88821378921', '44370'),
('78729', '19938438756', '99618'),
('78732', '19938438756', '89462');

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

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellido`, `telefono`, `celular`) VALUES
('00004382498', '237489234728397', '78923798798er', '7489237', '7893475345'),
('12312454653', '666666666666', '66666666666666', '6666666666', '435345'),
('23444444432', '444444444444444', '4444444444', '4444444444', '4444444444'),
('31223123121', '123231', '213231321', '2132345345', '5345345435'),
('31245476356', '756765', '6575637567567', '2133333', '333333333'),
('33333333412', 'Duiamond', 'Stalker', '3211111', '1111111111'),
('34343434343', '34343434343434343434', '3434343434343434343434', '3434343434', '34343434343'),
('34413667345', 'dasdasd', 'asdasd', '4234234234', '4432342'),
('35445343543', '435435', '3243243', '324342', '342342'),
('45452342344', '32423', '32423423', '4324', '24'),
('45456456456', '456546456', '645654546', '54546546', '564546'),
('56434444444', '4322222', '22222222222', '2222222222', '22222222222'),
('65445654453', '645634564356', '43564356', '5436436436', '4364643'),
('66647587457', '5326236712537612', '3312321', '2312312', '3221321321');

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

--
-- Dumping data for table `seguimiento`
--

INSERT INTO `seguimiento` (`codigo`, `cumplimiento`, `descripcion`, `codigo_matricula`) VALUES
('61918', '19938438756', '19938438756', '78732');

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

CREATE TABLE `tutor` (
  `id` varchar(11) NOT NULL,
  `parentesco` varchar(20) NOT NULL,
  `direccion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tutor`
--

INSERT INTO `tutor` (`id`, `parentesco`, `direccion`) VALUES
('12312454653', 'Vecino', '34253454345'),
('23444444432', 'Vecina', '4444444444444444444'),
('31223123121', 'Vecina', '34234'),
('31245476356', 'Tia', '33333333333333'),
('34343434343', 'Vecino', '343434343434343434343434343434'),
('34413667345', 'Vecino', '342324324324'),
('35445343543', 'Vecino', '432342342'),
('45452342344', 'Vecino', '2432434243243242343243'),
('45456456456', 'Vecino', '564564654546'),
('56434444444', 'Vecina', '2222222222222'),
('65445654453', 'Tia', '646463456');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `e_mail` varchar(40) NOT NULL,
  `clave` varchar(30) NOT NULL,
  `tipo_usuario` int(1) NOT NULL,
  `cambio_contraseña` int(1) NOT NULL,
  `id` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`e_mail`, `clave`, `tipo_usuario`, `cambio_contraseña`, `id`) VALUES
('carlos_moreno82151@elpoli.edu.co', '12344', 1, 0, ''),
('cmoreno981@gmail.com', '1234', 0, 0, '33333333412'),
('workcaresa@gmail.com', '39723', 0, 1, '00004382498');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`codigo_categoria`);

--
-- Indexes for table `clase`
--
ALTER TABLE `clase`
  ADD KEY `codigo_relacion` (`codigo_relacion`),
  ADD KEY `id` (`id`);

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
-- Constraints for table `clase`
--
ALTER TABLE `clase`
  ADD CONSTRAINT `clase_ibfk_1` FOREIGN KEY (`codigo_relacion`) REFERENCES `deporte_categoria_horario` (`codigo_relacion`),
  ADD CONSTRAINT `clase_ibfk_2` FOREIGN KEY (`id`) REFERENCES `entrenador` (`id`);

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

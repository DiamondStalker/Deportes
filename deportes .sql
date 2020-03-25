-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2020 at 12:17 AM
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
-- Database: `deportes`
--

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `codigo_cat` varchar(10) NOT NULL,
  `descripcion_cat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cumplimiento`
--

CREATE TABLE `cumplimiento` (
  `codigo_cum` varchar(10) NOT NULL,
  `asistencia` char(1) NOT NULL,
  `id_persona` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deporte`
--

CREATE TABLE `deporte` (
  `codigo_dep` varchar(10) NOT NULL,
  `descripcion_dep` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `entrenador`
--

CREATE TABLE `entrenador` (
  `per_id_persona` varchar(10) NOT NULL,
  `cumplimiento_codigo_cum` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `estudiante`
--

CREATE TABLE `estudiante` (
  `id_estudiante` varchar(10) NOT NULL,
  `nombre_est` varchar(30) NOT NULL,
  `apellidos_est` varchar(30) NOT NULL,
  `tutor_per_id_persona` varchar(10) NOT NULL,
  `codigo_mat` varchar(10) NOT NULL,
  `cumplimiento_codigo_cum` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `horario`
--

CREATE TABLE `horario` (
  `codigo_hor` varchar(10) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `matricula`
--

CREATE TABLE `matricula` (
  `codigo_mat` varchar(10) NOT NULL,
  `descripcion_mat` varchar(300) NOT NULL,
  `estudiante_id_estudiante` varchar(10) NOT NULL,
  `id_matricula1` varchar(10) NOT NULL,
  `codigo_seg` varchar(10) NOT NULL,
  `deporte_codigo_dep` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE `persona` (
  `per_id_persona` varchar(10) NOT NULL,
  `per_nombre` varchar(30) NOT NULL,
  `per_apellido` varchar(30) NOT NULL,
  `per_telefono` varchar(15) NOT NULL,
  `per_celular` varchar(15) DEFAULT NULL,
  `per_direccion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `relacion_cat_hor`
--

CREATE TABLE `relacion_cat_hor` (
  `categoria_codigo_cat` varchar(10) NOT NULL,
  `horario_codigo_hor` varchar(10) NOT NULL,
  `horario_fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `relacion_dep_cat`
--

CREATE TABLE `relacion_dep_cat` (
  `deporte_codigo_dep` varchar(10) NOT NULL,
  `categoria_codigo_cat` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `relacion_ent_dep`
--

CREATE TABLE `relacion_ent_dep` (
  `entrenador_per_id_persona` varchar(10) NOT NULL,
  `deporte_codigo_dep` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seguimiento`
--

CREATE TABLE `seguimiento` (
  `codigo_seg` varchar(10) NOT NULL,
  `descripcion_seg` varchar(300) NOT NULL,
  `matricula_codigo_mat` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

CREATE TABLE `tutor` (
  `per_id_persona` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `e_mail` varchar(30) DEFAULT NULL,
  `Clave` varchar(30) DEFAULT NULL,
  `tipo_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`e_mail`, `Clave`, `tipo_usuario`) VALUES
('carlos_moreno82151@elpoli.edu.', '1233', 1),
('prueba@gmail.com', '12333', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`codigo_cat`);

--
-- Indexes for table `cumplimiento`
--
ALTER TABLE `cumplimiento`
  ADD PRIMARY KEY (`codigo_cum`);

--
-- Indexes for table `deporte`
--
ALTER TABLE `deporte`
  ADD PRIMARY KEY (`codigo_dep`);

--
-- Indexes for table `entrenador`
--
ALTER TABLE `entrenador`
  ADD PRIMARY KEY (`per_id_persona`),
  ADD KEY `entrenador_cumplimiento_fk` (`cumplimiento_codigo_cum`);

--
-- Indexes for table `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id_estudiante`),
  ADD KEY `estudiante_cumplimiento_fk` (`cumplimiento_codigo_cum`),
  ADD KEY `estudiante_tutor_fk` (`tutor_per_id_persona`);

--
-- Indexes for table `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`codigo_hor`,`fecha`);

--
-- Indexes for table `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`codigo_mat`),
  ADD KEY `matricula_deporte_fk` (`deporte_codigo_dep`),
  ADD KEY `matricula_estudiante_fk` (`estudiante_id_estudiante`);

--
-- Indexes for table `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`per_id_persona`);

--
-- Indexes for table `relacion_cat_hor`
--
ALTER TABLE `relacion_cat_hor`
  ADD PRIMARY KEY (`categoria_codigo_cat`,`horario_codigo_hor`,`horario_fecha`),
  ADD KEY `relation_10_horario_fk` (`horario_codigo_hor`,`horario_fecha`);

--
-- Indexes for table `relacion_dep_cat`
--
ALTER TABLE `relacion_dep_cat`
  ADD PRIMARY KEY (`deporte_codigo_dep`,`categoria_codigo_cat`);

--
-- Indexes for table `relacion_ent_dep`
--
ALTER TABLE `relacion_ent_dep`
  ADD PRIMARY KEY (`entrenador_per_id_persona`,`deporte_codigo_dep`),
  ADD KEY `relation_7_deporte_fk` (`deporte_codigo_dep`);

--
-- Indexes for table `seguimiento`
--
ALTER TABLE `seguimiento`
  ADD PRIMARY KEY (`codigo_seg`);

--
-- Indexes for table `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`per_id_persona`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `entrenador`
--
ALTER TABLE `entrenador`
  ADD CONSTRAINT `entrenador_cumplimiento_fk` FOREIGN KEY (`cumplimiento_codigo_cum`) REFERENCES `cumplimiento` (`codigo_cum`),
  ADD CONSTRAINT `entrenador_persona_fk` FOREIGN KEY (`per_id_persona`) REFERENCES `persona` (`per_id_persona`);

--
-- Constraints for table `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_cumplimiento_fk` FOREIGN KEY (`cumplimiento_codigo_cum`) REFERENCES `cumplimiento` (`codigo_cum`),
  ADD CONSTRAINT `estudiante_tutor_fk` FOREIGN KEY (`tutor_per_id_persona`) REFERENCES `tutor` (`per_id_persona`);

--
-- Constraints for table `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_deporte_fk` FOREIGN KEY (`deporte_codigo_dep`) REFERENCES `deporte` (`codigo_dep`),
  ADD CONSTRAINT `matricula_estudiante_fk` FOREIGN KEY (`estudiante_id_estudiante`) REFERENCES `estudiante` (`id_estudiante`);

--
-- Constraints for table `relacion_cat_hor`
--
ALTER TABLE `relacion_cat_hor`
  ADD CONSTRAINT `relation_10_categoria_fk` FOREIGN KEY (`categoria_codigo_cat`) REFERENCES `categoria` (`codigo_cat`),
  ADD CONSTRAINT `relation_10_horario_fk` FOREIGN KEY (`horario_codigo_hor`,`horario_fecha`) REFERENCES `horario` (`codigo_hor`, `fecha`);

--
-- Constraints for table `relacion_ent_dep`
--
ALTER TABLE `relacion_ent_dep`
  ADD CONSTRAINT `relation_7_deporte_fk` FOREIGN KEY (`deporte_codigo_dep`) REFERENCES `deporte` (`codigo_dep`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

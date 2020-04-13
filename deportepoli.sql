-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-04-2020 a las 00:12:59
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `deportepoli`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `codigo` varchar(400) NOT NULL,
  `descripcion` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_horario`
--

CREATE TABLE `categoria_horario` (
  `categoria_codigo` varchar(400) NOT NULL,
  `horario_codigo` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deporte`
--

CREATE TABLE `deporte` (
  `codigo` varchar(400) NOT NULL,
  `descripcion` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deporte_categoria`
--

CREATE TABLE `deporte_categoria` (
  `deporte_codigo` varchar(400) NOT NULL,
  `categoria_codigo` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenador`
--

CREATE TABLE `entrenador` (
  `id` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id` varchar(400) NOT NULL,
  `nombre` varchar(400) NOT NULL,
  `apellido` varchar(400) NOT NULL,
  `fecha_nacimiento` varchar(400) NOT NULL,
  `foto` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_tutor`
--

CREATE TABLE `estudiante_tutor` (
  `estudiante_id` varchar(400) NOT NULL,
  `tutor_id` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `codigo` varchar(400) NOT NULL,
  `descripcion` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE `matricula` (
  `codigo` varchar(400) NOT NULL,
  `estudiante_id` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula_deporte`
--

CREATE TABLE `matricula_deporte` (
  `matricula_codigo` varchar(400) NOT NULL,
  `deporte_codigo` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persoan`
--

CREATE TABLE `persoan` (
  `id` varchar(400) NOT NULL,
  `nombre` varchar(400) NOT NULL,
  `apellido` varchar(400) NOT NULL,
  `telefono` varchar(400) DEFAULT NULL,
  `celular` varchar(400) NOT NULL,
  `foto` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor_deporte`
--

CREATE TABLE `profesor_deporte` (
  `entrenador_id` varchar(400) NOT NULL,
  `deporte_codigo` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimiento`
--

CREATE TABLE `seguimiento` (
  `codigo` varchar(400) NOT NULL,
  `cumplimiento` char(1) NOT NULL,
  `descripcion` varchar(400) NOT NULL,
  `estudiante_id` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor`
--

CREATE TABLE `tutor` (
  `parentesco` varchar(400) NOT NULL,
  `id` varchar(400) NOT NULL,
  `direccion` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `categoria_horario`
--
ALTER TABLE `categoria_horario`
  ADD PRIMARY KEY (`categoria_codigo`,`horario_codigo`),
  ADD KEY `categoria_horario_horario_fk` (`horario_codigo`);

--
-- Indices de la tabla `deporte`
--
ALTER TABLE `deporte`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `deporte_categoria`
--
ALTER TABLE `deporte_categoria`
  ADD PRIMARY KEY (`deporte_codigo`,`categoria_codigo`),
  ADD KEY `deporte_categoria_categoria_fk` (`categoria_codigo`);

--
-- Indices de la tabla `entrenador`
--
ALTER TABLE `entrenador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estudiante_tutor`
--
ALTER TABLE `estudiante_tutor`
  ADD PRIMARY KEY (`estudiante_id`,`tutor_id`),
  ADD KEY `estudiante_tutor_tutor_fk` (`tutor_id`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `matricula_estudiante_fk` (`estudiante_id`);

--
-- Indices de la tabla `matricula_deporte`
--
ALTER TABLE `matricula_deporte`
  ADD PRIMARY KEY (`matricula_codigo`,`deporte_codigo`),
  ADD KEY `matricula_deporte_deporte_fk` (`deporte_codigo`);

--
-- Indices de la tabla `persoan`
--
ALTER TABLE `persoan`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesor_deporte`
--
ALTER TABLE `profesor_deporte`
  ADD PRIMARY KEY (`entrenador_id`,`deporte_codigo`),
  ADD KEY `profesor_deporte_deporte_fk` (`deporte_codigo`);

--
-- Indices de la tabla `seguimiento`
--
ALTER TABLE `seguimiento`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `seguimiento_estudiante_fk` (`estudiante_id`);

--
-- Indices de la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria_horario`
--
ALTER TABLE `categoria_horario`
  ADD CONSTRAINT `categoria_horario_categoria_fk` FOREIGN KEY (`categoria_codigo`) REFERENCES `categoria` (`codigo`),
  ADD CONSTRAINT `categoria_horario_horario_fk` FOREIGN KEY (`horario_codigo`) REFERENCES `horario` (`codigo`);

--
-- Filtros para la tabla `deporte_categoria`
--
ALTER TABLE `deporte_categoria`
  ADD CONSTRAINT `deporte_categoria_categoria_fk` FOREIGN KEY (`categoria_codigo`) REFERENCES `categoria` (`codigo`),
  ADD CONSTRAINT `deporte_categoria_deporte_fk` FOREIGN KEY (`deporte_codigo`) REFERENCES `deporte` (`codigo`);

--
-- Filtros para la tabla `entrenador`
--
ALTER TABLE `entrenador`
  ADD CONSTRAINT `entrenador_persoan_fk` FOREIGN KEY (`id`) REFERENCES `persoan` (`id`);

--
-- Filtros para la tabla `estudiante_tutor`
--
ALTER TABLE `estudiante_tutor`
  ADD CONSTRAINT `estudiante_tutor_estudiante_fk` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`),
  ADD CONSTRAINT `estudiante_tutor_tutor_fk` FOREIGN KEY (`tutor_id`) REFERENCES `tutor` (`id`);

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_estudiante_fk` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`);

--
-- Filtros para la tabla `matricula_deporte`
--
ALTER TABLE `matricula_deporte`
  ADD CONSTRAINT `matricula_deporte_deporte_fk` FOREIGN KEY (`deporte_codigo`) REFERENCES `deporte` (`codigo`),
  ADD CONSTRAINT `matricula_deporte_matricula_fk` FOREIGN KEY (`matricula_codigo`) REFERENCES `matricula` (`codigo`);

--
-- Filtros para la tabla `profesor_deporte`
--
ALTER TABLE `profesor_deporte`
  ADD CONSTRAINT `profesor_deporte_deporte_fk` FOREIGN KEY (`deporte_codigo`) REFERENCES `deporte` (`codigo`),
  ADD CONSTRAINT `profesor_deporte_entrenador_fk` FOREIGN KEY (`entrenador_id`) REFERENCES `entrenador` (`id`);

--
-- Filtros para la tabla `seguimiento`
--
ALTER TABLE `seguimiento`
  ADD CONSTRAINT `seguimiento_estudiante_fk` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`);

--
-- Filtros para la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD CONSTRAINT `tutor_persoan_fk` FOREIGN KEY (`id`) REFERENCES `persoan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

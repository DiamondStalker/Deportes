-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2020 a las 22:03:54
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `facturacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id_estudiante` varchar(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `fecha_nacimiento` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_tutor`
--

CREATE TABLE `estudiante_tutor` (
  `tutor_id_tutor` varchar(11) NOT NULL,
  `estudiante_id_estudiante` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `num_factura` varchar(20) NOT NULL,
  `fecha` varchar(10) NOT NULL,
  `prefactura_num_prefactura` varchar(20) NOT NULL,
  `num_prefactura` varchar(20) NOT NULL,
  `tutor_id_tutor` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_servicios`
--

CREATE TABLE `factura_servicios` (
  `factura_num_factura` varchar(20) NOT NULL,
  `factura_num_prefactura` varchar(20) NOT NULL,
  `servicio_codigo_servicio` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prefactura`
--

CREATE TABLE `prefactura` (
  `num_prefactura` varchar(20) NOT NULL,
  `fecha_inicio` varchar(10) NOT NULL,
  `fecha_fin` varchar(10) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `descuento` float NOT NULL,
  `iva` float NOT NULL,
  `total` float NOT NULL,
  `vendedor_nit` varchar(10) NOT NULL,
  `estudiante_id_estudiante` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prefactura_servicio`
--

CREATE TABLE `prefactura_servicio` (
  `prefactura_num_prefactura` varchar(20) NOT NULL,
  `servicio_codigo_servicio` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `codigo_servicio` varchar(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor`
--

CREATE TABLE `tutor` (
  `id_tutor` varchar(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `celular` varchar(11) NOT NULL,
  `parentesco` varchar(400) NOT NULL,
  `direccion` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `nit` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id_estudiante`);

--
-- Indices de la tabla `estudiante_tutor`
--
ALTER TABLE `estudiante_tutor`
  ADD PRIMARY KEY (`tutor_id_tutor`,`estudiante_id_estudiante`),
  ADD KEY `relation_1_estudiante_fk` (`estudiante_id_estudiante`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`num_factura`,`num_prefactura`),
  ADD UNIQUE KEY `factura__idx` (`prefactura_num_prefactura`),
  ADD KEY `factura_tutor_fk` (`tutor_id_tutor`);

--
-- Indices de la tabla `factura_servicios`
--
ALTER TABLE `factura_servicios`
  ADD PRIMARY KEY (`factura_num_factura`,`factura_num_prefactura`,`servicio_codigo_servicio`),
  ADD KEY `factura_servicios_fkv1` (`servicio_codigo_servicio`);

--
-- Indices de la tabla `prefactura`
--
ALTER TABLE `prefactura`
  ADD PRIMARY KEY (`num_prefactura`),
  ADD KEY `prefactura_estudiante_fk` (`estudiante_id_estudiante`),
  ADD KEY `prefactura_vendedor_fk` (`vendedor_nit`);

--
-- Indices de la tabla `prefactura_servicio`
--
ALTER TABLE `prefactura_servicio`
  ADD PRIMARY KEY (`prefactura_num_prefactura`,`servicio_codigo_servicio`),
  ADD KEY `prefactura_servicio_fkv1` (`servicio_codigo_servicio`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`codigo_servicio`);

--
-- Indices de la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id_tutor`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`nit`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante_tutor`
--
ALTER TABLE `estudiante_tutor`
  ADD CONSTRAINT `relation_1_estudiante_fk` FOREIGN KEY (`estudiante_id_estudiante`) REFERENCES `estudiante` (`id_estudiante`),
  ADD CONSTRAINT `relation_1_tutor_fk` FOREIGN KEY (`tutor_id_tutor`) REFERENCES `tutor` (`id_tutor`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_prefactura_fk` FOREIGN KEY (`prefactura_num_prefactura`) REFERENCES `prefactura` (`num_prefactura`),
  ADD CONSTRAINT `factura_tutor_fk` FOREIGN KEY (`tutor_id_tutor`) REFERENCES `tutor` (`id_tutor`);

--
-- Filtros para la tabla `factura_servicios`
--
ALTER TABLE `factura_servicios`
  ADD CONSTRAINT `factura_servicios_fk` FOREIGN KEY (`factura_num_factura`,`factura_num_prefactura`) REFERENCES `factura` (`num_factura`, `num_prefactura`),
  ADD CONSTRAINT `factura_servicios_fkv1` FOREIGN KEY (`servicio_codigo_servicio`) REFERENCES `servicio` (`codigo_servicio`);

--
-- Filtros para la tabla `prefactura`
--
ALTER TABLE `prefactura`
  ADD CONSTRAINT `prefactura_estudiante_fk` FOREIGN KEY (`estudiante_id_estudiante`) REFERENCES `estudiante` (`id_estudiante`),
  ADD CONSTRAINT `prefactura_vendedor_fk` FOREIGN KEY (`vendedor_nit`) REFERENCES `vendedor` (`nit`);

--
-- Filtros para la tabla `prefactura_servicio`
--
ALTER TABLE `prefactura_servicio`
  ADD CONSTRAINT `prefactura_servicio_fk` FOREIGN KEY (`prefactura_num_prefactura`) REFERENCES `prefactura` (`num_prefactura`),
  ADD CONSTRAINT `prefactura_servicio_fkv1` FOREIGN KEY (`servicio_codigo_servicio`) REFERENCES `servicio` (`codigo_servicio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

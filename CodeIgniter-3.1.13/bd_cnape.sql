-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-04-2024 a las 10:26:52
-- Versión del servidor: 8.0.31
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_cnape`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `fecha_create` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `form_productor`
--

CREATE TABLE `form_productor` (
  `id_form` int NOT NULL,
  `responsable_id` int NOT NULL,
  `departamento` varchar(25) DEFAULT NULL,
  `cultivo` varchar(45) DEFAULT NULL,
  `sup_area` int DEFAULT NULL,
  `vol_producto` int DEFAULT NULL,
  `venta` int DEFAULT NULL,
  `perdida` int DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  `fecha_create` datetime DEFAULT NULL,
  `fecha_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsable`
--

CREATE TABLE `responsable` (
  `id_responsable` int NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `paterno` varchar(15) DEFAULT NULL,
  `materno` varchar(15) DEFAULT NULL,
  `ci` int DEFAULT NULL,
  `extencion` varchar(10) DEFAULT NULL,
  `expedido` varchar(10) DEFAULT NULL,
  `certificado` int DEFAULT NULL,
  `celular` int DEFAULT NULL,
  `gmail` varchar(45) DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  `rol_id` int DEFAULT NULL,
  `fecha_create` datetime DEFAULT NULL,
  `fecha_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  `fecha_create` datetime DEFAULT NULL,
  `fecha_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `responsable_id` int DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `password` blob,
  `estado_id` int DEFAULT NULL,
  `fecha_create` varchar(45) DEFAULT NULL,
  `fecha_update` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `form_productor`
--
ALTER TABLE `form_productor`
  ADD PRIMARY KEY (`id_form`),
  ADD KEY `fk_responsable_id_fp_idx` (`responsable_id`),
  ADD KEY `fk_estado_id_fp_idx` (`estado_id`);

--
-- Indices de la tabla `responsable`
--
ALTER TABLE `responsable`
  ADD PRIMARY KEY (`id_responsable`),
  ADD KEY `fk_rol_id_r_idx` (`rol_id`),
  ADD KEY `fk_estado_id_r_idx` (`estado_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`),
  ADD KEY `fk_estado_id_rol_idx` (`estado_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_estado_id_u_idx` (`estado_id`),
  ADD KEY `fk_responsable_id_u_idx` (`responsable_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `form_productor`
--
ALTER TABLE `form_productor`
  MODIFY `id_form` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `responsable`
--
ALTER TABLE `responsable`
  MODIFY `id_responsable` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `form_productor`
--
ALTER TABLE `form_productor`
  ADD CONSTRAINT `fk_estado_id_fp` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `fk_responsable_id_fp` FOREIGN KEY (`responsable_id`) REFERENCES `responsable` (`id_responsable`);

--
-- Filtros para la tabla `responsable`
--
ALTER TABLE `responsable`
  ADD CONSTRAINT `fk_estado_id_r` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `fk_rol_id_r` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id_rol`);

--
-- Filtros para la tabla `rol`
--
ALTER TABLE `rol`
  ADD CONSTRAINT `fk_estado_id_rol` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_estado_id_u` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `fk_responsable_id_u` FOREIGN KEY (`responsable_id`) REFERENCES `responsable` (`id_responsable`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

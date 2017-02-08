-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-03-2016 a las 18:37:52
-- Versión del servidor: 10.0.17-MariaDB
-- Versión de PHP: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemataller`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administracion`
--

CREATE TABLE `administracion` (
  `id_user` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administracion`
--

INSERT INTO `administracion` (`id_user`, `usuario`, `password`) VALUES
(1, 'Admin', 'admin123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auto`
--

CREATE TABLE `auto` (
  `idauto` int(11) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `puertas` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `idcliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auto`
--

INSERT INTO `auto` (`idauto`, `marca`, `modelo`, `tipo`, `puertas`, `color`, `idcliente`) VALUES
(1, 'Ford', '2004', 'camioneta', '2', 'rojo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `RFC` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apemat` varchar(45) NOT NULL,
  `apepat` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `RFC`, `nombre`, `apemat`, `apepat`, `direccion`, `telefono`) VALUES
(1, 'RAAA921221HOCMNL03', 'Alfredo', 'Ramirez', 'Anastacio', 'av martires 28 de agosto', '2281692094');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apemat` varchar(45) NOT NULL,
  `apepat` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `especialidad` varchar(45) NOT NULL,
  `telefono` bigint(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `nombre`, `apemat`, `apepat`, `direccion`, `especialidad`, `telefono`) VALUES
(1, 'Juan', 'Antonio', 'Morales', 'av mexico', 'Electrico', 2281736748),
(2, 'Gerardo', 'Bustamante', 'Estrada', 'av martires 28 de agosto', 'electromecanico', 2281736378),
(3, 'Mayra', 'Cabañas', 'Varela', 'Carretera xalapa trancas Km 78', 'electricista', 2281567221),
(4, 'Daniel ', 'Almeida', 'Fernandez', 'Avenida Miguel Hidalgo s/n', 'Mecanico general', 2282673433),
(5, 'Marcelo', 'Andrade', 'Sanchez', 'Av. Vicente aguirre #201', 'electricista', 2282456564);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `refaccion`
--

CREATE TABLE `refaccion` (
  `idRefaccion` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `costo` int(11) NOT NULL,
  `proveedor` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `refaccion`
--

INSERT INTO `refaccion` (`idRefaccion`, `nombre`, `costo`, `proveedor`, `modelo`) VALUES
(1, 'Balatas de cobre', 120, 'charix', 'Js2s3'),
(2, 'filtro de aire', 220, 'Garnica', 'jak32'),
(3, 'filtro de aire', 180, 'Lopez', 'ksdij3'),
(4, 'bujias', 90, 'Independiente', 'asddf1'),
(5, 'Tapetes premium', 2000, 'Tsurumex', 'sghd'),
(6, 'amortiguador', 800, 'sburman', 'yushi21'),
(7, 'catalizador', 2100, 'Lopez', 'pointer standar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `idServicios` int(11) NOT NULL,
  `tipo_servicio` varchar(45) NOT NULL,
  `costo` varchar(45) NOT NULL,
  `tiempo` varchar(45) NOT NULL,
  `idEmpleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`idServicios`, `tipo_servicio`, `costo`, `tiempo`, `idEmpleado`) VALUES
(1, 'Cambio de balatas', '220', '00:45', 1),
(2, 'cambio de filtro de aceite', '80', '00:35', 1),
(3, 'cambio de filtro de aire', '150', '00:30', 2),
(4, 'Verificacion', '1000', '00:40', 3),
(5, 'reparacion de aire acondicionado', '650', '01:00', 4),
(6, 'Cambio de Correas de distribución', '1250', '02:00', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idVenta` int(11) NOT NULL,
  `idRefaccion` int(11) NOT NULL DEFAULT '0',
  `idServicios` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `idauto` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `tipopago` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administracion`
--
ALTER TABLE `administracion`
  ADD PRIMARY KEY (`id_user`);

--
-- Indices de la tabla `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`idauto`,`idcliente`),
  ADD KEY `fk_Auto_Cliente_idx` (`idcliente`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`);

--
-- Indices de la tabla `refaccion`
--
ALTER TABLE `refaccion`
  ADD PRIMARY KEY (`idRefaccion`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`idServicios`,`idEmpleado`),
  ADD KEY `fk_Servicio_Empleado1_idx` (`idEmpleado`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idVenta`,`idRefaccion`,`idServicios`,`idEmpleado`,`idauto`,`idcliente`),
  ADD KEY `fk_Venta_Refaccion1_idx` (`idRefaccion`),
  ADD KEY `fk_Venta_Servicio1_idx` (`idServicios`,`idEmpleado`),
  ADD KEY `fk_Venta_Auto1_idx` (`idauto`,`idcliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administracion`
--
ALTER TABLE `administracion`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `auto`
--
ALTER TABLE `auto`
  MODIFY `idauto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `refaccion`
--
ALTER TABLE `refaccion`
  MODIFY `idRefaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `idServicios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auto`
--
ALTER TABLE `auto`
  ADD CONSTRAINT `fk_Auto_Cliente` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `fk_Servicio_Empleado1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_Venta_Auto1` FOREIGN KEY (`idauto`,`idcliente`) REFERENCES `auto` (`idauto`, `idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Venta_Refaccion1` FOREIGN KEY (`idRefaccion`) REFERENCES `refaccion` (`idRefaccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Venta_Servicio1` FOREIGN KEY (`idServicios`,`idEmpleado`) REFERENCES `servicio` (`idServicios`, `idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

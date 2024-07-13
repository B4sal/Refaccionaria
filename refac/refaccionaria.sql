-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2024 a las 04:08:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `refaccionaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `direccion`, `telefono`, `email`) VALUES
(1, 'Juan Pérez', 'Calle Falsa 123, Ciudad X', '555-1111', 'juanperez@example.com'),
(2, 'María López', 'Avenida Siempreviva 456, Ciudad Y', '555-2222', 'marialopez@example.com'),
(3, 'Carlos Sánchez', 'Boulevard Principal 789, Ciudad Z', '555-3333', 'carlossanchez@example.com'),
(4, 'Ana Gómez', 'Camino Real 101, Ciudad W', '555-4444', 'anagomez@example.com'),
(5, 'Luis Martínez', 'Ruta 202, Ciudad V', '555-5555', 'luismartinez@example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `detalleVentaID` int(11) NOT NULL,
  `ventaID` int(11) DEFAULT NULL,
  `refaccionID` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precioUnitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`detalleVentaID`, `ventaID`, `refaccionID`, `cantidad`, `precioUnitario`, `subtotal`) VALUES
(1, 1, 1, 1, 150.00, 150.00),
(2, 2, 2, 2, 300.00, 600.00),
(3, 3, 3, 1, 450.00, 450.00),
(4, 4, 4, 1, 75.00, 75.00),
(5, 5, 5, 1, 1200.00, 1200.00),
(6, 6, 6, 2, 200.00, 400.00),
(7, 7, 7, 1, 800.00, 800.00),
(8, 8, 8, 1, 120.00, 120.00),
(9, 9, 9, 1, 950.00, 950.00),
(10, 10, 10, 1, 350.00, 350.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `nombre`, `direccion`, `telefono`, `email`) VALUES
(1, 'MotoPartes SA', 'Calle 123, Ciudad A', '555-1234', 'contacto@motopartes.com'),
(2, 'Refacciones Rápidas', 'Avenida 456, Ciudad B', '555-5678', 'info@refaccionesrapidas.com'),
(3, 'Motos y Más', 'Boulevard 789, Ciudad C', '555-9020', 'ventas@motosymas.com'),
(4, 'MotoProveedores', 'Camino 101, Ciudad D', '555-3456', 'soporte@motoproveedores.com'),
(5, 'RepuestosMoto', 'Ruta 202, Ciudad E', '555-7890', 'contacto@repuestosmoto.com'),
(6, 'hermemotors', 'centro 117 firewel', '99977777', 'contacto@hermemotors.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `refaccion`
--

CREATE TABLE `refaccion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidadEnInventario` int(11) NOT NULL,
  `proveedorID` int(11) DEFAULT NULL,
  `fechaAdquisicion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `refaccion`
--

INSERT INTO `refaccion` (`id`, `nombre`, `descripcion`, `precio`, `cantidadEnInventario`, `proveedorID`, `fechaAdquisicion`) VALUES
(1, 'Filtro de aire', 'Filtro de aire para motos de 150cc', 150.00, 50, 1, '2023-01-10'),
(2, 'Pastillas de freno', 'Pastillas de freno delanteras para motos', 300.00, 100, 2, '2023-02-15'),
(3, 'Cadena de transmisión', 'Cadena de transmisión reforzada', 450.00, 20, 3, '2023-03-20'),
(4, 'Bujía de encendido', 'Bujía para motores de 4 tiempos', 75.00, 200, 4, '2023-04-25'),
(5, 'Llanta delantera', 'Llanta delantera 17 pulgadas', 1200.00, 15, 5, '2023-05-30'),
(6, 'Aceite de motor', 'Aceite sintético para motos 10W-40', 200.00, 80, 1, '2023-06-10'),
(7, 'Batería de moto', 'Batería de gel para motocicletas', 800.00, 30, 2, '2023-07-20'),
(8, 'Espejo retrovisor', 'Espejo retrovisor derecho', 120.00, 60, 3, '2023-08-25'),
(9, 'Faro delantero', 'Faro delantero LED', 950.00, 25, 4, '2023-09-15'),
(10, 'Kit de herramientas', 'Kit básico de herramientas para moto', 350.00, 40, 5, '2023-10-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuarioID` int(11) NOT NULL,
  `nombreUsuario` varchar(50) NOT NULL,
  `contraseña` varchar(255) DEFAULT NULL,
  `rol` enum('Administrador','Agente de ventas','Cliente') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuarioID`, `nombreUsuario`, `contraseña`, `rol`) VALUES
(1, 'admin', 'root', 'Administrador'),
(2, 'ventas', 'refac', 'Agente de ventas'),
(3, 'cliente', 'cliente', 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `ventaID` int(11) NOT NULL,
  `clienteID` int(11) DEFAULT NULL,
  `fechaVenta` date NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`ventaID`, `clienteID`, `fechaVenta`, `total`) VALUES
(1, 1, '2023-01-15', 150.00),
(2, 2, '2023-02-20', 600.00),
(3, 3, '2023-03-25', 450.00),
(4, 4, '2023-04-30', 75.00),
(5, 5, '2023-05-05', 1200.00),
(6, 1, '2023-06-15', 400.00),
(7, 2, '2023-07-20', 800.00),
(8, 3, '2023-08-25', 120.00),
(9, 4, '2023-09-30', 950.00),
(10, 5, '2023-10-05', 350.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`detalleVentaID`),
  ADD KEY `ventaID` (`ventaID`),
  ADD KEY `refaccionID` (`refaccionID`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `refaccion`
--
ALTER TABLE `refaccion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proveedorID` (`proveedorID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuarioID`),
  ADD UNIQUE KEY `nombreUsuario` (`nombreUsuario`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`ventaID`),
  ADD KEY `clienteID` (`clienteID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `detalleVentaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `refaccion`
--
ALTER TABLE `refaccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `ventaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `detalleventa_ibfk_1` FOREIGN KEY (`ventaID`) REFERENCES `venta` (`ventaID`),
  ADD CONSTRAINT `detalleventa_ibfk_2` FOREIGN KEY (`refaccionID`) REFERENCES `refaccion` (`id`);

--
-- Filtros para la tabla `refaccion`
--
ALTER TABLE `refaccion`
  ADD CONSTRAINT `refaccion_ibfk_1` FOREIGN KEY (`proveedorID`) REFERENCES `proveedor` (`id`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`clienteID`) REFERENCES `cliente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

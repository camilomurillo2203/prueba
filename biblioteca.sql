CREATE TABLE `autores` (
  `Nombre` varchar(39) NOT NULL,
  `Apellido` varchar(39) NOT NULL,
  `Edad` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(39) NOT NULL,
  `Edicion` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multas`
--

CREATE TABLE `multas` (
  `Precio` int(11) NOT NULL,
  `F_Pago` date DEFAULT NULL,
  `prestamo_libro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `Id_Libro` int(11) NOT NULL,
  `cantidad_id` int(11) NOT NULL,
  `F_Prestamo` date DEFAULT NULL,
  `F_Devolucion` date DEFAULT NULL,
  `codigo_p` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo_libro`
--

CREATE TABLE `prestamo_libro` (
  `codigop` int(11) NOT NULL,
  `codigol` int(11) DEFAULT NULL,
  `prestamo_libro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(39) NOT NULL,
  `Apellido` varchar(39) NOT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `Direccion` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `multas`
--
ALTER TABLE `multas`
  ADD KEY `prestamo_libro` (`prestamo_libro`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`Id_Libro`);

--
-- Indices de la tabla `prestamo_libro`
--
ALTER TABLE `prestamo_libro`
  ADD PRIMARY KEY (`prestamo_libro`),
  ADD KEY `codigop` (`codigop`),
  ADD KEY `codigol` (`codigol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `multas`
--
ALTER TABLE `multas`
  ADD CONSTRAINT `multas_ibfk_1` FOREIGN KEY (`prestamo_libro`) REFERENCES `prestamo` (`Id_Libro`);

--
-- Filtros para la tabla `prestamo_libro`
--
ALTER TABLE `prestamo_libro`
  ADD CONSTRAINT `prestamo_libro_ibfk_1` FOREIGN KEY (`codigop`) REFERENCES `prestamo` (`Id_Libro`),
  ADD CONSTRAINT `prestamo_libro_ibfk_2` FOREIGN KEY (`codigol`) REFERENCES `libros` (`Codigo`);

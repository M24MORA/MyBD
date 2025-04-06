-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-04-2025 a las 22:16:16
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cursos`
--

CREATE TABLE `Cursos` (
  `curso_id` int(11) NOT NULL,
  `Nombre_curso` varchar(50) NOT NULL,
  `Descripción` text NOT NULL,
  `Fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Lecciones`
--

CREATE TABLE `Lecciones` (
  `leccion_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `Título` varchar(50) NOT NULL,
  `Contenido` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Progresos`
--

CREATE TABLE `Progresos` (
  `progreso_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `leccion_id` int(11) NOT NULL,
  `fecha_progreso` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pruebas`
--

CREATE TABLE `Pruebas` (
  `prueba_id` int(11) NOT NULL,
  `leccion_id` int(11) NOT NULL,
  `Pregunta` text NOT NULL,
  `Respuesta_correcta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Recomendaciones`
--

CREATE TABLE `Recomendaciones` (
  `recomendacion_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `Comentario` text NOT NULL,
  `fecha_recomendacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `usuario_id` int(11) NOT NULL,
  `Nombre` varchar(10) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Contraseña` varchar(20) NOT NULL,
  `Fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Cursos`
--
ALTER TABLE `Cursos`
  ADD PRIMARY KEY (`curso_id`);

--
-- Indices de la tabla `Lecciones`
--
ALTER TABLE `Lecciones`
  ADD PRIMARY KEY (`leccion_id`),
  ADD KEY `curso_id` (`curso_id`);

--
-- Indices de la tabla `Progresos`
--
ALTER TABLE `Progresos`
  ADD PRIMARY KEY (`progreso_id`),
  ADD KEY `Progresos_ibfk_1` (`usuario_id`),
  ADD KEY `Progresos_ibfk_2` (`curso_id`),
  ADD KEY `Progresos_ibfk_3` (`leccion_id`);

--
-- Indices de la tabla `Pruebas`
--
ALTER TABLE `Pruebas`
  ADD PRIMARY KEY (`prueba_id`),
  ADD KEY `leccion_id` (`leccion_id`);

--
-- Indices de la tabla `Recomendaciones`
--
ALTER TABLE `Recomendaciones`
  ADD PRIMARY KEY (`recomendacion_id`),
  ADD KEY `Recomendaciones_ibfk_1` (`usuario_id`),
  ADD KEY `curso_id` (`curso_id`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Cursos`
--
ALTER TABLE `Cursos`
  MODIFY `curso_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Lecciones`
--
ALTER TABLE `Lecciones`
  MODIFY `leccion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Progresos`
--
ALTER TABLE `Progresos`
  MODIFY `progreso_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Pruebas`
--
ALTER TABLE `Pruebas`
  MODIFY `prueba_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Recomendaciones`
--
ALTER TABLE `Recomendaciones`
  MODIFY `recomendacion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Lecciones`
--
ALTER TABLE `Lecciones`
  ADD CONSTRAINT `Lecciones_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `Cursos` (`curso_id`);

--
-- Filtros para la tabla `Progresos`
--
ALTER TABLE `Progresos`
  ADD CONSTRAINT `Progresos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `Usuarios` (`usuario_id`),
  ADD CONSTRAINT `Progresos_ibfk_2` FOREIGN KEY (`curso_id`) REFERENCES `Cursos` (`curso_id`),
  ADD CONSTRAINT `Progresos_ibfk_3` FOREIGN KEY (`leccion_id`) REFERENCES `Lecciones` (`leccion_id`);

--
-- Filtros para la tabla `Pruebas`
--
ALTER TABLE `Pruebas`
  ADD CONSTRAINT `Pruebas_ibfk_1` FOREIGN KEY (`leccion_id`) REFERENCES `Pruebas` (`prueba_id`);

--
-- Filtros para la tabla `Recomendaciones`
--
ALTER TABLE `Recomendaciones`
  ADD CONSTRAINT `Recomendaciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `Usuarios` (`usuario_id`),
  ADD CONSTRAINT `Recomendaciones_ibfk_2` FOREIGN KEY (`curso_id`) REFERENCES `Cursos` (`curso_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 23-05-2025 a las 18:05:11
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
-- Base de datos: `cevam_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenidos_unidad`
--

CREATE TABLE `contenidos_unidad` (
  `id_contenido_unidad` int(11) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `id_tipo_contenido` int(11) NOT NULL,
  `id_tipo_material` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `url_recurso` varchar(255) DEFAULT NULL,
  `contenido_texto` text DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes_libros`
--

CREATE TABLE `estudiantes_libros` (
  `id_estudiante_libro` int(11) NOT NULL,
  `id_usuario_estudiante` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `fecha_asignacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id_libro` int(11) NOT NULL,
  `nombre_libro` varchar(255) NOT NULL,
  `nivel` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores_estudiantes`
--

CREATE TABLE `profesores_estudiantes` (
  `id_profesor_estudiante` int(11) NOT NULL,
  `id_usuario_profesor` int(11) NOT NULL,
  `id_usuario_estudiante` int(11) NOT NULL,
  `fecha_asignacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `progreso_unidades`
--

CREATE TABLE `progreso_unidades` (
  `id_progreso` int(11) NOT NULL,
  `id_usuario_estudiante` int(11) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `fecha_completado` date NOT NULL,
  `comentarios_profesor` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_contenido`
--

CREATE TABLE `tipos_contenido` (
  `id_tipo_contenido` int(11) NOT NULL,
  `nombre_tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_material`
--

CREATE TABLE `tipos_material` (
  `id_tipo_material` int(11) NOT NULL,
  `nombre_material` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `id_unidad` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `nombre_unidad` varchar(255) NOT NULL,
  `numero_unidad` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena_hash` varchar(255) NOT NULL,
  `cedula_identidad` varchar(20) DEFAULT NULL,
  `numero_celular` varchar(20) DEFAULT NULL,
  `id_rol` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contenidos_unidad`
--
ALTER TABLE `contenidos_unidad`
  ADD PRIMARY KEY (`id_contenido_unidad`),
  ADD UNIQUE KEY `id_unidad` (`id_unidad`,`id_tipo_contenido`,`id_tipo_material`,`titulo`),
  ADD KEY `id_tipo_contenido` (`id_tipo_contenido`),
  ADD KEY `id_tipo_material` (`id_tipo_material`);

--
-- Indices de la tabla `estudiantes_libros`
--
ALTER TABLE `estudiantes_libros`
  ADD PRIMARY KEY (`id_estudiante_libro`),
  ADD UNIQUE KEY `id_usuario_estudiante` (`id_usuario_estudiante`,`id_libro`),
  ADD KEY `id_libro` (`id_libro`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id_libro`);

--
-- Indices de la tabla `profesores_estudiantes`
--
ALTER TABLE `profesores_estudiantes`
  ADD PRIMARY KEY (`id_profesor_estudiante`),
  ADD UNIQUE KEY `id_usuario_profesor` (`id_usuario_profesor`,`id_usuario_estudiante`),
  ADD KEY `id_usuario_estudiante` (`id_usuario_estudiante`);

--
-- Indices de la tabla `progreso_unidades`
--
ALTER TABLE `progreso_unidades`
  ADD PRIMARY KEY (`id_progreso`),
  ADD UNIQUE KEY `id_usuario_estudiante` (`id_usuario_estudiante`,`id_unidad`),
  ADD KEY `id_unidad` (`id_unidad`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `nombre_rol` (`nombre_rol`);

--
-- Indices de la tabla `tipos_contenido`
--
ALTER TABLE `tipos_contenido`
  ADD PRIMARY KEY (`id_tipo_contenido`),
  ADD UNIQUE KEY `nombre_tipo` (`nombre_tipo`);

--
-- Indices de la tabla `tipos_material`
--
ALTER TABLE `tipos_material`
  ADD PRIMARY KEY (`id_tipo_material`),
  ADD UNIQUE KEY `nombre_material` (`nombre_material`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`id_unidad`),
  ADD UNIQUE KEY `id_libro` (`id_libro`,`numero_unidad`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `cedula_identidad` (`cedula_identidad`),
  ADD UNIQUE KEY `numero_celular` (`numero_celular`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contenidos_unidad`
--
ALTER TABLE `contenidos_unidad`
  MODIFY `id_contenido_unidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estudiantes_libros`
--
ALTER TABLE `estudiantes_libros`
  MODIFY `id_estudiante_libro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profesores_estudiantes`
--
ALTER TABLE `profesores_estudiantes`
  MODIFY `id_profesor_estudiante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `progreso_unidades`
--
ALTER TABLE `progreso_unidades`
  MODIFY `id_progreso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_contenido`
--
ALTER TABLE `tipos_contenido`
  MODIFY `id_tipo_contenido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_material`
--
ALTER TABLE `tipos_material`
  MODIFY `id_tipo_material` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id_unidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contenidos_unidad`
--
ALTER TABLE `contenidos_unidad`
  ADD CONSTRAINT `contenidos_unidad_ibfk_1` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id_unidad`),
  ADD CONSTRAINT `contenidos_unidad_ibfk_2` FOREIGN KEY (`id_tipo_contenido`) REFERENCES `tipos_contenido` (`id_tipo_contenido`),
  ADD CONSTRAINT `contenidos_unidad_ibfk_3` FOREIGN KEY (`id_tipo_material`) REFERENCES `tipos_material` (`id_tipo_material`);

--
-- Filtros para la tabla `estudiantes_libros`
--
ALTER TABLE `estudiantes_libros`
  ADD CONSTRAINT `estudiantes_libros_ibfk_1` FOREIGN KEY (`id_usuario_estudiante`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `estudiantes_libros_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`);

--
-- Filtros para la tabla `profesores_estudiantes`
--
ALTER TABLE `profesores_estudiantes`
  ADD CONSTRAINT `profesores_estudiantes_ibfk_1` FOREIGN KEY (`id_usuario_profesor`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `profesores_estudiantes_ibfk_2` FOREIGN KEY (`id_usuario_estudiante`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `progreso_unidades`
--
ALTER TABLE `progreso_unidades`
  ADD CONSTRAINT `progreso_unidades_ibfk_1` FOREIGN KEY (`id_usuario_estudiante`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `progreso_unidades_ibfk_2` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id_unidad`);

--
-- Filtros para la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD CONSTRAINT `unidades_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-08-2023 a las 19:27:49
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `GESTION_EDUCATIVA`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CALIFICACIONES`
--

CREATE TABLE `CALIFICACIONES` (
  `calificacion_id` int(5) NOT NULL,
  `grupomateria_id` int(5) NOT NULL,
  `estudiante_id` int(5) NOT NULL,
  `tipo_id` int(5) NOT NULL,
  `nota` int(2) NOT NULL,
  `estado_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CALIFICACIONES_TIPOS`
--

CREATE TABLE `CALIFICACIONES_TIPOS` (
  `cal_tipo_id` int(5) NOT NULL,
  `cal_tipo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `COHORTES`
--

CREATE TABLE `COHORTES` (
  `cohorte_id` int(5) NOT NULL,
  `programa_id` int(5) NOT NULL,
  `periodo_inicio_id` int(5) NOT NULL COMMENT 'periodo_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `COHORTES`
--

INSERT INTO `COHORTES` (`cohorte_id`, `programa_id`, `periodo_inicio_id`) VALUES
(1, 1, 11),
(2, 2, 11),
(3, 1, 12),
(4, 2, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DOCENTES`
--

CREATE TABLE `DOCENTES` (
  `docente_id` int(5) NOT NULL,
  `docente_nombre` varchar(200) NOT NULL,
  `docente_apellido` varchar(200) NOT NULL,
  `docente_documento` varchar(15) NOT NULL,
  `usuario_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `DOCENTES`
--

INSERT INTO `DOCENTES` (`docente_id`, `docente_nombre`, `docente_apellido`, `docente_documento`, `usuario_id`) VALUES
(1, 'ANGELA MARIA', 'MADRIGALES', '', 1),
(2, 'MARIA FERNANDA', 'ACERO', '', 5),
(3, 'LINA MARCELA', 'JAIMES', '', 6),
(4, 'OSCAR EDUARDO', 'SERNA', '', 7),
(5, 'DIANA CAROLINA', 'VERA', '', 8),
(6, 'LUZ HELENA', 'TAMAYO', '', 9),
(7, 'JULIAN ANDRES', 'ROJAS', '', 10),
(8, 'LIZETH FERNANDA', 'MARMOLEJO', '', 11),
(9, 'DIEGO FERNANDO', 'LOPEZ', '', 12),
(10, 'BRENFFY GINNETH', 'ZAMBRANO', '', 13),
(11, 'JAIRO ENRIQUE', 'SOTO', '', 14),
(12, 'JOSE LUIS', 'SOLARTE OROZCO', '', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ESTUDIANTES`
--

CREATE TABLE `ESTUDIANTES` (
  `estudiante_id` int(5) NOT NULL,
  `estudiante_docu` bigint(25) NOT NULL,
  `estudiante_nom` varchar(200) NOT NULL,
  `estudiante_ape` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EVALUACION_ESTADO`
--

CREATE TABLE `EVALUACION_ESTADO` (
  `eval_estado_id` int(5) NOT NULL,
  `eval_estado_nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GRUPO_MATERIAS`
--

CREATE TABLE `GRUPO_MATERIAS` (
  `grupo_id` int(5) NOT NULL,
  `periodo_id` int(5) NOT NULL,
  `modulo_id` int(5) NOT NULL,
  `jornada_id` int(5) NOT NULL,
  `docente_id` int(5) NOT NULL,
  `cohorte_id` int(5) NOT NULL,
  `grupo_nmr_horas` int(5) NOT NULL,
  `grupo_fch_inicio` date NOT NULL,
  `grupo_fch_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `GRUPO_MATERIAS`
--

INSERT INTO `GRUPO_MATERIAS` (`grupo_id`, `periodo_id`, `modulo_id`, `jornada_id`, `docente_id`, `cohorte_id`, `grupo_nmr_horas`, `grupo_fch_inicio`, `grupo_fch_fin`) VALUES
(1, 12, 2, 2, 5, 3, 40, '2023-08-12', '2023-12-15'),
(2, 12, 18, 2, 7, 4, 40, '2023-08-12', '2023-12-15'),
(3, 12, 3, 1, 5, 3, 44, '2023-08-09', '2023-08-15'),
(4, 12, 19, 1, 7, 4, 44, '2023-08-09', '2023-12-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `JORNADAS`
--

CREATE TABLE `JORNADAS` (
  `jornada_id` int(5) NOT NULL,
  `jornada_nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `JORNADAS`
--

INSERT INTO `JORNADAS` (`jornada_id`, `jornada_nombre`) VALUES
(1, 'SEMANA'),
(2, 'SABADOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MATRICULADOS`
--

CREATE TABLE `MATRICULADOS` (
  `matricula_id` int(5) NOT NULL,
  `estudiante_id` int(5) NOT NULL,
  `grupo_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MODULOS`
--

CREATE TABLE `MODULOS` (
  `modulo_id` int(5) NOT NULL,
  `modulo_nombre` varchar(200) NOT NULL,
  `programa_id` int(5) NOT NULL,
  `modulo_semestre` int(5) NOT NULL,
  `modulo_nmr_horas` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `MODULOS`
--

INSERT INTO `MODULOS` (`modulo_id`, `modulo_nombre`, `programa_id`, `modulo_semestre`, `modulo_nmr_horas`) VALUES
(2, 'INDUCCION INSTITUCIONAL', 1, 1, 0),
(3, 'PRACTICAS SEGURAS Y SALUDABLES EN EL AMBIENTE DE TRABAJO', 1, 1, 0),
(4, 'TECNICAS DE ESTUDIO', 1, 1, 0),
(5, 'ANATOCLUSIÓN HC', 1, 1, 0),
(6, 'BIOMATERIALES TEORIA-PRACTICA', 1, 1, 0),
(7, 'ORIENTAR AL USUARIO EN LOS SERVICIOS DE SALUD', 1, 1, 0),
(8, 'PREVENCIÓN DE LAS INFECCIONES EN LAS PERSONAS Y SU ENTORNO', 1, 2, 0),
(9, 'TICS', 1, 2, 0),
(10, 'PERIODONCIA', 1, 2, 0),
(11, 'PREVENCION PRIMARIA', 1, 2, 0),
(12, 'ETICA Y VALORES', 1, 2, 0),
(13, 'PRACTICA', 1, 2, 0),
(14, 'URGENCIAS ODONTOLOGICAS', 1, 3, 0),
(15, 'RADIOLOGIA', 1, 3, 0),
(16, 'ADMISION DEL USUARIO A LA RED DE SALUD', 1, 3, 0),
(17, 'PRACTICA', 1, 3, 0),
(18, 'INDUCCION INSTITUCIONAL', 2, 1, 0),
(19, 'PRACTICAS SEGURAS Y SALUDABLES EN EL AMBIENTE DE TRABAJO', 2, 1, 0),
(20, 'TÉCNICAS DE ESTUDIO', 2, 1, 0),
(21, 'ANATOCLUSIÓN', 2, 1, 0),
(22, 'BIOMATERIALES DENTALES', 2, 1, 0),
(23, 'EMPRENDIMIENTO', 2, 1, 0),
(24, 'MORFOLOGÍA TEÓRICO', 2, 1, 0),
(25, 'MORFOLOGÍA PRACTICO', 2, 1, 0),
(26, 'ÉTICA Y VALORES', 2, 1, 0),
(27, 'PRÓTESIS TOTAL TEÓRICA', 2, 2, 0),
(28, 'PRÓTESIS TOTAL TEÓRICA', 2, 2, 0),
(29, 'INTEGRADAS', 2, 2, 0),
(30, 'PRÓTESIS PARCIAL REMOVIBLE TEORÍA', 2, 3, 0),
(31, 'PRÓTESIS PARCIAL REMOVIBLE PRÁCTICA', 2, 3, 0),
(32, 'INTEGRADAS', 2, 3, 0),
(33, 'ORTOPEDIA TEORÍA', 2, 3, 0),
(34, 'PRÓTESIS PARCIAL FIJA TEORÍA', 2, 4, 0),
(35, 'PRÓTESIS PARCIAL FIJA PRÁCTICA', 2, 4, 0),
(36, 'INTEGRADAS', 2, 4, 0),
(37, 'ORTOPEDIA PRACTICA', 2, 4, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PERIODOS`
--

CREATE TABLE `PERIODOS` (
  `periodo_id` int(5) NOT NULL,
  `periodo_nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `PERIODOS`
--

INSERT INTO `PERIODOS` (`periodo_id`, `periodo_nombre`) VALUES
(1, '2018-1'),
(2, '2018-2'),
(3, '2019-1'),
(4, '2019-2'),
(5, '2020-1'),
(6, '2020-2'),
(7, '2021-1'),
(8, '2021-2'),
(9, '2022-1'),
(10, '2022-2'),
(11, '2023-1'),
(12, '2023-2'),
(13, '2024-1'),
(14, '2024-2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PROGRAMAS`
--

CREATE TABLE `PROGRAMAS` (
  `programa_id` int(5) NOT NULL,
  `programa_nombre` varchar(200) NOT NULL,
  `programa_sigla` varchar(5) NOT NULL,
  `programa_nmr_horas` int(5) NOT NULL,
  `programa_fch_aprobado` varchar(10) NOT NULL,
  `programa_nmr_semestres` int(5) NOT NULL,
  `programa_nmr_resolucion` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `PROGRAMAS`
--

INSERT INTO `PROGRAMAS` (`programa_id`, `programa_nombre`, `programa_sigla`, `programa_nmr_horas`, `programa_fch_aprobado`, `programa_nmr_semestres`, `programa_nmr_resolucion`) VALUES
(1, 'TECNICO LABORAL POR COMPETENCIAS EN AUXILIAR EN SALUD ORAL', 'ASO', 1800, '2016-06-27', 3, '310.054.482'),
(2, 'TECNICO LABORAL POR COMPETENCIAS EN MECANICA DENTAL', 'MD', 1850, '2016-06-27', 4, '310 .054.483');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PRUEBAS_EVALUATIVAS`
--

CREATE TABLE `PRUEBAS_EVALUATIVAS` (
  `prueba_eval_id` int(5) NOT NULL,
  `prueba_eval_tipo` varchar(15) NOT NULL,
  `prueba_eval_link` varchar(50) NOT NULL,
  `prueba _eval_fch` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARIOS`
--

CREATE TABLE `USUARIOS` (
  `usuario_id` int(5) NOT NULL,
  `usuario_user` varchar(15) NOT NULL,
  `usuario_password` varchar(15) NOT NULL,
  `usuario_perfil` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `USUARIOS`
--

INSERT INTO `USUARIOS` (`usuario_id`, `usuario_user`, `usuario_password`, `usuario_perfil`) VALUES
(1, 'madrigalesa', 'ma1122', 1),
(5, 'acerom', 'am1122', 1),
(6, 'jaimesl', 'jl1122', 1),
(7, 'sernao', 'so1122', 1),
(8, 'verad', 'vd1122', 1),
(9, 'tamayol', 'tl1122', 1),
(10, 'rojasj', 'rj1122', 1),
(11, 'marmolejol', 'ml1122', 1),
(12, 'lopezd', 'ld1122', 1),
(13, 'zambranob', 'zb1122', 1),
(14, 'sotoj', 'sj1122', 1),
(15, 'solartej', 'sj1122', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `COHORTES`
--
ALTER TABLE `COHORTES`
  ADD PRIMARY KEY (`cohorte_id`),
  ADD KEY `programa_id` (`programa_id`),
  ADD KEY `periodo_inicio_id` (`periodo_inicio_id`);

--
-- Indices de la tabla `DOCENTES`
--
ALTER TABLE `DOCENTES`
  ADD PRIMARY KEY (`docente_id`),
  ADD KEY `docente_id` (`docente_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `ESTUDIANTES`
--
ALTER TABLE `ESTUDIANTES`
  ADD PRIMARY KEY (`estudiante_id`);

--
-- Indices de la tabla `GRUPO_MATERIAS`
--
ALTER TABLE `GRUPO_MATERIAS`
  ADD PRIMARY KEY (`grupo_id`),
  ADD KEY `periodo_id` (`periodo_id`),
  ADD KEY `modulo_id` (`modulo_id`),
  ADD KEY `jornada_id` (`jornada_id`),
  ADD KEY `docente_id` (`docente_id`),
  ADD KEY `cohorte_id` (`cohorte_id`);

--
-- Indices de la tabla `JORNADAS`
--
ALTER TABLE `JORNADAS`
  ADD PRIMARY KEY (`jornada_id`);

--
-- Indices de la tabla `MATRICULADOS`
--
ALTER TABLE `MATRICULADOS`
  ADD PRIMARY KEY (`matricula_id`);

--
-- Indices de la tabla `MODULOS`
--
ALTER TABLE `MODULOS`
  ADD PRIMARY KEY (`modulo_id`),
  ADD KEY `programa_id` (`programa_id`);

--
-- Indices de la tabla `PERIODOS`
--
ALTER TABLE `PERIODOS`
  ADD PRIMARY KEY (`periodo_id`);

--
-- Indices de la tabla `PROGRAMAS`
--
ALTER TABLE `PROGRAMAS`
  ADD PRIMARY KEY (`programa_id`);

--
-- Indices de la tabla `USUARIOS`
--
ALTER TABLE `USUARIOS`
  ADD PRIMARY KEY (`usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `COHORTES`
--
ALTER TABLE `COHORTES`
  MODIFY `cohorte_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `DOCENTES`
--
ALTER TABLE `DOCENTES`
  MODIFY `docente_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `ESTUDIANTES`
--
ALTER TABLE `ESTUDIANTES`
  MODIFY `estudiante_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `GRUPO_MATERIAS`
--
ALTER TABLE `GRUPO_MATERIAS`
  MODIFY `grupo_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `JORNADAS`
--
ALTER TABLE `JORNADAS`
  MODIFY `jornada_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `MATRICULADOS`
--
ALTER TABLE `MATRICULADOS`
  MODIFY `matricula_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MODULOS`
--
ALTER TABLE `MODULOS`
  MODIFY `modulo_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `PERIODOS`
--
ALTER TABLE `PERIODOS`
  MODIFY `periodo_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `PROGRAMAS`
--
ALTER TABLE `PROGRAMAS`
  MODIFY `programa_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `USUARIOS`
--
ALTER TABLE `USUARIOS`
  MODIFY `usuario_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `COHORTES`
--
ALTER TABLE `COHORTES`
  ADD CONSTRAINT `COHORTES_ibfk_1` FOREIGN KEY (`programa_id`) REFERENCES `PROGRAMAS` (`programa_id`),
  ADD CONSTRAINT `COHORTES_ibfk_2` FOREIGN KEY (`periodo_inicio_id`) REFERENCES `PERIODOS` (`periodo_id`);

--
-- Filtros para la tabla `DOCENTES`
--
ALTER TABLE `DOCENTES`
  ADD CONSTRAINT `DOCENTES_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `USUARIOS` (`usuario_id`);

--
-- Filtros para la tabla `GRUPO_MATERIAS`
--
ALTER TABLE `GRUPO_MATERIAS`
  ADD CONSTRAINT `GRUPO_MATERIAS_ibfk_1` FOREIGN KEY (`periodo_id`) REFERENCES `PERIODOS` (`periodo_id`),
  ADD CONSTRAINT `GRUPO_MATERIAS_ibfk_2` FOREIGN KEY (`modulo_id`) REFERENCES `MODULOS` (`modulo_id`),
  ADD CONSTRAINT `GRUPO_MATERIAS_ibfk_3` FOREIGN KEY (`jornada_id`) REFERENCES `JORNADAS` (`jornada_id`),
  ADD CONSTRAINT `GRUPO_MATERIAS_ibfk_4` FOREIGN KEY (`docente_id`) REFERENCES `DOCENTES` (`docente_id`),
  ADD CONSTRAINT `GRUPO_MATERIAS_ibfk_5` FOREIGN KEY (`cohorte_id`) REFERENCES `COHORTES` (`cohorte_id`);

--
-- Filtros para la tabla `MODULOS`
--
ALTER TABLE `MODULOS`
  ADD CONSTRAINT `MODULOS_ibfk_1` FOREIGN KEY (`programa_id`) REFERENCES `PROGRAMAS` (`programa_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

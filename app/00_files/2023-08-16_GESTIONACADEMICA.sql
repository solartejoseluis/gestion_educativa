-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 16-08-2023 a las 16:13:10
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
-- Base de datos: `GESTIONACADEMICA`
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
  `periodo_inicio_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DOCENTES`
--

CREATE TABLE `DOCENTES` (
  `docente_id` int(5) NOT NULL,
  `docente_nom` varchar(200) NOT NULL,
  `docente_ape` varchar(200) NOT NULL,
  `docente_docu` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `DOCENTES`
--

INSERT INTO `DOCENTES` (`docente_id`, `docente_nom`, `docente_ape`, `docente_docu`) VALUES
(1, 'ANGELA MARIA', 'MADRIGALES', ''),
(2, 'MARIA FERNANDA', 'ACERO', ''),
(3, 'LINA MARCELA', 'JAIMES', ''),
(4, 'OSCAR EDUARDO', 'SERNA', ''),
(5, 'DIANA CAROLINA', 'VERA', ''),
(6, 'LUZ HELENA', 'TAMAYO', ''),
(7, 'JULIAN ANDRES', 'ROJAS', ''),
(8, 'LIZETH FERNANDA', 'MARMOLEJO', ''),
(9, 'DIEGO FERNANDO', 'LOPEZ', ''),
(10, 'BRENFFY GINNETH', 'ZAMBRANO', ''),
(11, 'JAIRO ENRIQUE', 'SOTO', '');

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
  `gm__id` int(5) NOT NULL,
  `periodo_id` int(5) NOT NULL,
  `modulo_id` int(5) NOT NULL,
  `jornada_id` int(5) NOT NULL,
  `docente_id` int(5) NOT NULL,
  `cohorte_id` int(5) NOT NULL,
  `nmr_horas` int(5) NOT NULL,
  `fch_inicio` date NOT NULL,
  `fch_fin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `JORNADAS`
--

CREATE TABLE `JORNADAS` (
  `jornada_id` int(5) NOT NULL,
  `jornada_nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PERIODOS`
--

CREATE TABLE `PERIODOS` (
  `periodo_id` int(5) NOT NULL,
  `periodo_nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PROGRAMAS`
--

CREATE TABLE `PROGRAMAS` (
  `programa_id` int(5) NOT NULL,
  `programa_nombre` varchar(200) NOT NULL,
  `programa_sigla` varchar(5) NOT NULL,
  `programa_nmr_horas` int(5) NOT NULL,
  `programa_fch_vigencia` varchar(10) NOT NULL,
  `programa_nmr_semestres` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `DOCENTES`
--
ALTER TABLE `DOCENTES`
  ADD PRIMARY KEY (`docente_id`);

--
-- Indices de la tabla `ESTUDIANTES`
--
ALTER TABLE `ESTUDIANTES`
  ADD PRIMARY KEY (`estudiante_id`);

--
-- Indices de la tabla `GRUPO_MATERIAS`
--
ALTER TABLE `GRUPO_MATERIAS`
  ADD PRIMARY KEY (`gm__id`);

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
  ADD PRIMARY KEY (`modulo_id`);

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `DOCENTES`
--
ALTER TABLE `DOCENTES`
  MODIFY `docente_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ESTUDIANTES`
--
ALTER TABLE `ESTUDIANTES`
  MODIFY `estudiante_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `GRUPO_MATERIAS`
--
ALTER TABLE `GRUPO_MATERIAS`
  MODIFY `gm__id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `JORNADAS`
--
ALTER TABLE `JORNADAS`
  MODIFY `jornada_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MATRICULADOS`
--
ALTER TABLE `MATRICULADOS`
  MODIFY `matricula_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MODULOS`
--
ALTER TABLE `MODULOS`
  MODIFY `modulo_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `PERIODOS`
--
ALTER TABLE `PERIODOS`
  MODIFY `periodo_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `PROGRAMAS`
--
ALTER TABLE `PROGRAMAS`
  MODIFY `programa_id` int(5) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

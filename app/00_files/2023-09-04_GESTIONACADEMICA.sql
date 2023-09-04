-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 04-09-2023 a las 21:24:23
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
  `periodo_inicio_id` int(5) NOT NULL COMMENT 'periodo_id',
  `cohorte_nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `COHORTES`
--

INSERT INTO `COHORTES` (`cohorte_id`, `programa_id`, `periodo_inicio_id`, `cohorte_nombre`) VALUES
(1, 1, 11, 'ASO_2023_1'),
(2, 2, 11, 'MD_2023_1'),
(3, 1, 12, 'ASO_2023_2'),
(4, 2, 12, 'MD_2023_2'),
(5, 1, 7, 'ASO_2021_1'),
(6, 1, 8, 'ASO_2021_2'),
(7, 2, 7, 'MD_2021_1'),
(8, 2, 8, 'MD_2021_2'),
(9, 1, 9, 'ASO_2022_1'),
(10, 1, 10, 'ASO_2022_2'),
(11, 2, 9, 'MD_2022_1'),
(12, 2, 10, 'MD_2022_2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ESTUDIANTES`
--

CREATE TABLE `ESTUDIANTES` (
  `estudiante_id` int(5) NOT NULL,
  `estudiante_tipo_documento` varchar(150) NOT NULL,
  `estudiante_nmr_documento` bigint(25) NOT NULL,
  `estudiante_nombres` varchar(200) NOT NULL,
  `estudiante_apellidos` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ESTUDIANTES`
--

INSERT INTO `ESTUDIANTES` (`estudiante_id`, `estudiante_tipo_documento`, `estudiante_nmr_documento`, `estudiante_nombres`, `estudiante_apellidos`) VALUES
(1, '0', 0, 'LEIDY TATIANA', 'PULGARIN'),
(2, '0', 0, 'JUAN GULLERMO', 'RESTREPO'),
(3, '0', 0, 'LINA MARIELA', 'GAVIRIA'),
(4, '0', 0, 'SHELSY DAYANNE', 'MEJIA'),
(5, '0', 0, 'DURLAY MARCELA', 'POTES'),
(6, '0', 0, 'SARA NATALY', 'ZAPATA'),
(7, '0', 0, 'DANIEL', 'MONTENEGRO'),
(8, '0', 0, 'MATEO', 'SANCLEMENTE'),
(9, '0', 0, 'VIVIANA', 'LOZANO'),
(10, '0', 0, 'PAULA ANDREA', 'ZAPATA'),
(11, '0', 0, 'DIANA CAROLINA', 'LOPEZ'),
(12, '0', 0, 'STEFANY', 'AMADOR'),
(13, '0', 0, 'SARA JUDITH', 'PORRAS AREVALO'),
(14, '0', 0, 'IVAN ESTEBAN', 'ZUNIGA ZUÑIGA'),
(15, '0', 0, 'ISABELLA', 'NOREÑA AGUIRRE'),
(16, '0', 0, 'JUAN DIEGO', 'CARDONA MEDINA'),
(17, '0', 0, 'YENIFER ALEJANDRA', 'CANO GUERRERO'),
(18, '0', 0, 'FREIDY JHOAN', 'WILCHES VASQUEZ'),
(19, '0', 0, 'SANTIAGO', 'BONILLA PALECHOR'),
(20, '0', 0, 'SANTIAGO', 'VALENCIA MONTOYA'),
(21, '0', 0, 'KEVIN ANDRES', 'ARROYAVE ARDILA'),
(22, '0', 0, 'VALENTINA', 'GARCIA CASTRO'),
(23, '0', 0, 'JUAN ESTEBAN', 'VALENCIA'),
(24, '0', 0, 'YURI DAHIANA', 'SARAY'),
(25, '0', 0, 'MARIANA', 'RUIZ'),
(26, '0', 0, 'MABEL JUNSETH', 'GONZALEZ'),
(27, '0', 0, 'MARIA ALEJANDRA', 'MONTAÑO'),
(28, '0', 0, 'LIZETH YULIANA', 'RESTREPO ROLDAN'),
(29, '0', 0, 'CRISTIAN CAMILO', 'BEDOYA BOLAÑOS'),
(30, '0', 0, 'LUISA FERNANDA', 'CEBALLOS CAIRASCO'),
(31, '0', 0, 'FARID CAMILO', 'GOMEZ LONDOÑO'),
(32, '0', 0, 'JUANA FERNANDA', 'LOPEZ'),
(33, '0', 0, 'GERALDINE', 'PAREJA'),
(34, '0', 0, 'JUAN CAMILO', 'RIVILLAS'),
(35, '0', 0, 'MELISSA', 'ROBLEDO'),
(36, '0', 0, 'MARIA FERNADA', 'PINEDA'),
(37, '0', 0, 'NELSON JUNIOR', 'GONZALEZ'),
(38, '0', 0, 'PAULA', 'PEDROZA'),
(39, '0', 0, 'VALERIA', 'MONTOYA VILLAFAÑE'),
(40, '0', 0, 'NICOLE DANIELA', 'MARMOLEJO'),
(41, '0', 0, 'VALERIA', 'MUÑOZ'),
(42, '0', 0, 'SANTIAGO', 'ARDILA BEDOYA'),
(43, '0', 0, 'DIANA MARCELA', 'LOZANO'),
(44, '0', 0, 'EVELIN DAYANA', 'RAMIREZ'),
(45, '0', 0, 'NATALY', 'BONILLA'),
(46, '0', 0, 'DAYANA NICOLE', 'VEGA'),
(47, '0', 0, 'ALEXANDER', 'ARMECIGA PRIETO'),
(48, '0', 0, 'EDUARLEY', 'ROJAS'),
(49, '0', 0, 'KEVIN JHOJAN', 'OCAMPO'),
(50, '0', 0, 'MARIA EVELYN', 'CASTAÑO'),
(51, '0', 0, 'YAZMIN ANDREA', 'REBELLON'),
(52, '0', 0, 'STEPHANY CRUZ', 'CRUZ ESGUERRA'),
(53, '0', 0, 'LAURA', 'GRANOBLES JIMENEZ'),
(54, '0', 0, 'ANDREA', 'GRANOBLES JIMENEZ'),
(55, '0', 0, 'DANIELA', 'QUIROGA'),
(56, '0', 0, 'MANUELA', 'ALVIS'),
(57, '0', 0, 'ANDRES LEONARDO', 'OSORIO'),
(58, '0', 0, 'ANDRES MAURICIO', 'OSORIO'),
(59, '0', 0, 'SEBASTIAN', 'CARDONA'),
(60, '0', 0, 'JUAN PABLO', 'PLAZA VELEZ'),
(61, '0', 0, 'ANDRES DAVID', 'LEAL OSORIO'),
(62, '0', 0, 'NATALIA MARIA', 'CABEZAS'),
(63, '0', 0, 'LICETH YHOANA', 'BARRETO ORTEGON'),
(64, '0', 0, 'KAREN DAHIANA', 'ZAMUDIO LOPEZ'),
(65, '0', 0, 'KAREN VANESSA', 'TORRES DURAN'),
(66, '0', 0, 'JESUS ALBERTO', 'RUIZ RODRIGUEZ'),
(67, '0', 0, 'JULIANA', 'CARMONA RESTREPO'),
(68, '0', 0, 'ANA KARINA', 'GARCÍA RUIZ'),
(69, '0', 0, 'LISETH MANUELA', 'CRESPO PAZ'),
(70, '0', 0, 'NICOLL', 'RENGIFO BURITICA'),
(71, '0', 0, 'MARIA CAMILA', 'GOMEZ OROZCO'),
(72, '0', 0, 'HENRY', 'SALAZAR'),
(73, '0', 0, 'ANA MARIA', 'CASTAÑEDA OCAMPO'),
(74, '0', 0, 'EYMY VALENTINA', 'GOMEZ CASTAÑO'),
(75, '0', 0, 'JHONNY SEBASTIAN', 'CORREA SILVA'),
(76, '0', 0, 'MARIA CAMILA', 'PARRA'),
(77, '0', 0, 'MELISSA VALENTINA', 'HERNANDEZ ESCALANTE'),
(78, '0', 0, 'ISABELLA', 'GONZALEZ CRUZ'),
(79, '0', 0, 'MARILIN ELIANA', 'ALMECIGA GARCIA'),
(80, '0', 0, 'LAURA', 'LOPEZ'),
(81, '0', 0, 'DANIELA', 'SEGURA'),
(82, '0', 0, 'ADRIANA LUCIA', 'CARRILLO'),
(83, '0', 0, 'JUAN CAMILO', 'BOLAÑOS'),
(84, '0', 0, 'ANGIE VALENTINA', 'CRIOLLO RIVILLAS');

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
  `grupo_fch_inicio` date NOT NULL,
  `grupo_fch_fin` date NOT NULL,
  `grupo_sem_ejecucion` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `GRUPO_MATERIAS`
--

INSERT INTO `GRUPO_MATERIAS` (`grupo_id`, `periodo_id`, `modulo_id`, `jornada_id`, `docente_id`, `cohorte_id`, `grupo_fch_inicio`, `grupo_fch_fin`, `grupo_sem_ejecucion`) VALUES
(5, 12, 4, 2, 8, 3, '2023-08-05', '2024-01-20', 1),
(6, 12, 5, 2, 8, 3, '2023-08-05', '2024-01-20', 0),
(7, 12, 6, 2, 11, 3, '2023-08-05', '2024-01-20', 0),
(8, 12, 19, 2, 9, 3, '2023-08-05', '2024-01-20', 1),
(9, 12, 15, 2, 8, 6, '2023-08-05', '2024-01-20', 0),
(10, 12, 14, 2, 11, 6, '2023-08-05', '2024-01-20', 0),
(11, 12, 16, 2, 1, 6, '2023-08-05', '2024-01-20', 0),
(12, 12, 12, 2, 8, 6, '2023-08-05', '2024-01-20', 0),
(13, 12, 8, 1, 8, 6, '2023-08-05', '2024-01-20', 0),
(14, 12, 11, 1, 8, 6, '2023-08-05', '2024-01-20', 0),
(15, 12, 4, 1, 8, 6, '2023-08-05', '2024-01-20', 0),
(16, 12, 10, 1, 8, 6, '2023-08-05', '2024-01-20', 0),
(17, 12, 8, 2, 10, 1, '2023-08-05', '2024-01-20', 0),
(18, 12, 10, 2, 10, 1, '2023-08-05', '2024-01-20', 0),
(19, 12, 11, 2, 10, 1, '2023-08-05', '2024-01-20', 0),
(20, 12, 4, 2, 8, 1, '2023-08-05', '2024-01-20', 2),
(25, 12, 38, 2, 9, 4, '2023-08-05', '2024-01-20', 1),
(26, 12, 24, 2, 9, 4, '2023-08-05', '2024-01-20', 26),
(27, 12, 25, 2, 9, 4, '2023-08-05', '2024-01-20', 1),
(28, 12, 22, 2, 9, 4, '2023-08-05', '2024-01-20', 1),
(29, 12, 39, 2, 9, 4, '2023-08-05', '2024-01-20', 1),
(30, 12, 21, 2, 8, 4, '2023-08-05', '2024-01-20', 1),
(31, 12, 27, 2, 6, 2, '2023-08-05', '2024-01-20', 2),
(32, 12, 28, 2, 6, 2, '2023-08-05', '2024-01-20', 2),
(33, 12, 29, 2, 6, 2, '2023-08-05', '2024-01-20', 2),
(34, 12, 40, 2, 10, 7, '2023-08-05', '2024-01-20', 3),
(35, 12, 41, 2, 10, 7, '2023-08-05', '2024-01-20', 3),
(36, 12, 34, 2, 7, 11, '2023-08-05', '2024-01-20', 4),
(37, 12, 35, 2, 7, 11, '2023-08-05', '2024-01-20', 4),
(38, 12, 33, 2, 7, 11, '2023-08-05', '2024-01-20', 4),
(39, 12, 37, 2, 7, 11, '2023-08-05', '2024-01-20', 4),
(40, 12, 34, 1, 10, 11, '2023-08-05', '2024-01-20', 4),
(41, 12, 35, 1, 10, 11, '2023-08-05', '2024-01-20', 4),
(42, 12, 33, 1, 10, 11, '2023-08-05', '2024-01-20', 4),
(43, 12, 37, 1, 10, 11, '2023-08-05', '2024-01-20', 4),
(44, 12, 12, 2, 8, 10, '2023-08-05', '2024-01-20', 0),
(45, 12, 32, 2, 10, 11, '2023-08-05', '2024-01-20', 3),
(46, 12, 3, 2, 12, 3, '2023-08-05', '2024-01-20', 1);

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

--
-- Volcado de datos para la tabla `MATRICULADOS`
--

INSERT INTO `MATRICULADOS` (`matricula_id`, `estudiante_id`, `grupo_id`) VALUES
(1, 1, 1);

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
(2, 'INDUCCIÓN INSTITUCIONAL ASO', 1, 1, 0),
(3, 'AMBIENTES SALUDABLES DE TRABAJO ASO', 1, 1, 0),
(4, 'TECNICAS DE ESTUDIO ASO', 1, 1, 0),
(5, 'ANATOCLUSIÓN E HISTORIA CLINICA ASO', 1, 1, 0),
(6, 'BIOMATERIALES ASO', 1, 1, 0),
(7, 'ORIENTAR AL USUARIO EN LOS SERVICIOS DE SALUD', 1, 1, 0),
(8, 'PREVENCIÓN DE LAS INFECCIONES', 1, 2, 0),
(9, 'TICS', 1, 2, 0),
(10, 'PERIODONCIA', 1, 2, 0),
(11, 'PREVENCION PRIMARIA', 1, 2, 0),
(12, 'ETICA Y VALORES', 1, 2, 0),
(13, 'PRACTICA ASO', 1, 2, 0),
(14, 'URGENCIAS ODONTOLOGICAS', 1, 3, 0),
(15, 'RADIOLOGIA', 1, 3, 0),
(16, 'ADMITIR AL USUARIO EN LOS SERVICIOS DE SALUD', 1, 3, 0),
(17, 'PRACTICA ASO', 1, 3, 0),
(18, 'INDUCCION INSTITUCIONAL', 2, 1, 0),
(19, 'AMBIENTES SALUDABLES DE TRABAJO MD', 2, 1, 0),
(20, 'TÉCNICAS DE ESTUDIO MD', 2, 1, 0),
(21, 'ANATOCLUSIÓN E HISTORIA CLÍNICA MD', 2, 1, 0),
(22, 'BIOMATERIALES TEORÍA', 2, 1, 0),
(23, 'EMPRENDIMIENTO', 2, 1, 0),
(24, 'MORFOLOGÍA TEÓRICO', 2, 1, 0),
(25, 'MORFOLOGÍA PRACTICO', 2, 1, 0),
(26, 'ÉTICA Y VALORES', 2, 1, 0),
(27, 'PRÓTESIS TOTAL TEÓRIA', 2, 2, 0),
(28, 'PRÓTESIS TOTAL PRÁCTICA', 2, 2, 0),
(29, 'INTEGRADAS SEM2', 2, 2, 0),
(30, 'PRÓTESIS PARCIAL REMOVIBLE TEORÍA', 2, 3, 0),
(31, 'PRÓTESIS PARCIAL REMOVIBLE PRÁCTICA', 2, 3, 0),
(32, 'INTEGRADAS SEM3', 2, 3, 0),
(33, 'ORTOPEDIA TEORÍA', 2, 3, 0),
(34, 'PRÓTESIS FIJA TEORÍA', 2, 4, 0),
(35, 'PRÓTESIS FIJA PRÁCTICA', 2, 4, 0),
(36, 'INTEGRADAS SEM4', 2, 4, 0),
(37, 'ORTOPEDIA PRÁCTICA', 2, 4, 0),
(38, 'INTRODUCCIÓN A LA MECÁNICA DENTAL', 2, 1, 0),
(39, 'BIOMATERIALES PRÁCTICA', 2, 1, 0),
(40, 'PRÓTESIS FLEXIBLE TEORÍA', 2, 3, 0),
(41, 'PRÓTESIS FLEXIBLE PRÁCTICA', 2, 3, 0);

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
  `programa_prefijo` varchar(150) NOT NULL,
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

INSERT INTO `PROGRAMAS` (`programa_id`, `programa_prefijo`, `programa_nombre`, `programa_sigla`, `programa_nmr_horas`, `programa_fch_aprobado`, `programa_nmr_semestres`, `programa_nmr_resolucion`) VALUES
(1, ' 	TECNICO LABORAL POR COMPETENCIAS EN ', 'AUXILIAR EN SALUD ORAL', 'ASO', 1800, '2016-06-27', 3, '310.054.482'),
(2, ' 	TECNICO LABORAL POR COMPETENCIAS EN ', 'MECÁNICA DENTAL', 'MD', 1850, '2016-06-27', 4, '310 .054.483');

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
  `usuario_perfil` int(5) NOT NULL,
  `usuario_nombres` varchar(100) NOT NULL,
  `usuario_apellidos` varchar(100) NOT NULL,
  `usuario_documento` varchar(50) NOT NULL,
  `usuario_tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `USUARIOS`
--

INSERT INTO `USUARIOS` (`usuario_id`, `usuario_user`, `usuario_password`, `usuario_perfil`, `usuario_nombres`, `usuario_apellidos`, `usuario_documento`, `usuario_tipo`) VALUES
(1, 'madrigalesa', 'ma1122', 1, 'ANGELA MARIA', 'MADRIGALES', '', 'DOCENTE'),
(5, 'acerom', 'am1122', 1, 'MARIA FERNANDA', 'ACERO', '', 'DOCENTE'),
(6, 'jaimesl', 'jl1122', 1, 'LINA MARCELA', 'JAIMES', '', 'DOCENTE'),
(7, 'sernao', 'so1122', 1, 'OSCAR EDUARDO', 'SERNA', '', 'DOCENTE'),
(8, 'verad', 'vd1122', 1, 'DIANA CAROLINA', 'VERA', '', 'DOCENTE'),
(9, 'tamayol', 'tl1122', 1, 'LUZ HELENA', 'TAMAYO', '', 'DOCENTE'),
(10, 'rojasj', 'rj1122', 1, 'JULIAN ANDRES', 'ROJAS', '', 'DOCENTE'),
(11, 'marmolejol', 'ml1122', 1, 'LIZZETH FERNANDA', 'MARMOLEJO', '', 'DOCENTE'),
(12, 'lopezd', 'ld1122', 1, 'DIEGO FERNANDO', 'LOPEZ', '', 'DOCENTE'),
(13, 'zambranob', 'zb1122', 1, 'BRENFFY GINNETH', 'ZAMBRANO', '', 'DOCENTE'),
(14, 'sotoj', 'sj1122', 1, 'JAIRO ENRIQUE', 'SOTO', '', 'DOCENTE'),
(15, 'solartej', 'sj1122', 1, 'JOSE LUIS', 'SOLARTE', '', 'DOCENTE');

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
  ADD KEY `cohorte_id` (`cohorte_id`),
  ADD KEY `docente_id` (`docente_id`);

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
  MODIFY `cohorte_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `ESTUDIANTES`
--
ALTER TABLE `ESTUDIANTES`
  MODIFY `estudiante_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `GRUPO_MATERIAS`
--
ALTER TABLE `GRUPO_MATERIAS`
  MODIFY `grupo_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `JORNADAS`
--
ALTER TABLE `JORNADAS`
  MODIFY `jornada_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `MATRICULADOS`
--
ALTER TABLE `MATRICULADOS`
  MODIFY `matricula_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `MODULOS`
--
ALTER TABLE `MODULOS`
  MODIFY `modulo_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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
-- Filtros para la tabla `GRUPO_MATERIAS`
--
ALTER TABLE `GRUPO_MATERIAS`
  ADD CONSTRAINT `GRUPO_MATERIAS_ibfk_1` FOREIGN KEY (`periodo_id`) REFERENCES `PERIODOS` (`periodo_id`),
  ADD CONSTRAINT `GRUPO_MATERIAS_ibfk_2` FOREIGN KEY (`modulo_id`) REFERENCES `MODULOS` (`modulo_id`),
  ADD CONSTRAINT `GRUPO_MATERIAS_ibfk_3` FOREIGN KEY (`jornada_id`) REFERENCES `JORNADAS` (`jornada_id`),
  ADD CONSTRAINT `GRUPO_MATERIAS_ibfk_5` FOREIGN KEY (`cohorte_id`) REFERENCES `COHORTES` (`cohorte_id`),
  ADD CONSTRAINT `GRUPO_MATERIAS_ibfk_6` FOREIGN KEY (`docente_id`) REFERENCES `USUARIOS` (`usuario_id`);

--
-- Filtros para la tabla `MODULOS`
--
ALTER TABLE `MODULOS`
  ADD CONSTRAINT `MODULOS_ibfk_1` FOREIGN KEY (`programa_id`) REFERENCES `PROGRAMAS` (`programa_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

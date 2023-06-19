-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2023 a las 14:48:58
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
-- Base de datos: `academia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id_alumno` int(11) NOT NULL,
  `nombre` varchar(75) DEFAULT NULL,
  `apellido` varchar(75) DEFAULT NULL,
  `tipo_doc` varchar(5) NOT NULL DEFAULT '',
  `nro_doc` varchar(15) NOT NULL DEFAULT '',
  `foto` blob NOT NULL,
  `fec_nacimiento` varchar(10) NOT NULL DEFAULT '',
  `id_provincia` int(11) NOT NULL DEFAULT 1,
  `id_pais` int(11) NOT NULL DEFAULT 1,
  `tipo_tel` varchar(5) NOT NULL DEFAULT '',
  `nro_tel` varchar(75) NOT NULL DEFAULT '',
  `correo` varchar(100) NOT NULL DEFAULT '',
  `fec_inicio` varchar(10) NOT NULL DEFAULT '',
  `activo` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id_alumno`, `nombre`, `apellido`, `tipo_doc`, `nro_doc`, `foto`, `fec_nacimiento`, `id_provincia`, `id_pais`, `tipo_tel`, `nro_tel`, `correo`, `fec_inicio`, `activo`) VALUES
(1000, 'Sebastian', 'Jose', '', '231213213', 0x696d616765732f616c756d6e6f732f312e6a7067, '1985-01-14', 4, 11, '', '23123145', 'sebastiann1@gmail.com', '2010-01-14', b'1'),
(1001, 'Juan', 'Jose', '', '23145687', 0x696d616765732f616c756d6e6f732f31325f686a6f4e6c4e612e6a7067, '1985-01-14', 2, 11, '', '23145678', 'seba@gmail.com', '2023-06-16', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_clase`
--

CREATE TABLE `alumno_clase` (
  `id` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL,
  `id_clase` int(11) NOT NULL,
  `faltas` int(11) NOT NULL DEFAULT 0,
  `calificacion` int(11) DEFAULT NULL,
  `id_materia` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumno_clase`
--

INSERT INTO `alumno_clase` (`id`, `id_alumno`, `id_clase`, `faltas`, `calificacion`, `id_materia`) VALUES
(1, 1000, 1, 2, 8, ''),
(2, 1000, 1, 2, 8, ''),
(3, 1000, 1, 2, 8, ''),
(4, 1000, 1, 2, 8, ''),
(5, 1000, 2, 2, 10, ''),
(6, 1000, 1, 1, 10, ''),
(7, 1000, 1, 3, 4, ''),
(8, 1000, 1, 2, 2, ''),
(9, 1000, 1, 2, 10, ''),
(10, 1000, 3, 2, 10, ''),
(11, 1000, 1, 1, 1, ''),
(12, 1000, 1, 2, 5, NULL),
(13, 1000, 3, 2, 9, NULL),
(14, 1000, 3, 1, 7, NULL),
(15, 1000, 2, 1, 3, NULL),
(16, 1000, 1, 5, 2, NULL),
(17, 1000, 3, 100, 1, NULL),
(18, 1000, 1, 2, 2, NULL),
(19, 1000, 3, 200, 350, NULL),
(20, 1001, 1, 2, 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add alumno', 7, 'add_alumno'),
(26, 'Can change alumno', 7, 'change_alumno'),
(27, 'Can delete alumno', 7, 'delete_alumno'),
(28, 'Can view alumno', 7, 'view_alumno'),
(29, 'Can add alumno clase', 8, 'add_alumnoclase'),
(30, 'Can change alumno clase', 8, 'change_alumnoclase'),
(31, 'Can delete alumno clase', 8, 'delete_alumnoclase'),
(32, 'Can view alumno clase', 8, 'view_alumnoclase'),
(33, 'Can add clase', 9, 'add_clase'),
(34, 'Can change clase', 9, 'change_clase'),
(35, 'Can delete clase', 9, 'delete_clase'),
(36, 'Can view clase', 9, 'view_clase'),
(37, 'Can add materia', 10, 'add_materia'),
(38, 'Can change materia', 10, 'change_materia'),
(39, 'Can delete materia', 10, 'delete_materia'),
(40, 'Can view materia', 10, 'view_materia'),
(41, 'Can add pais', 11, 'add_pais'),
(42, 'Can change pais', 11, 'change_pais'),
(43, 'Can delete pais', 11, 'delete_pais'),
(44, 'Can view pais', 11, 'view_pais'),
(45, 'Can add profesor', 12, 'add_profesor'),
(46, 'Can change profesor', 12, 'change_profesor'),
(47, 'Can delete profesor', 12, 'delete_profesor'),
(48, 'Can view profesor', 12, 'view_profesor'),
(49, 'Can add provincia', 13, 'add_provincia'),
(50, 'Can change provincia', 13, 'change_provincia'),
(51, 'Can delete provincia', 13, 'delete_provincia'),
(52, 'Can view provincia', 13, 'view_provincia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `id_clase` int(11) NOT NULL,
  `clase` varchar(35) DEFAULT NULL,
  `periodo` int(11) DEFAULT NULL,
  `id_materia` int(11) NOT NULL,
  `id_profesor` int(11) NOT NULL,
  `capacidad` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`id_clase`, `clase`, `periodo`, `id_materia`, `id_profesor`, `capacidad`) VALUES
(1, '23001', 1, 1, 100, 5),
(2, '23002', 1, 2, 100, 10),
(3, '23003', 2, 6, 101, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(7, 'academia', 'alumno'),
(8, 'academia', 'alumnoclase'),
(9, 'academia', 'clase'),
(10, 'academia', 'materia'),
(11, 'academia', 'pais'),
(12, 'academia', 'profesor'),
(13, 'academia', 'provincia'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'academia', '0001_initial', '2023-06-17 16:02:28.547439'),
(2, 'contenttypes', '0001_initial', '2023-06-17 16:02:28.578699'),
(3, 'auth', '0001_initial', '2023-06-17 16:02:28.891201'),
(4, 'admin', '0001_initial', '2023-06-17 16:02:28.969325'),
(5, 'admin', '0002_logentry_remove_auto_add', '2023-06-17 16:02:28.969325'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2023-06-17 16:02:28.985034'),
(7, 'contenttypes', '0002_remove_content_type_name', '2023-06-17 16:02:29.031829'),
(8, 'auth', '0002_alter_permission_name_max_length', '2023-06-17 16:02:29.063074'),
(9, 'auth', '0003_alter_user_email_max_length', '2023-06-17 16:02:29.078702'),
(10, 'auth', '0004_alter_user_username_opts', '2023-06-17 16:02:29.078702'),
(11, 'auth', '0005_alter_user_last_login_null', '2023-06-17 16:02:29.110349'),
(12, 'auth', '0006_require_contenttypes_0002', '2023-06-17 16:02:29.110349'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2023-06-17 16:02:29.125982'),
(14, 'auth', '0008_alter_user_username_max_length', '2023-06-17 16:02:29.141664'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2023-06-17 16:02:29.157324'),
(16, 'auth', '0010_alter_group_name_max_length', '2023-06-17 16:02:29.172859'),
(17, 'auth', '0011_update_proxy_permissions', '2023-06-17 16:02:29.172859'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2023-06-17 16:02:29.188482'),
(19, 'email_reseteo_2', '0001_initial', '2023-06-17 16:02:29.250983'),
(20, 'email_reseteo_2', '0002_delete_profile', '2023-06-17 16:02:29.250983'),
(21, 'gestion_usuarios', '0001_initial', '2023-06-17 16:02:29.266608'),
(22, 'gestion_usuarios', '0002_delete_usuario', '2023-06-17 16:02:29.282232'),
(23, 'sessions', '0001_initial', '2023-06-17 16:02:29.297978');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `id_materia` int(11) NOT NULL,
  `materia` varchar(35) DEFAULT NULL,
  `carrera` varchar(35) NOT NULL,
  `anio` varchar(15) NOT NULL,
  `cuatrimestre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id_materia`, `materia`, `carrera`, `anio`, `cuatrimestre`) VALUES
(1, 'Analisis 1', 'Ingenieria', '01', '01'),
(2, 'geometria', 'ingenieria', '01', '01'),
(3, 'Oratoria 1', 'Abogacia', '01', '01'),
(4, 'Derecho 1', 'Abogacia', '01', '02'),
(5, 'Analisis 2', 'Ingenieria', '02', '01'),
(6, 'Derecho Romano', 'abogacia', '02', '01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id_pais` int(11) NOT NULL,
  `desc_pais` varchar(75) DEFAULT NULL,
  `iso` varchar(2) DEFAULT NULL,
  `iso3` varchar(3) DEFAULT NULL,
  `isonum` int(11) NOT NULL,
  `bandera` blob DEFAULT NULL,
  `numorden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id_pais`, `desc_pais`, `iso`, `iso3`, `isonum`, `bandera`, `numorden`) VALUES
(1, '', '', '', 0, NULL, 1),
(2, 'Afghanistan', 'AF', 'AFG', 4, NULL, 2),
(3, 'Aland Islands', 'AX', 'ALA', 248, NULL, 3),
(4, 'Albania', 'AL', 'ALB', 8, NULL, 4),
(5, 'Algeria', 'DZ', 'DZA', 12, NULL, 5),
(6, 'American Samoa', 'AS', 'ASM', 16, NULL, 6),
(7, 'Andorra', 'AD', 'AND', 20, NULL, 7),
(8, 'Angola', 'AO', 'AGO', 24, NULL, 8),
(9, 'Anguilla', 'AI', 'AIA', 660, NULL, 9),
(10, 'Antigua and Barbuda', 'AG', 'ATG', 28, NULL, 10),
(11, 'Argentina', 'AR', 'ARG', 32, NULL, 11),
(12, 'Armenia', 'AM', 'ARM', 51, NULL, 12),
(13, 'Aruba', 'AW', 'ABW', 533, NULL, 13),
(14, 'Australia', 'AU', 'AUS', 36, NULL, 14),
(15, 'Austria', 'AT', 'AUT', 40, NULL, 15),
(16, 'Azerbaijan', 'AZ', 'AZE', 31, NULL, 16),
(17, 'Bahamas', 'BS', 'BHS', 44, NULL, 17),
(18, 'Bahrain', 'BH', 'BHR', 48, NULL, 18),
(19, 'Bangladesh', 'BD', 'BGD', 50, NULL, 19),
(20, 'Barbados', 'BB', 'BRB', 52, NULL, 20),
(21, 'Belarus', 'BY', 'BLR', 112, NULL, 21),
(22, 'Belgium', 'BE', 'BEL', 56, NULL, 22),
(23, 'Belize', 'BZ', 'BLZ', 84, NULL, 23),
(24, 'Benin', 'BJ', 'BEN', 204, NULL, 24),
(25, 'Bermuda', 'BM', 'BMU', 60, NULL, 25),
(26, 'Bhutan', 'BT', 'BTN', 64, NULL, 26),
(27, 'Bolivia', 'BO', 'BOL', 68, NULL, 27),
(28, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', 535, NULL, 28),
(29, 'Bosnia and Herzegovina', 'BA', 'BIH', 70, NULL, 29),
(30, 'Botswana', 'BW', 'BWA', 72, NULL, 30),
(31, 'Bouvet Island', 'BV', 'BVT', 74, NULL, 31),
(32, 'Brazil', 'BR', 'BRA', 76, NULL, 32),
(33, 'British Indian Ocean Territory', 'IO', 'IOT', 86, NULL, 33),
(34, 'Brunei Darussalam', 'BN', 'BRN', 96, NULL, 34),
(35, 'Bulgaria', 'BG', 'BGR', 100, NULL, 35),
(36, 'Burkina Faso', 'BF', 'BFA', 854, NULL, 36),
(37, 'Burundi', 'BI', 'BDI', 108, NULL, 37),
(38, 'Cambodia', 'KH', 'KHM', 116, NULL, 38),
(39, 'Cameroon', 'CM', 'CMR', 120, NULL, 39),
(40, 'Canada', 'CA', 'CAN', 124, NULL, 40),
(41, 'Cape Verde', 'CV', 'CPV', 132, NULL, 41),
(42, 'Cayman Islands', 'KY', 'CYM', 136, NULL, 42),
(43, 'Central African Republic', 'CF', 'CAF', 140, NULL, 43),
(44, 'Chad', 'TD', 'TCD', 148, NULL, 44),
(45, 'Chile', 'CL', 'CHL', 152, NULL, 45),
(46, 'China, People´s Republic of', 'CN', 'CHN', 156, NULL, 46),
(47, 'Christmas Island', 'CX', 'CXR', 162, NULL, 47),
(48, 'Cocos (Keeling) Islands', 'CC', 'CCK', 166, NULL, 48),
(49, 'Colombia', 'CO', 'COL', 170, NULL, 49),
(50, 'Comoros', 'KM', 'COM', 174, NULL, 50),
(51, 'Congo, Republic of the', 'CG', 'COG', 178, NULL, 51),
(52, 'Congo, the Democratic Republic of the', 'CD', 'COD', 180, NULL, 52),
(53, 'Cook Islands', 'CK', 'COK', 184, NULL, 53),
(54, 'Costa Rica', 'CR', 'CRI', 188, NULL, 54),
(55, 'Côte d´Ivoire', 'CI', 'CIV', 384, NULL, 55),
(56, 'Croatia', 'HR', 'HRV', 191, NULL, 56),
(57, 'Cuba', 'CU', 'CUB', 192, NULL, 57),
(58, 'Curaçao', 'CW', 'CUW', 531, NULL, 58),
(59, 'Cyprus', 'CY', 'CYP', 196, NULL, 59),
(60, 'Czech Republic', 'CZ', 'CZE', 203, NULL, 60),
(61, 'Denmark', 'DK', 'DNK', 208, NULL, 61),
(62, 'Djibouti', 'DJ', 'DJI', 262, NULL, 62),
(63, 'Dominica', 'DM', 'DMA', 212, NULL, 63),
(64, 'Dominican Republic', 'DO', 'DOM', 214, NULL, 64),
(65, 'Ecuador', 'EC', 'ECU', 218, NULL, 65),
(66, 'Egypt', 'EG', 'EGY', 818, NULL, 66),
(67, 'El Salvador', 'SV', 'SLV', 222, NULL, 67),
(68, 'Equatorial Guinea', 'GQ', 'GNQ', 226, NULL, 68),
(69, 'Eritrea', 'ER', 'ERI', 232, NULL, 69),
(70, 'Estonia', 'EE', 'EST', 233, NULL, 70),
(71, 'Ethiopia', 'ET', 'ETH', 231, NULL, 71),
(72, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 238, NULL, 72),
(73, 'Faroe Islands', 'FO', 'FRO', 234, NULL, 73),
(74, 'Fiji', 'FJ', 'FJI', 242, NULL, 74),
(75, 'Finland', 'FI', 'FIN', 246, NULL, 75),
(76, 'France', 'FR', 'FRA', 250, NULL, 76),
(77, 'French Guiana', 'GF', 'GUF', 254, NULL, 77),
(78, 'French Polynesia', 'PF', 'PYF', 258, NULL, 78),
(79, 'French Southern Territories', 'TF', 'ATF', 260, NULL, 79),
(80, 'Gabon', 'GA', 'GAB', 266, NULL, 80),
(81, 'Gambia', 'GM', 'GMB', 270, NULL, 81),
(82, 'Georgia', 'GE', 'GEO', 268, NULL, 82),
(83, 'Germany', 'DE', 'DEU', 276, NULL, 83),
(84, 'Ghana', 'GH', 'GHA', 288, NULL, 84),
(85, 'Gibraltar', 'GI', 'GIB', 292, NULL, 85),
(86, 'Greece', 'GR', 'GRC', 300, NULL, 86),
(87, 'Greenland', 'GL', 'GRL', 304, NULL, 87),
(88, 'Grenada', 'GD', 'GRD', 308, NULL, 88),
(89, 'Guadeloupe', 'GP', 'GLP', 312, NULL, 89),
(90, 'Guam', 'GU', 'GUM', 316, NULL, 90),
(91, 'Guatemala', 'GT', 'GTM', 320, NULL, 91),
(92, 'Guernsey', 'GG', 'GGY', 831, NULL, 92),
(93, 'Guinea', 'GN', 'GIN', 324, NULL, 93),
(94, 'Guinea-Bissau', 'GW', 'GNB', 624, NULL, 94),
(95, 'Guyana', 'GY', 'GUY', 328, NULL, 95),
(96, 'Haiti', 'HT', 'HTI', 332, NULL, 96),
(97, 'Heard Island and McDonald Islands', 'HM', 'HMD', 334, NULL, 97),
(98, 'Holy See (Vatican City State)', 'VA', 'VAT', 336, NULL, 98),
(99, 'Honduras	', 'HN', 'HND', 340, NULL, 99),
(100, 'Hong Kong', 'HK', 'HKG', 344, NULL, 100),
(101, 'Hungary', 'HU', 'HUN', 348, NULL, 101),
(102, 'Iceland', 'IS', 'ISL', 352, NULL, 102),
(103, 'India', 'IN', 'IND', 356, NULL, 103),
(104, 'Indonesia', 'ID', 'IDN', 360, NULL, 104),
(105, 'Iran, Islamic Republic of', 'IR', 'IRN', 364, NULL, 105),
(106, 'Iraq', 'IQ', 'IRQ', 368, NULL, 106),
(107, 'Ireland', 'IE', 'IRL', 372, NULL, 107),
(108, 'Isle of Man', 'IM', 'IMN', 833, NULL, 108),
(109, 'Israel', 'IL', 'ISR', 376, NULL, 109),
(110, 'Italy', 'IT', 'ITA', 380, NULL, 110),
(111, 'Jamaica', 'JM', 'JAM', 388, NULL, 111),
(112, 'Japan', 'JP', 'JPN', 392, NULL, 112),
(113, 'Jersey', 'JE', 'JEY', 832, NULL, 113),
(114, 'Jordan', 'JO', 'JOR', 400, NULL, 114),
(115, 'Kazakhstan', 'KZ', 'KAZ', 398, NULL, 115),
(116, 'Kenya', 'KE', 'KEN', 404, NULL, 116),
(117, 'Kiribati', 'KI', 'KIR', 296, NULL, 117),
(118, 'Korea, Democratic People´s Republic of', 'KP', 'PRK', 408, NULL, 118),
(119, 'Korea, Republic of', 'KR', 'KOR', 410, NULL, 119),
(120, 'Kuwait', 'KW', 'KWT', 414, NULL, 120),
(121, 'Kyrgyzstan', 'KG', 'KGZ', 417, NULL, 121),
(122, 'Laos People´s Democratic Republic', 'LA', 'LAO', 418, NULL, 122),
(123, 'Latvia', 'LV', 'LVA', 428, NULL, 123),
(124, 'Lebanon', 'LB', 'LBN', 422, NULL, 124),
(125, 'Lesotho', 'LS', 'LSO', 426, NULL, 125),
(126, 'Liberia', 'LR', 'LBR', 430, NULL, 126),
(127, 'Libya', 'LY', 'LBY', 434, NULL, 127),
(128, 'Liechtenstein', 'LI', 'LIE', 438, NULL, 128),
(129, 'Lithuania', 'LT', 'LTU', 440, NULL, 129),
(130, 'Luxembourg', 'LU', 'LUX', 442, NULL, 130),
(131, 'Macao', 'MO', 'MAC', 446, NULL, 131),
(132, 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MKD', 807, NULL, 132),
(133, 'Madagascar', 'MG', 'MDG', 450, NULL, 133),
(134, 'Malawi', 'MW', 'MWI', 454, NULL, 134),
(135, 'Malaysia', 'MY', 'MYS', 458, NULL, 135),
(136, 'Maldives', 'MV', 'MDV', 462, NULL, 136),
(137, 'Mali', 'ML', 'MLI', 466, NULL, 137),
(138, 'Malta', 'MT', 'MLT', 470, NULL, 138),
(139, 'Marshall Islands', 'MH', 'MHL', 584, NULL, 139),
(140, 'Martinique', 'MQ', 'MTQ', 474, NULL, 140),
(141, 'Mauritania', 'MR', 'MRT', 478, NULL, 141),
(142, 'Mauritius', 'MU', 'MUS', 480, NULL, 142),
(143, 'Mayotte', 'YT', 'MYT', 175, NULL, 143),
(144, 'Mexico', 'MX', 'MEX', 484, NULL, 144),
(145, 'Micronesia, Federated States of', 'FM', 'FSM', 583, NULL, 145),
(146, 'Moldova, Republic of', 'MD', 'MDA', 498, NULL, 146),
(147, 'Monaco', 'MC', 'MCO', 492, NULL, 147),
(148, 'Mongolia', 'MN', 'MNG', 496, NULL, 148),
(149, 'Montenegro', 'ME', 'MNE', 499, NULL, 149),
(150, 'Montserrat', 'MS', 'MSR', 500, NULL, 150),
(151, 'Morocco', 'MA', 'MAR', 504, NULL, 151),
(152, 'Mozambique', 'MZ', 'MOZ', 508, NULL, 152),
(153, 'Myanmar', 'MM', 'MMR', 104, NULL, 153),
(154, 'Namibia', 'NA', 'NAM', 516, NULL, 154),
(155, 'Nauru', 'NR', 'NRU', 520, NULL, 155),
(156, 'Nepal', 'NP', 'NPL', 524, NULL, 156),
(157, 'Netherlands', 'NL', 'NLD', 528, NULL, 157),
(158, 'New Caledonia', 'NC', 'NCL', 540, NULL, 158),
(159, 'New Zealand', 'NZ', 'NZL', 554, NULL, 159),
(160, 'Nicaragua', 'NI', 'NIC', 558, NULL, 160),
(161, 'Niger', 'NE', 'NER', 562, NULL, 161),
(162, 'Nigeria', 'NG', 'NGA', 566, NULL, 162),
(163, 'Niue', 'NU', 'NIU', 570, NULL, 163),
(164, 'Norfolk Island', 'NF', 'NFK', 574, NULL, 164),
(165, 'Northern Mariana Islands', 'MP', 'MNP', 580, NULL, 165),
(166, 'Norway', 'NO', 'NOR', 578, NULL, 166),
(167, 'Oman', 'OM', 'OMN', 512, NULL, 167),
(168, 'Pakistan', 'PK', 'PAK', 586, NULL, 168),
(169, 'Palau', 'PW', 'PLW', 585, NULL, 169),
(170, 'Palestine, State of', 'PS', 'PSE', 275, NULL, 170),
(171, 'Panama', 'PA', 'PAN', 591, NULL, 171),
(172, 'Papua New Guinea', 'PG', 'PNG', 598, NULL, 172),
(173, 'Paraguay', 'PY', 'PRY', 600, NULL, 173),
(174, 'Peru', 'PE', 'PER', 604, NULL, 174),
(175, 'Philippines', 'PH', 'PHL', 608, NULL, 175),
(176, 'Pitcairn', 'PN', 'PCN', 612, NULL, 176),
(177, 'Poland', 'PL', 'POL', 616, NULL, 177),
(178, 'Portugal', 'PT', 'PRT', 620, NULL, 178),
(179, 'Puerto Rico', 'PR', 'PRI', 630, NULL, 179),
(180, 'Qatar', 'QA', 'QAT', 634, NULL, 180),
(181, 'Réunion', 'RE', 'REU', 638, NULL, 181),
(182, 'Romania', 'RO', 'ROU', 642, NULL, 182),
(183, 'Russian Federation', 'RU', 'RUS', 643, NULL, 183),
(184, 'Rwanda', 'RW', 'RWA', 646, NULL, 184),
(185, 'Saint Barthélemy', 'BL', 'BLM', 652, NULL, 185),
(186, 'Saint Helena, Ascension and Tristan da Cunha', 'SH', 'SHN', 654, NULL, 186),
(187, 'Saint Kitts and Nevis', 'KN', 'KNA', 659, NULL, 187),
(188, 'Saint Lucia', 'LC', 'LCA', 662, NULL, 188),
(189, 'Saint Martin (French part)', 'MF', 'MAF', 663, NULL, 189),
(190, 'Saint Pierre and Miquelon', 'PM', 'SPM', 666, NULL, 190),
(191, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 670, NULL, 191),
(192, 'Samoa', 'WS', 'WSM', 882, NULL, 192),
(193, 'San Marino', 'SM', 'SMR', 674, NULL, 193),
(194, 'Sao Tome and Principe', 'ST', 'STP', 678, NULL, 194),
(195, 'Saudi Arabia', 'SA', 'SAU', 682, NULL, 195),
(196, 'Senegal', 'SN', 'SEN', 686, NULL, 196),
(197, 'Serbia', 'RS', 'SRB', 688, NULL, 197),
(198, 'Seychelles', 'SC', 'SYC', 690, NULL, 198),
(199, 'Sierra Leone', 'SL', 'SLE', 694, NULL, 199),
(200, 'Singapore', 'SG', 'SGP', 702, NULL, 200),
(201, 'Sint Maarten (Dutch part)', 'SX', 'SXM', 534, NULL, 201),
(202, 'Slovakia', 'SK', 'SVK', 703, NULL, 202),
(203, 'Slovenia', 'SI', 'SVN', 705, NULL, 203),
(204, 'Solomon Islands', 'SB', 'SLB', 90, NULL, 204),
(205, 'Somalia', 'SO', 'SOM', 706, NULL, 205),
(206, 'South Africa', 'ZA', 'ZAF', 710, NULL, 206),
(207, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 239, NULL, 207),
(208, 'South Sudan', 'SS', 'SSD', 728, NULL, 208),
(209, 'Spain', 'ES', 'ESP', 724, NULL, 209),
(210, 'Sri Lanka', 'LK', 'LKA', 144, NULL, 210),
(211, 'Sudan', 'SD', 'SDN', 729, NULL, 211),
(212, 'Suriname', 'SR', 'SUR', 740, NULL, 212),
(213, 'Svalbard and Jan Mayen', 'SJ', 'SJM', 744, NULL, 213),
(214, 'Swaziland', 'SZ', 'SWZ', 748, NULL, 214),
(215, 'Sweden', 'SE', 'SWE', 752, NULL, 215),
(216, 'Switzerland', 'CH', 'CHE', 756, NULL, 216),
(217, 'Syrian Arab Republic', 'SY', 'SYR', 760, NULL, 217),
(218, 'Taiwan, Province of China', 'TW', 'TWN', 158, NULL, 218),
(219, 'Tajikistan', 'TJ', 'TJK', 762, NULL, 219),
(220, 'Tanzania, United Republic of', 'TZ', 'TZA', 834, NULL, 220),
(221, 'Thailand', 'TH', 'THA', 764, NULL, 221),
(222, 'Timor-Leste', 'TL', 'TLS', 626, NULL, 222),
(223, 'Togo', 'TG', 'TGO', 768, NULL, 223),
(224, 'Tokelau', 'TK', 'TK', 772, NULL, 224),
(225, 'Tonga', 'TO', 'TON', 776, NULL, 225),
(226, 'Trinidad and Tobago', 'TT', 'TTO', 780, NULL, 226),
(227, 'Tunisia', 'TN', 'TUN', 788, NULL, 227),
(228, 'Türkiye', 'TR', 'TUR', 792, NULL, 228),
(229, 'Turkmenistan', 'TM', 'TKM', 795, NULL, 229),
(230, 'Turks and Caicos Islands	', 'TC', 'TCA', 796, NULL, 230),
(231, 'Tuvalu', 'TV', 'TUV', 798, NULL, 231),
(232, 'Uganda', 'UG', 'UGA', 800, NULL, 232),
(233, 'Ukraine', 'UA', 'UKR', 804, NULL, 233),
(234, 'United Arab Emirates', 'AE', 'ARE', 784, NULL, 234),
(235, 'United Kingdom', 'GB', 'GBR', 826, NULL, 235),
(236, 'United States', 'US', 'USA', 840, NULL, 236),
(237, 'United States Minor Outlying Islands', 'UM', 'UMI', 581, NULL, 237),
(238, 'Uruguay', 'UY', 'URY', 858, NULL, 238),
(239, 'Uzbekistan', 'UZ', 'UZB', 860, NULL, 239),
(240, 'Vanuatu', 'VU', 'VUT', 548, NULL, 240),
(241, 'Venezuela, Bolivarian Republic of', 'VE', 'VEN', 862, NULL, 241),
(242, 'Viet Nam', 'VN', 'VNM', 704, NULL, 242),
(243, 'Virgin Islands, British', 'VG', 'VGB', 92, NULL, 243),
(244, 'Virgin Islands, U.S.', 'VI', 'VIR', 850, NULL, 244),
(245, 'Wallis and Futuna', 'WF', 'WLF', 876, NULL, 245),
(246, 'Western Sahara', 'EH', 'ESH', 732, NULL, 246),
(247, 'Yemen', 'YE', 'YEM', 887, NULL, 247),
(248, 'Zambia', 'ZM', 'ZMB', 894, NULL, 248),
(249, 'Zimbabwe', 'ZW', 'ZWE', 716, NULL, 249),
(250, 'Kosovo', 'KO', 'KOS', 9999, NULL, 120),
(251, 'Sahrawi Arab Democratic Republic', 'EH', 'ESH', 732, NULL, 184);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id_profesor` int(11) NOT NULL,
  `nombre` varchar(75) DEFAULT NULL,
  `apellido` varchar(75) DEFAULT NULL,
  `tipo_doc` varchar(5) NOT NULL DEFAULT '',
  `nro_doc` varchar(15) NOT NULL DEFAULT '',
  `foto` blob DEFAULT NULL,
  `fec_nacimiento` varchar(10) NOT NULL DEFAULT '',
  `id_provincia` int(11) NOT NULL DEFAULT 1,
  `id_pais` int(11) NOT NULL DEFAULT 1,
  `tipo_tel` varchar(5) NOT NULL DEFAULT '',
  `nro_tel` varchar(75) NOT NULL DEFAULT '',
  `correo` varchar(100) NOT NULL DEFAULT '',
  `fec_inicio` varchar(10) NOT NULL DEFAULT '',
  `activo` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id_profesor`, `nombre`, `apellido`, `tipo_doc`, `nro_doc`, `foto`, `fec_nacimiento`, `id_provincia`, `id_pais`, `tipo_tel`, `nro_tel`, `correo`, `fec_inicio`, `activo`) VALUES
(100, 'pepe', 'juan', '', '2314565', 0x696d616765732f70726f6665736f7265732f33322e6a7067, '1985-01-14', 1, 32, '', '23156478', 'sebas@gmail.com', '2015-01-14', NULL),
(101, 'seba', 'jose', '', '231231231', 0x696d616765732f70726f6665736f7265732f36322e6a7067, '1985-01-14', 1, 5, '', '456456231', 'eda@gmail.com', '1985-01-14', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id_provincia` int(11) NOT NULL,
  `desc_provincia` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`id_provincia`, `desc_provincia`) VALUES
(1, 'Sin provincia'),
(2, 'Buenos Aires'),
(3, 'Catamarca'),
(4, 'Ciudad Autónoma de Buenos Aires'),
(5, 'Chaco'),
(6, 'Chubut'),
(7, 'Córdoba'),
(8, 'Corrientes'),
(9, 'Entre Rios'),
(10, 'Formosa'),
(11, 'Jujuy'),
(12, 'La Pampa'),
(13, 'La Rioja'),
(14, 'Mendoza'),
(15, 'Misiones'),
(16, 'Neuquén'),
(17, 'Río Negro'),
(18, 'Salta'),
(19, 'San Juan'),
(20, 'San Luis'),
(21, 'Santa Cruz'),
(22, 'Santa Fe'),
(23, 'Santiago del Estero'),
(24, 'Tierra del Fuego'),
(25, 'Tucumán');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id_alumno`),
  ADD KEY `id_provincia` (`id_provincia`),
  ADD KEY `id_pais` (`id_pais`);

--
-- Indices de la tabla `alumno_clase`
--
ALTER TABLE `alumno_clase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_alumno` (`id_alumno`),
  ADD KEY `id_clase` (`id_clase`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`id_clase`),
  ADD KEY `id_materia` (`id_materia`),
  ADD KEY `id_profesor` (`id_profesor`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id_materia`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id_pais`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id_profesor`),
  ADD KEY `id_provincia` (`id_provincia`),
  ADD KEY `id_pais` (`id_pais`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id_provincia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

--
-- AUTO_INCREMENT de la tabla `alumno_clase`
--
ALTER TABLE `alumno_clase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clase`
--
ALTER TABLE `clase`
  MODIFY `id_clase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id_pais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `id_profesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id_provincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`),
  ADD CONSTRAINT `alumno_ibfk_2` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`);

--
-- Filtros para la tabla `alumno_clase`
--
ALTER TABLE `alumno_clase`
  ADD CONSTRAINT `alumno_clase_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`),
  ADD CONSTRAINT `alumno_clase_ibfk_2` FOREIGN KEY (`id_clase`) REFERENCES `clase` (`id_clase`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `clase`
--
ALTER TABLE `clase`
  ADD CONSTRAINT `clase_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`),
  ADD CONSTRAINT `clase_ibfk_2` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`),
  ADD CONSTRAINT `profesor_ibfk_2` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

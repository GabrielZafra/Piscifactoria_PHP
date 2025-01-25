-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-01-2025 a las 12:38:14
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
-- Base de datos: `piscifactoria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts`
--

CREATE TABLE `accounts` (
  `account_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `creation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `accounts`
--

INSERT INTO `accounts` (`account_id`, `username`, `password`, `creation_date`) VALUES
(3, 'furrito77', 'pingadefurro', '0000-00-00'),
(4, 'CarlosBurriel', 'PiscifactoriaDev', '0000-00-00'),
(5, 'Dieguito Maradona', 'pez', '0000-00-00'),
(6, 'Villareal', 'Furbo', '0000-00-00'),
(7, 'pluto', 'pluton', '0000-00-00'),
(18, 'c', 'u', '0000-00-00');

--
-- Disparadores `accounts`
--
DELIMITER $$
CREATE TRIGGER `after_accounts_insert` AFTER INSERT ON `accounts` FOR EACH ROW BEGIN
    INSERT INTO account_stats (player_id, deaths, kills, powerups_gathered, ammo_gathered, wins, defeats, games_played)
    VALUES (NEW.account_id, 0, 0, 0, 0, 0, 0, 0);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_stats`
--

CREATE TABLE `account_stats` (
  `player_id` int(11) NOT NULL,
  `deaths` int(11) DEFAULT NULL,
  `kills` int(11) DEFAULT NULL,
  `powerups_gathered` int(11) DEFAULT NULL,
  `ammo_gathered` int(11) DEFAULT NULL,
  `wins` int(11) DEFAULT NULL,
  `defeats` int(11) DEFAULT NULL,
  `games_played` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `account_stats`
--

INSERT INTO `account_stats` (`player_id`, `deaths`, `kills`, `powerups_gathered`, `ammo_gathered`, `wins`, `defeats`, `games_played`) VALUES
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 0, 0, 0, 0, 1, 2, 3),
(5, 0, 0, 0, 0, 1, 3, 4),
(6, 0, 0, 0, 0, 0, 4, 4),
(7, 25, 12, 6, 5, 59, 51, 58),
(18, 11, 5, 4, 3, 60, 57, 52);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deaths_table`
--

CREATE TABLE `deaths_table` (
  `death_id` int(11) NOT NULL,
  `id_game` int(11) NOT NULL,
  `death_position_x` varchar(11) NOT NULL,
  `death_position_z` varchar(11) NOT NULL,
  `killer_id` int(11) NOT NULL,
  `victim_id` int(11) NOT NULL,
  `time_of_death` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `deaths_table`
--

INSERT INTO `deaths_table` (`death_id`, `id_game`, `death_position_x`, `death_position_z`, `killer_id`, `victim_id`, `time_of_death`) VALUES
(1, 52, '5,292997', '-24,18', 18, 7, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `games`
--

CREATE TABLE `games` (
  `games_id` int(11) NOT NULL,
  `total_deaths` int(11) DEFAULT NULL,
  `total_powerups` int(11) DEFAULT NULL,
  `total_ammo_gathered` int(11) DEFAULT NULL,
  `winner` int(11) NOT NULL,
  `loser_a` int(11) NOT NULL,
  `loser_b` int(11) NOT NULL,
  `loser_c` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `games`
--

INSERT INTO `games` (`games_id`, `total_deaths`, `total_powerups`, `total_ammo_gathered`, `winner`, `loser_a`, `loser_b`, `loser_c`) VALUES
(6, NULL, NULL, NULL, 3, 4, 5, 6),
(7, NULL, NULL, NULL, 4, 5, 6, 7),
(10, 3, 2, 1, 5, 6, 7, 18),
(11, 1, 0, 0, 7, 7, 3, 3),
(12, 0, 0, 0, 18, 18, 3, 3),
(13, 0, 0, 0, 18, 18, 3, 3),
(14, 1, 0, 0, 7, 7, 3, 3),
(15, 1, 0, 0, 18, 18, 3, 3),
(16, 1, 0, 0, 18, 18, 3, 3),
(17, 1, 1, 1, 3, 4, 5, 6),
(18, 1, 2, 3, 3, 4, 5, 6),
(19, 1, 1, 1, 3, 3, 3, 3),
(20, 1, 1, 1, 3, 3, 3, 3),
(21, 1, 1, 1, 3, 3, 3, 3),
(22, 1, 0, 0, 7, 7, 3, 3),
(23, 1, 1, 1, 3, 3, 3, 3),
(24, 0, 0, 0, 7, 7, 3, 3),
(25, 1, 1, 1, 3, 3, 3, 3),
(26, 1, 1, 1, 3, 3, 3, 3),
(27, 1, 1, 1, 3, 3, 3, 3),
(28, 1, 1, 1, 3, 3, 3, 3),
(29, 1, 0, 0, 18, 18, 3, 3),
(30, 0, 0, 0, 18, 18, 3, 3),
(31, 1, 0, 0, 7, 7, 3, 3),
(32, 1, 1, 1, 3, 3, 3, 3),
(33, 1, 1, 0, 7, 7, 3, 3),
(34, 0, 0, 0, 18, 18, 3, 3),
(35, 2, 0, 1, 18, 18, 3, 3),
(36, 0, 0, 0, 7, 7, 3, 3),
(37, 1, 0, 0, 7, 7, 3, 3),
(38, 0, 0, 0, 18, 18, 3, 3),
(39, 0, 0, 0, 18, 18, 3, 3),
(40, 1, 0, 1, 18, 18, 3, 3),
(41, 1, 0, 0, 18, 7, 3, 3),
(42, 0, 0, 0, 7, 18, 3, 3),
(43, 1, 1, 1, 3, 3, 3, 3),
(44, 0, 0, 0, 7, 18, 3, 3),
(45, 1, 2, 1, 18, 7, 3, 3),
(46, 0, 0, 0, 18, 7, 3, 3),
(47, 0, 0, 0, 7, 18, 3, 3),
(48, 1, 1, 1, 3, 3, 3, 3),
(49, 0, 0, 0, 7, 18, 3, 3),
(50, 1, 1, 1, 3, 3, 3, 3),
(51, 1, 1, 1, 3, 3, 3, 3),
(52, 1, 1, 0, 18, 7, 3, 3);

--
-- Disparadores `games`
--
DELIMITER $$
CREATE TRIGGER `after_game_insert` AFTER INSERT ON `games` FOR EACH ROW BEGIN
    -- Actualizar estadísticas del ganador
    UPDATE account_stats
    SET wins = wins + 1, games_played = games_played + 1
    WHERE player_id = NEW.winner;

    -- Actualizar estadísticas de los perdedores
    UPDATE account_stats
    SET defeats = defeats + 1, games_played = games_played + 1
    WHERE player_id IN (NEW.loser_a, NEW.loser_b, NEW.loser_c);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `games_history`
--

CREATE TABLE `games_history` (
  `id_game` int(11) NOT NULL,
  `id_player` int(11) NOT NULL,
  `deaths` int(11) DEFAULT NULL,
  `kills` int(11) DEFAULT NULL,
  `ammo_gathered` int(11) DEFAULT NULL,
  `powerup_used` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `games_history`
--

INSERT INTO `games_history` (`id_game`, `id_player`, `deaths`, `kills`, `ammo_gathered`, `powerup_used`) VALUES
(31, 7, 0, 1, 0, 0),
(31, 7, 1, 0, 0, 0),
(32, 7, 0, 0, 0, 0),
(33, 7, 0, 3, 0, 1),
(33, 7, 1, 0, 0, 0),
(33, 7, 1, 0, 0, 0),
(33, 7, 0, 3, 0, 1),
(34, 18, 0, 0, 0, 0),
(35, 18, 1, 0, 0, 0),
(36, 7, 0, 0, 0, 0),
(36, 7, 0, 0, 0, 0),
(37, 7, 1, 0, 0, 0),
(37, 7, 0, 0, 0, 0),
(37, 7, 1, 0, 0, 0),
(37, 7, 0, 0, 0, 0),
(38, 18, 0, 0, 0, 0),
(38, 18, 0, 0, 0, 0),
(38, 18, 0, 0, 0, 0),
(38, 18, 0, 0, 0, 0),
(39, 18, 0, 0, 0, 0),
(39, 18, 0, 0, 0, 0),
(40, 18, 0, 0, 1, 0),
(40, 18, 1, 0, 0, 0),
(40, 18, 1, 0, 0, 0),
(41, 18, 0, 1, 0, 0),
(41, 7, 1, 0, 0, 0),
(41, 18, 0, 1, 0, 0),
(41, 7, 1, 0, 0, 0),
(42, 7, 0, 0, 0, 0),
(42, 18, 0, 0, 0, 0),
(42, 7, 0, 0, 0, 0),
(43, 7, 0, 0, 0, 0),
(43, 7, 0, 0, 0, 0),
(44, 7, 0, 0, 0, 0),
(44, 18, 0, 0, 0, 0),
(44, 7, 0, 0, 0, 0),
(45, 18, 0, 0, 0, 0),
(45, 7, 1, 0, 1, 2),
(45, 18, 0, 0, 0, 0),
(46, 7, 0, 0, 0, 0),
(46, 18, 0, 0, 0, 0),
(46, 7, 0, 0, 0, 0),
(46, 18, 0, 0, 0, 0),
(47, 18, 0, 0, 0, 0),
(47, 7, 0, 0, 0, 0),
(47, 7, 0, 0, 0, 0),
(47, 18, 0, 0, 0, 0),
(49, 7, 0, 0, 0, 0),
(49, 18, 0, 0, 0, 0),
(49, 18, 0, 0, 0, 0),
(49, 7, 0, 0, 0, 0),
(50, 7, 0, 0, 0, 0),
(50, 7, 0, 0, 0, 0),
(51, 7, 1, 0, 0, 0),
(51, 7, 1, 0, 0, 0),
(52, 7, 1, 0, 0, 0),
(52, 18, 0, 2, 0, 1),
(52, 18, 0, 2, 0, 1),
(52, 7, 1, 0, 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`account_id`);

--
-- Indices de la tabla `account_stats`
--
ALTER TABLE `account_stats`
  ADD PRIMARY KEY (`player_id`);

--
-- Indices de la tabla `deaths_table`
--
ALTER TABLE `deaths_table`
  ADD PRIMARY KEY (`death_id`),
  ADD KEY `id_game` (`id_game`),
  ADD KEY `killer_id` (`killer_id`),
  ADD KEY `victim_id` (`victim_id`);

--
-- Indices de la tabla `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`games_id`),
  ADD KEY `winner` (`winner`),
  ADD KEY `loser_a` (`loser_a`),
  ADD KEY `loser_b` (`loser_b`),
  ADD KEY `loser_c` (`loser_c`);

--
-- Indices de la tabla `games_history`
--
ALTER TABLE `games_history`
  ADD KEY `id_game` (`id_game`),
  ADD KEY `id_player` (`id_player`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accounts`
--
ALTER TABLE `accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `deaths_table`
--
ALTER TABLE `deaths_table`
  MODIFY `death_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `games`
--
ALTER TABLE `games`
  MODIFY `games_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `account_stats`
--
ALTER TABLE `account_stats`
  ADD CONSTRAINT `account_stats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `accounts` (`account_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `deaths_table`
--
ALTER TABLE `deaths_table`
  ADD CONSTRAINT `deaths_table_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `games` (`games_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `deaths_table_ibfk_2` FOREIGN KEY (`killer_id`) REFERENCES `account_stats` (`player_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `deaths_table_ibfk_3` FOREIGN KEY (`victim_id`) REFERENCES `account_stats` (`player_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `games_ibfk_1` FOREIGN KEY (`winner`) REFERENCES `account_stats` (`player_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `games_ibfk_2` FOREIGN KEY (`loser_a`) REFERENCES `account_stats` (`player_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `games_ibfk_3` FOREIGN KEY (`loser_b`) REFERENCES `account_stats` (`player_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `games_ibfk_4` FOREIGN KEY (`loser_c`) REFERENCES `account_stats` (`player_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `games_history`
--
ALTER TABLE `games_history`
  ADD CONSTRAINT `games_history_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `games` (`games_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `games_history_ibfk_2` FOREIGN KEY (`id_player`) REFERENCES `account_stats` (`player_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

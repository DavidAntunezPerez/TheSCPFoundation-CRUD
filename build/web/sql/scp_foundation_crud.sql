-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-02-2022 a las 20:31:10
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `scp_foundation_crud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `author`
--

CREATE TABLE `author` (
  `CodAut` int(11) NOT NULL,
  `AliasAut` varchar(45) NOT NULL,
  `CorreoAut` varchar(45) NOT NULL,
  `FechAut` date NOT NULL,
  `ContrAut` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `author`
--

INSERT INTO `author` (`CodAut`, `AliasAut`, `CorreoAut`, `FechAut`, `ContrAut`) VALUES
(11, 'An2', 'an2@gmail.com', '2022-02-01', '123'),
(18, 'root', 'root@root.root', '2000-01-01', 'root'),
(19, 'User1', 'user@gmail.com', '2011-11-03', 'user');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase_scp`
--

CREATE TABLE `clase_scp` (
  `CodClas` int(11) NOT NULL,
  `NomClas` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clase_scp`
--

INSERT INTO `clase_scp` (`CodClas`, `NomClas`) VALUES
(1, 'Keter'),
(2, 'Safe'),
(3, 'Euclid'),
(4, 'Thaumiel'),
(5, 'Neutralized'),
(6, 'Apollyon'),
(7, 'Archon');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `scp`
--

CREATE TABLE `scp` (
  `CodScp` int(11) NOT NULL,
  `NomScp` varchar(45) NOT NULL,
  `AliasScp` varchar(45) NOT NULL,
  `EstadoScp` varchar(45) NOT NULL,
  `DescrScp` varchar(6000) NOT NULL,
  `LocScp` varchar(45) NOT NULL,
  `CodAut` int(11) NOT NULL,
  `CodClas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `scp`
--

INSERT INTO `scp` (`CodScp`, `NomScp`, `AliasScp`, `EstadoScp`, `DescrScp`, `LocScp`, `CodAut`, `CodClas`) VALUES
(33, 'SCP-029', 'Daughter of Shadows', 'Contained', 'SCP-029 is to be incarcerated in a Class 5 containment cell. She is to be allowed access to nothing of a physical nature. Her containment cell is to be placed behind a triple airlock, to avoid her escape. As of Incident 029-34a, SCP-029 is no longer to be fed, as she does not appear to need sustenance to survive. There are to be three (3) guards on duty at all times on her cell, and two (2) guards on monitor duty.\r\n\r\nFloodlights have been installed in the walls of the containment chamber, and are to be on at all times. Once a month the chamber is to be cleaned and checked for defects.\r\n\r\nUnder absolutely no circumstances are any men to encounter SCP-029 in any manner. Any males who do encounter SCP-029 are to be held under Class 3 detention for interviewing before termination.', 'Area-11', 19, 4),
(34, 'SCP-049', 'Plague Doctor', 'Free', 'SCP-049 is contained within a Standard Secure Humanoid Containment Cell in Research Sector-02 at Site-19. SCP-049 must be sedated before any attempts to transport it. During transport, SCP-049 must be secured within a Class III Humanoid Restriction Harness (including a locking collar and extension restraints) and monitored by no fewer than two armed guards.\r\n\r\nWhile SCP-049 is generally cooperative with most Foundation personnel, outbursts or sudden changes in behaviour are to be met with elevated force. Under no circumstances should any personnel come into direct contact with SCP-049 during these outbursts. In the event SCP-049 becomes aggressive, the application of lavender (L. multifida) has been shown to produce a calming effect on the entity. Once calmed, SCP-049 generally becomes compliant, and will return to containment with little resistance.\r\n\r\nIn order to facilitate the ongoing containment of SCP-049, the entity is to be provided with the corpse of a recently deceased animal (typically a bovine or other large mammal) once every two weeks for study. Corpses that become instances of SCP-049-2 are to be removed from SCP-049\'s containment cell and incinerated. SCP-049 is no longer permitted to interact with human subjects, and requests for human subjects are to be denied.', 'Unknown', 11, 7),
(35, 'SCP-999', 'The Tickle Monster', 'Unknown', 'SCP-999 is allowed to freely roam the facility should it desire to, but otherwise must stay in its pen. Subject is not allowed out of its pen at night or off facility grounds at any time. Pen is to be kept clean and food replaced twice daily. All personnel are allowed inside SCP-999’s holding area, but only if they are not assigned to other tasks at the time, or if they are on break. Subject is to be played with when bored and spoken to in a calm, non-threatening tone.', 'Spain', 11, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`CodAut`);

--
-- Indices de la tabla `clase_scp`
--
ALTER TABLE `clase_scp`
  ADD PRIMARY KEY (`CodClas`);

--
-- Indices de la tabla `scp`
--
ALTER TABLE `scp`
  ADD PRIMARY KEY (`CodScp`),
  ADD KEY `fk_scp_author` (`CodAut`),
  ADD KEY `fk_scp_clase_scp1` (`CodClas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `author`
--
ALTER TABLE `author`
  MODIFY `CodAut` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `clase_scp`
--
ALTER TABLE `clase_scp`
  MODIFY `CodClas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `scp`
--
ALTER TABLE `scp`
  MODIFY `CodScp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `scp`
--
ALTER TABLE `scp`
  ADD CONSTRAINT `fk_scp_author` FOREIGN KEY (`CodAut`) REFERENCES `author` (`CodAut`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_scp_clase_scp1` FOREIGN KEY (`CodClas`) REFERENCES `clase_scp` (`CodClas`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

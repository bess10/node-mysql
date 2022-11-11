-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2022 a las 17:41:33
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bessy_cine`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `people`
--

CREATE TABLE IF NOT EXISTS `people` (
  `id_people` int(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `profesion` int(2) NOT NULL,
  `genero` int(1) NOT NULL,
  `oscars` int(2) NOT NULL,
  `fecha_nacimiento` varchar(10) NOT NULL,
  PRIMARY KEY (`id_people`),
  KEY `fk_genero` (`genero`),
  KEY `fk_profesion` (`profesion`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COMMENT='Datos básicos de personas famosas del cine';

--
-- Volcado de datos para la tabla `people`
--

INSERT INTO `people` (`id_people`, `nombre`, `apellido`, `profesion`, `genero`, `oscars`, `fecha_nacimiento`) VALUES
(1, 'Katharine', 'Hepburn', 2, 1, 4, '1907'),
(2, 'James', 'Stewart', 2, 2, 2, '1908'),
(3, 'John', 'Ford', 1, 1, 4, '1894'),
(4, 'Cary', 'Grant', 2, 2, 1, '1908'),
(5, 'Henry', 'Fonda', 2, 2, 2, '1905'),
(6, 'Billy', 'Wilder', 1, 2, 6, '1906'),
(7, 'Marilyn', 'Monroe', 2, 1, 0, '1926'),
(8, 'Shirley', 'MacLaine', 2, 1, 1, '1934'),
(9, 'Alfred', 'Hitchcock', 1, 2, 0, '1899'),
(10, 'Nino', 'Rota', 3, 2, 1, '1911'),
(11, 'John', 'Barry', 3, 2, 4, '1933'),
(12, 'Sean', 'Connery', 2, 2, 1, '1930'),
(13, 'Ingrid', 'Bergman', 2, 1, 2, '1915'),
(14, 'Audrey', 'Hepburn', 2, 1, 1, '1929'),
(15, 'Grace', 'Kelly', 2, 1, 1, '1929'),
(17, 'Meryl', 'Streep', 2, 1, 3, '1949'),
(18, 'John', 'Williams', 3, 2, 6, '1923'),
(22, 'Woody', 'Allen', 1, 2, 4, '1935'),
(23, 'Groucho', 'Marx', 2, 2, 1, '1890'),
(26, 'karla', 'person', 2, 2, 2, '1999');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `fk_genero` FOREIGN KEY (`genero`) REFERENCES `genero` (`id_genero`),
  ADD CONSTRAINT `fk_profesion` FOREIGN KEY (`profesion`) REFERENCES `profesion` (`id_profesion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

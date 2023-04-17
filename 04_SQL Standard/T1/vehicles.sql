-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para vehicles
CREATE DATABASE IF NOT EXISTS `vehicles` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `vehicles`;

-- Volcando estructura para tabla vehicles.color
CREATE TABLE IF NOT EXISTS `color` (
  `idcolor` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(5) NOT NULL,
  PRIMARY KEY (`idcolor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla vehicles.color: ~0 rows (aproximadamente)

-- Volcando estructura para tabla vehicles.inventory
CREATE TABLE IF NOT EXISTS `inventory` (
  `idinventory` int NOT NULL,
  `color_idcolor` int NOT NULL,
  `vehicle_idvehicle` int NOT NULL,
  `price` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`idinventory`),
  KEY `fk_inventory_color1_idx` (`color_idcolor`),
  KEY `fk_inventory_vehicle1_idx` (`vehicle_idvehicle`),
  CONSTRAINT `fk_inventory_color1` FOREIGN KEY (`color_idcolor`) REFERENCES `color` (`idcolor`),
  CONSTRAINT `fk_inventory_vehicle1` FOREIGN KEY (`vehicle_idvehicle`) REFERENCES `vehicle` (`idvehicle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla vehicles.inventory: ~0 rows (aproximadamente)

-- Volcando estructura para tabla vehicles.make
CREATE TABLE IF NOT EXISTS `make` (
  `idmake` int NOT NULL,
  `makename` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  PRIMARY KEY (`idmake`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla vehicles.make: ~0 rows (aproximadamente)

-- Volcando estructura para tabla vehicles.model
CREATE TABLE IF NOT EXISTS `model` (
  `idmodel` int NOT NULL,
  `modelname` varchar(500) NOT NULL,
  `firstproductionyear` int NOT NULL,
  PRIMARY KEY (`idmodel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla vehicles.model: ~0 rows (aproximadamente)

-- Volcando estructura para tabla vehicles.vehicle
CREATE TABLE IF NOT EXISTS `vehicle` (
  `idvehicle` int NOT NULL,
  `make_idmake` int NOT NULL,
  `model_idmodel` int NOT NULL,
  `year` int NOT NULL,
  PRIMARY KEY (`idvehicle`),
  KEY `fk_vehicle_make_idx` (`make_idmake`),
  KEY `fk_vehicle_model1_idx` (`model_idmodel`),
  CONSTRAINT `fk_vehicle_make` FOREIGN KEY (`make_idmake`) REFERENCES `make` (`idmake`),
  CONSTRAINT `fk_vehicle_model1` FOREIGN KEY (`model_idmodel`) REFERENCES `model` (`idmodel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla vehicles.vehicle: ~0 rows (aproximadamente)

-- Volcando estructura para tabla vehicles.vehicleincentive
CREATE TABLE IF NOT EXISTS `vehicleincentive` (
  `idvehicleincentive` int NOT NULL,
  PRIMARY KEY (`idvehicleincentive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla vehicles.vehicleincentive: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

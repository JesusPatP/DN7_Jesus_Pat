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


-- Volcando estructura de base de datos para sakila
CREATE DATABASE IF NOT EXISTS `sakila` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sakila`;

-- Volcando estructura para tabla sakila.actor
CREATE TABLE IF NOT EXISTS `actor` (
  `actor_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`actor_id`),
  KEY `idx_actor_last_name` (`last_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla sakila.actor: ~0 rows (aproximadamente)

-- Volcando estructura para vista sakila.actor_info
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `actor_info` (
	`actor_id` SMALLINT(5) UNSIGNED NOT NULL,
	`first_name` VARCHAR(45) NOT NULL COLLATE 'utf8mb3_general_ci',
	`last_name` VARCHAR(45) NOT NULL COLLATE 'utf8mb3_general_ci',
	`film_info` TEXT NULL COLLATE 'utf8mb3_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para tabla sakila.address
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(50) NOT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `district` varchar(20) NOT NULL,
  `city_id` smallint unsigned NOT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `idx_fk_city_id` (`city_id`),
  CONSTRAINT `fk_address_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla sakila.address: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sakila.category
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla sakila.category: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sakila.city
CREATE TABLE IF NOT EXISTS `city` (
  `city_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `country_id` smallint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`city_id`),
  KEY `idx_fk_country_id` (`country_id`),
  CONSTRAINT `fk_city_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla sakila.city: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sakila.country
CREATE TABLE IF NOT EXISTS `country` (
  `country_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla sakila.country: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sakila.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` tinyint unsigned NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address_id` smallint unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  KEY `idx_fk_store_id` (`store_id`),
  KEY `idx_fk_address_id` (`address_id`),
  KEY `idx_last_name` (`last_name`),
  CONSTRAINT `fk_customer_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_store` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Table storing all customers. Holds foreign keys to the address table and the store table where this customer is registered.\n\nBasic information about the customer like first and last name are stored in the table itself. Same for the date the record was created and when the information was last updated.';

-- Volcando datos para la tabla sakila.customer: ~0 rows (aproximadamente)

-- Volcando estructura para vista sakila.customer_list
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `customer_list` (
	`ID` SMALLINT(5) UNSIGNED NOT NULL,
	`name` VARCHAR(91) NULL COLLATE 'utf8mb3_general_ci',
	`address` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
	`zip code` VARCHAR(10) NULL COLLATE 'utf8mb3_general_ci',
	`phone` VARCHAR(20) NOT NULL COLLATE 'utf8mb3_general_ci',
	`city` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
	`country` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
	`notes` VARCHAR(6) NOT NULL COLLATE 'utf8mb3_general_ci',
	`SID` TINYINT(3) UNSIGNED NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla sakila.film
CREATE TABLE IF NOT EXISTS `film` (
  `film_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year DEFAULT NULL,
  `language_id` tinyint unsigned NOT NULL,
  `original_language_id` tinyint unsigned DEFAULT NULL,
  `rental_duration` tinyint unsigned NOT NULL DEFAULT '3',
  `rental_rate` decimal(4,2) NOT NULL DEFAULT '4.99',
  `length` smallint unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) NOT NULL DEFAULT '19.99',
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  `special_features` set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`film_id`),
  KEY `idx_title` (`title`),
  KEY `idx_fk_language_id` (`language_id`),
  KEY `idx_fk_original_language_id` (`original_language_id`),
  CONSTRAINT `fk_film_language` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_film_language_original` FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla sakila.film: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sakila.film_actor
CREATE TABLE IF NOT EXISTS `film_actor` (
  `actor_id` smallint unsigned NOT NULL,
  `film_id` smallint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`actor_id`,`film_id`),
  KEY `idx_fk_film_id` (`film_id`),
  KEY `fk_film_actor_actor_idx` (`actor_id`),
  CONSTRAINT `fk_film_actor_actor` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_film_actor_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla sakila.film_actor: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sakila.film_category
CREATE TABLE IF NOT EXISTS `film_category` (
  `film_id` smallint unsigned NOT NULL,
  `category_id` tinyint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`film_id`,`category_id`),
  KEY `fk_film_category_category_idx` (`category_id`),
  KEY `fk_film_category_film_idx` (`film_id`),
  CONSTRAINT `fk_film_category_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_film_category_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla sakila.film_category: ~0 rows (aproximadamente)

-- Volcando estructura para procedimiento sakila.film_in_stock
DELIMITER //
CREATE PROCEDURE `film_in_stock`(IN p_film_id INT, IN p_store_id INT, OUT p_film_count INT)
    READS SQL DATA
BEGIN
     SELECT inventory_id
     FROM inventory
     WHERE film_id = p_film_id
     AND store_id = p_store_id
     AND inventory_in_stock(inventory_id);

     SELECT FOUND_ROWS() INTO p_film_count;
END//
DELIMITER ;

-- Volcando estructura para vista sakila.film_list
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `film_list` (
	`FID` SMALLINT(5) UNSIGNED NULL,
	`title` VARCHAR(255) NULL COLLATE 'utf8mb3_general_ci',
	`description` TEXT NULL COLLATE 'utf8mb3_general_ci',
	`category` VARCHAR(25) NOT NULL COLLATE 'utf8mb3_general_ci',
	`price` DECIMAL(4,2) NULL,
	`length` SMALLINT(5) UNSIGNED NULL,
	`rating` ENUM('G','PG','PG-13','R','NC-17') NULL COLLATE 'utf8mb3_general_ci',
	`actors` TEXT NULL COLLATE 'utf8mb3_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para procedimiento sakila.film_not_in_stock
DELIMITER //
CREATE PROCEDURE `film_not_in_stock`(IN p_film_id INT, IN p_store_id INT, OUT p_film_count INT)
    READS SQL DATA
BEGIN
     SELECT inventory_id
     FROM inventory
     WHERE film_id = p_film_id
     AND store_id = p_store_id
     AND NOT inventory_in_stock(inventory_id);

     SELECT FOUND_ROWS() INTO p_film_count;
END//
DELIMITER ;

-- Volcando estructura para tabla sakila.film_text
CREATE TABLE IF NOT EXISTS `film_text` (
  `film_id` smallint unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`film_id`),
  FULLTEXT KEY `idx_title_description` (`title`,`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla sakila.film_text: ~0 rows (aproximadamente)

-- Volcando estructura para función sakila.get_customer_balance
DELIMITER //
CREATE FUNCTION `get_customer_balance`(p_customer_id INT, p_effective_date DATETIME) RETURNS decimal(5,2)
    READS SQL DATA
    DETERMINISTIC
BEGIN

       #OK, WE NEED TO CALCULATE THE CURRENT BALANCE GIVEN A CUSTOMER_ID AND A DATE
       #THAT WE WANT THE BALANCE TO BE EFFECTIVE FOR. THE BALANCE IS:
       #   1) RENTAL FEES FOR ALL PREVIOUS RENTALS
       #   2) ONE DOLLAR FOR EVERY DAY THE PREVIOUS RENTALS ARE OVERDUE
       #   3) IF A FILM IS MORE THAN RENTAL_DURATION * 2 OVERDUE, CHARGE THE REPLACEMENT_COST
       #   4) SUBTRACT ALL PAYMENTS MADE BEFORE THE DATE SPECIFIED

  DECLARE v_rentfees DECIMAL(5,2); #FEES PAID TO RENT THE VIDEOS INITIALLY
  DECLARE v_overfees INTEGER;      #LATE FEES FOR PRIOR RENTALS
  DECLARE v_payments DECIMAL(5,2); #SUM OF PAYMENTS MADE PREVIOUSLY

  SELECT IFNULL(SUM(film.rental_rate),0) INTO v_rentfees
    FROM film, inventory, rental
    WHERE film.film_id = inventory.film_id
      AND inventory.inventory_id = rental.inventory_id
      AND rental.rental_date <= p_effective_date
      AND rental.customer_id = p_customer_id;

  SELECT IFNULL(SUM(IF((TO_DAYS(rental.return_date) - TO_DAYS(rental.rental_date)) > film.rental_duration,
        ((TO_DAYS(rental.return_date) - TO_DAYS(rental.rental_date)) - film.rental_duration),0)),0) INTO v_overfees
    FROM rental, inventory, film
    WHERE film.film_id = inventory.film_id
      AND inventory.inventory_id = rental.inventory_id
      AND rental.rental_date <= p_effective_date
      AND rental.customer_id = p_customer_id;


  SELECT IFNULL(SUM(payment.amount),0) INTO v_payments
    FROM payment

    WHERE payment.payment_date <= p_effective_date
    AND payment.customer_id = p_customer_id;

  RETURN v_rentfees + v_overfees - v_payments;
END//
DELIMITER ;

-- Volcando estructura para tabla sakila.inventory
CREATE TABLE IF NOT EXISTS `inventory` (
  `inventory_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `film_id` smallint unsigned NOT NULL,
  `store_id` tinyint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`inventory_id`),
  KEY `idx_fk_film_id` (`film_id`),
  KEY `idx_store_id_film_id` (`store_id`,`film_id`),
  KEY `fk_inventory_store_idx` (`store_id`),
  CONSTRAINT `fk_inventory_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_inventory_store` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla sakila.inventory: ~0 rows (aproximadamente)

-- Volcando estructura para función sakila.inventory_held_by_customer
DELIMITER //
CREATE FUNCTION `inventory_held_by_customer`(p_inventory_id INT) RETURNS int
    READS SQL DATA
BEGIN
  DECLARE v_customer_id INT;
  DECLARE EXIT HANDLER FOR NOT FOUND RETURN NULL;

  SELECT customer_id INTO v_customer_id
  FROM rental
  WHERE return_date IS NULL
  AND inventory_id = p_inventory_id;

  RETURN v_customer_id;
END//
DELIMITER ;

-- Volcando estructura para función sakila.inventory_in_stock
DELIMITER //
CREATE FUNCTION `inventory_in_stock`(p_inventory_id INT) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
    DECLARE v_rentals INT;
    DECLARE v_out     INT;

    #AN ITEM IS IN-STOCK IF THERE ARE EITHER NO ROWS IN THE rental TABLE
    #FOR THE ITEM OR ALL ROWS HAVE return_date POPULATED

    SELECT COUNT(*) INTO v_rentals
    FROM rental
    WHERE inventory_id = p_inventory_id;

    IF v_rentals = 0 THEN
      RETURN TRUE;
    END IF;

    SELECT COUNT(rental_id) INTO v_out
    FROM inventory LEFT JOIN rental USING(inventory_id)
    WHERE inventory.inventory_id = p_inventory_id
    AND rental.return_date IS NULL;

    IF v_out > 0 THEN
      RETURN FALSE;
    ELSE
      RETURN TRUE;
    END IF;
END//
DELIMITER ;

-- Volcando estructura para tabla sakila.language
CREATE TABLE IF NOT EXISTS `language` (
  `language_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla sakila.language: ~0 rows (aproximadamente)

-- Volcando estructura para vista sakila.nicer_but_slower_film_list
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `nicer_but_slower_film_list` (
	`FID` SMALLINT(5) UNSIGNED NULL,
	`title` VARCHAR(255) NULL COLLATE 'utf8mb3_general_ci',
	`description` TEXT NULL COLLATE 'utf8mb3_general_ci',
	`category` VARCHAR(25) NOT NULL COLLATE 'utf8mb3_general_ci',
	`price` DECIMAL(4,2) NULL,
	`length` SMALLINT(5) UNSIGNED NULL,
	`rating` ENUM('G','PG','PG-13','R','NC-17') NULL COLLATE 'utf8mb3_general_ci',
	`actors` TEXT NULL COLLATE 'utf8mb3_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para tabla sakila.payment
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` smallint unsigned NOT NULL,
  `staff_id` tinyint unsigned NOT NULL,
  `rental_id` int DEFAULT NULL,
  `amount` decimal(5,2) NOT NULL,
  `payment_date` datetime NOT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `idx_fk_staff_id` (`staff_id`),
  KEY `idx_fk_customer_id` (`customer_id`),
  KEY `fk_payment_rental_idx` (`rental_id`),
  CONSTRAINT `fk_payment_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_rental` FOREIGN KEY (`rental_id`) REFERENCES `rental` (`rental_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla sakila.payment: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sakila.rental
CREATE TABLE IF NOT EXISTS `rental` (
  `rental_id` int NOT NULL AUTO_INCREMENT,
  `rental_date` datetime NOT NULL,
  `inventory_id` mediumint unsigned NOT NULL,
  `customer_id` smallint unsigned NOT NULL,
  `return_date` datetime DEFAULT NULL,
  `staff_id` tinyint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rental_id`),
  UNIQUE KEY `idx_rental` (`rental_date`,`inventory_id`,`customer_id`),
  KEY `idx_fk_inventory_id` (`inventory_id`),
  KEY `idx_fk_customer_id` (`customer_id`),
  KEY `idx_fk_staff_id` (`staff_id`),
  CONSTRAINT `fk_rental_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_inventory` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla sakila.rental: ~0 rows (aproximadamente)

-- Volcando estructura para procedimiento sakila.rewards_report
DELIMITER //
CREATE PROCEDURE `rewards_report`(
    IN min_monthly_purchases TINYINT UNSIGNED
    , IN min_dollar_amount_purchased DECIMAL(10,2) UNSIGNED
    , OUT count_rewardees INT
)
    READS SQL DATA
    COMMENT 'Provides a customizable report on best customers'
proc: BEGIN
    
    DECLARE last_month_start DATE;
    DECLARE last_month_end DATE;

    /* Some sanity checks... */
    IF min_monthly_purchases = 0 THEN
        SELECT 'Minimum monthly purchases parameter must be > 0';
        LEAVE proc;
    END IF;
    IF min_dollar_amount_purchased = 0.00 THEN
        SELECT 'Minimum monthly dollar amount purchased parameter must be > $0.00';
        LEAVE proc;
    END IF;

    /* Determine start and end time periods */
    SET last_month_start = DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH);
    SET last_month_start = STR_TO_DATE(CONCAT(YEAR(last_month_start),'-',MONTH(last_month_start),'-01'),'%Y-%m-%d');
    SET last_month_end = LAST_DAY(last_month_start);

    /* 
        Create a temporary storage area for 
        Customer IDs.  
    */
    CREATE TEMPORARY TABLE tmpCustomer (customer_id SMALLINT UNSIGNED NOT NULL PRIMARY KEY);

    /* 
        Find all customers meeting the 
        monthly purchase requirements
    */
    INSERT INTO tmpCustomer (customer_id)
    SELECT p.customer_id 
    FROM payment AS p
    WHERE DATE(p.payment_date) BETWEEN last_month_start AND last_month_end
    GROUP BY customer_id
    HAVING SUM(p.amount) > min_dollar_amount_purchased
    AND COUNT(customer_id) > min_monthly_purchases;

    /* Populate OUT parameter with count of found customers */
    SELECT COUNT(*) FROM tmpCustomer INTO count_rewardees;

    /* 
        Output ALL customer information of matching rewardees.
        Customize output as needed.
    */
    SELECT c.* 
    FROM tmpCustomer AS t   
    INNER JOIN customer AS c ON t.customer_id = c.customer_id;

    /* Clean up */
    DROP TABLE tmpCustomer;
END//
DELIMITER ;

-- Volcando estructura para vista sakila.sales_by_film_category
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `sales_by_film_category` (
	`category` VARCHAR(25) NOT NULL COLLATE 'utf8mb3_general_ci',
	`total_sales` DECIMAL(27,2) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista sakila.sales_by_store
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `sales_by_store` (
	`store` VARCHAR(101) NULL COLLATE 'utf8mb3_general_ci',
	`manager` VARCHAR(91) NULL COLLATE 'utf8mb3_general_ci',
	`total_sales` DECIMAL(27,2) NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla sakila.staff
CREATE TABLE IF NOT EXISTS `staff` (
  `staff_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address_id` smallint unsigned NOT NULL,
  `picture` blob,
  `email` varchar(50) DEFAULT NULL,
  `store_id` tinyint unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `username` varchar(16) NOT NULL,
  `password` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`staff_id`),
  KEY `idx_fk_store_id` (`store_id`),
  KEY `idx_fk_address_id` (`address_id`),
  CONSTRAINT `fk_staff_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_staff_store` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla sakila.staff: ~0 rows (aproximadamente)

-- Volcando estructura para vista sakila.staff_list
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `staff_list` (
	`ID` TINYINT(3) UNSIGNED NOT NULL,
	`name` VARCHAR(91) NULL COLLATE 'utf8mb3_general_ci',
	`address` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
	`zip code` VARCHAR(10) NULL COLLATE 'utf8mb3_general_ci',
	`phone` VARCHAR(20) NOT NULL COLLATE 'utf8mb3_general_ci',
	`city` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
	`country` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
	`SID` TINYINT(3) UNSIGNED NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla sakila.store
CREATE TABLE IF NOT EXISTS `store` (
  `store_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `manager_staff_id` tinyint unsigned NOT NULL,
  `address_id` smallint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `idx_unique_manager` (`manager_staff_id`),
  KEY `idx_fk_address_id` (`address_id`),
  CONSTRAINT `fk_store_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_store_staff` FOREIGN KEY (`manager_staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla sakila.store: ~0 rows (aproximadamente)

-- Volcando estructura para disparador sakila.del_film
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador sakila.ins_film
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador sakila.upd_film
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para vista sakila.actor_info
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `actor_info`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY INVOKER VIEW `actor_info` AS select `a`.`actor_id` AS `actor_id`,`a`.`first_name` AS `first_name`,`a`.`last_name` AS `last_name`,group_concat(distinct concat(`c`.`name`,': ',(select group_concat(`f`.`title` order by `f`.`title` ASC separator ', ') from ((`film` `f` join `film_category` `fc` on((`f`.`film_id` = `fc`.`film_id`))) join `film_actor` `fa` on((`f`.`film_id` = `fa`.`film_id`))) where ((`fc`.`category_id` = `c`.`category_id`) and (`fa`.`actor_id` = `a`.`actor_id`)))) order by `c`.`name` ASC separator '; ') AS `film_info` from (((`actor` `a` left join `film_actor` `fa` on((`a`.`actor_id` = `fa`.`actor_id`))) left join `film_category` `fc` on((`fa`.`film_id` = `fc`.`film_id`))) left join `category` `c` on((`fc`.`category_id` = `c`.`category_id`))) group by `a`.`actor_id`,`a`.`first_name`,`a`.`last_name`;

-- Volcando estructura para vista sakila.customer_list
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `customer_list`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `customer_list` AS select `cu`.`customer_id` AS `ID`,concat(`cu`.`first_name`,_utf8mb3' ',`cu`.`last_name`) AS `name`,`a`.`address` AS `address`,`a`.`postal_code` AS `zip code`,`a`.`phone` AS `phone`,`city`.`city` AS `city`,`country`.`country` AS `country`,if(`cu`.`active`,_utf8mb3'active',_utf8mb3'') AS `notes`,`cu`.`store_id` AS `SID` from (((`customer` `cu` join `address` `a` on((`cu`.`address_id` = `a`.`address_id`))) join `city` on((`a`.`city_id` = `city`.`city_id`))) join `country` on((`city`.`country_id` = `country`.`country_id`)));

-- Volcando estructura para vista sakila.film_list
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `film_list`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `film_list` AS select `film`.`film_id` AS `FID`,`film`.`title` AS `title`,`film`.`description` AS `description`,`category`.`name` AS `category`,`film`.`rental_rate` AS `price`,`film`.`length` AS `length`,`film`.`rating` AS `rating`,group_concat(concat(`actor`.`first_name`,_utf8mb3' ',`actor`.`last_name`) separator ', ') AS `actors` from ((((`category` left join `film_category` on((`category`.`category_id` = `film_category`.`category_id`))) left join `film` on((`film_category`.`film_id` = `film`.`film_id`))) join `film_actor` on((`film`.`film_id` = `film_actor`.`film_id`))) join `actor` on((`film_actor`.`actor_id` = `actor`.`actor_id`))) group by `film`.`film_id`,`category`.`name`;

-- Volcando estructura para vista sakila.nicer_but_slower_film_list
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `nicer_but_slower_film_list`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `nicer_but_slower_film_list` AS select `film`.`film_id` AS `FID`,`film`.`title` AS `title`,`film`.`description` AS `description`,`category`.`name` AS `category`,`film`.`rental_rate` AS `price`,`film`.`length` AS `length`,`film`.`rating` AS `rating`,group_concat(concat(concat(upper(substr(`actor`.`first_name`,1,1)),lower(substr(`actor`.`first_name`,2,length(`actor`.`first_name`))),_utf8mb3' ',concat(upper(substr(`actor`.`last_name`,1,1)),lower(substr(`actor`.`last_name`,2,length(`actor`.`last_name`)))))) separator ', ') AS `actors` from ((((`category` left join `film_category` on((`category`.`category_id` = `film_category`.`category_id`))) left join `film` on((`film_category`.`film_id` = `film`.`film_id`))) join `film_actor` on((`film`.`film_id` = `film_actor`.`film_id`))) join `actor` on((`film_actor`.`actor_id` = `actor`.`actor_id`))) group by `film`.`film_id`,`category`.`name`;

-- Volcando estructura para vista sakila.sales_by_film_category
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `sales_by_film_category`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `sales_by_film_category` AS select `c`.`name` AS `category`,sum(`p`.`amount`) AS `total_sales` from (((((`payment` `p` join `rental` `r` on((`p`.`rental_id` = `r`.`rental_id`))) join `inventory` `i` on((`r`.`inventory_id` = `i`.`inventory_id`))) join `film` `f` on((`i`.`film_id` = `f`.`film_id`))) join `film_category` `fc` on((`f`.`film_id` = `fc`.`film_id`))) join `category` `c` on((`fc`.`category_id` = `c`.`category_id`))) group by `c`.`name` order by `total_sales` desc;

-- Volcando estructura para vista sakila.sales_by_store
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `sales_by_store`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `sales_by_store` AS select concat(`c`.`city`,_utf8mb3',',`cy`.`country`) AS `store`,concat(`m`.`first_name`,_utf8mb3' ',`m`.`last_name`) AS `manager`,sum(`p`.`amount`) AS `total_sales` from (((((((`payment` `p` join `rental` `r` on((`p`.`rental_id` = `r`.`rental_id`))) join `inventory` `i` on((`r`.`inventory_id` = `i`.`inventory_id`))) join `store` `s` on((`i`.`store_id` = `s`.`store_id`))) join `address` `a` on((`s`.`address_id` = `a`.`address_id`))) join `city` `c` on((`a`.`city_id` = `c`.`city_id`))) join `country` `cy` on((`c`.`country_id` = `cy`.`country_id`))) join `staff` `m` on((`s`.`manager_staff_id` = `m`.`staff_id`))) group by `s`.`store_id` order by `cy`.`country`,`c`.`city`;

-- Volcando estructura para vista sakila.staff_list
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `staff_list`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `staff_list` AS select `s`.`staff_id` AS `ID`,concat(`s`.`first_name`,_utf8mb3' ',`s`.`last_name`) AS `name`,`a`.`address` AS `address`,`a`.`postal_code` AS `zip code`,`a`.`phone` AS `phone`,`city`.`city` AS `city`,`country`.`country` AS `country`,`s`.`store_id` AS `SID` from (((`staff` `s` join `address` `a` on((`s`.`address_id` = `a`.`address_id`))) join `city` on((`a`.`city_id` = `city`.`city_id`))) join `country` on((`city`.`country_id` = `country`.`country_id`)));

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

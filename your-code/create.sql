-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema test
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema car_company
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema car_company
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `car_company` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `car_company` ;

-- -----------------------------------------------------
-- Table `car_company`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_company`.`cars` (
  `vehicle_id` INT NOT NULL,
  `vehicle_vin` CHAR(17) NULL DEFAULT NULL,
  `vehicle_manufacturer` VARCHAR(20) NULL DEFAULT NULL,
  `vehicle_model` VARCHAR(10) NULL DEFAULT NULL,
  `vehicle_year` CHAR(4) NULL DEFAULT NULL,
  `vehicle_color` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`vehicle_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_company`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_company`.`customers` (
  `customer_id` VARCHAR(10) NOT NULL,
  `customer_name` VARCHAR(10) NULL DEFAULT NULL,
  `customer_phone` VARCHAR(10) NULL DEFAULT NULL,
  `customer_email` VARCHAR(20) NULL DEFAULT NULL,
  `customer_address` VARCHAR(20) NULL DEFAULT NULL,
  `customer_city` VARCHAR(10) NULL DEFAULT NULL,
  `customer_state_province` VARCHAR(10) NULL DEFAULT NULL,
  `customer_country` VARCHAR(10) NULL DEFAULT NULL,
  `customer_zip_postal_code` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_company`.`salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_company`.`salespersons` (
  `staff_id` VARCHAR(10) NOT NULL,
  `staff_name` VARCHAR(10) NULL DEFAULT NULL,
  `staff_store` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_company`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_company`.`invoices` (
  `invoice_number` INT NOT NULL,
  `invoice_date` DATE NULL DEFAULT NULL,
  `cars` INT NULL DEFAULT NULL,
  `customers` VARCHAR(10) NULL DEFAULT NULL,
  `salespersons` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_number`),
  INDEX `cars` (`cars` ASC) VISIBLE,
  INDEX `customers` (`customers` ASC) VISIBLE,
  INDEX `salespersons` (`salespersons` ASC) VISIBLE,
  CONSTRAINT `invoices_ibfk_1`
    FOREIGN KEY (`cars`)
    REFERENCES `car_company`.`cars` (`vehicle_id`)
    ON DELETE CASCADE,
  CONSTRAINT `invoices_ibfk_2`
    FOREIGN KEY (`customers`)
    REFERENCES `car_company`.`customers` (`customer_id`)
    ON DELETE CASCADE,
  CONSTRAINT `invoices_ibfk_3`
    FOREIGN KEY (`salespersons`)
    REFERENCES `car_company`.`salespersons` (`staff_id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
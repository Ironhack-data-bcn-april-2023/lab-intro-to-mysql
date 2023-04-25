SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `car_sales` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `car_sales` ;

CREATE TABLE IF NOT EXISTS `car_sales`.`cars` (
  `ID` INT(10) NOT NULL,
  `VIN` VARCHAR(17) NOT NULL,
  `Manufacturer` VARCHAR(20) NULL DEFAULT NULL,
  `Model` VARCHAR(20) NOT NULL,
  `Year` YEAR(4) NULL,
  `Color` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `VIN_UNIQUE` (`VIN` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `car_sales`.`customers` (
  `ID` INT(10) NOT NULL,
  `Customer ID` INT NOT NULL,
  `Name` VARCHAR(20) NOT NULL,
  `Phone` VARCHAR(30) NOT NULL,
  `Email` VARCHAR(30) NULL,
  `Adress` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State/Province` VARCHAR(45) NULL DEFAULT NULL,
  `Country` VARCHAR(20) NULL DEFAULT NULL,
  `Postal` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `car_sales`.`salespersons` (
  `ID` INT(10) NOT NULL,
  `Staff ID` INT(10) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `car_sales`.`invoices` (
  `ID` INT(10) NULL,
  `Invoice number` INT NOT NULL,
  `Date` VARCHAR(10) NOT NULL,
  `cars_ID` INT(10) NOT NULL,
  `customers_ID` INT(10) NOT NULL,
  `salespersons_ID` INT(10) NOT NULL,
  PRIMARY KEY (`cars_ID`, `customers_ID`, `salespersons_ID`),
  INDEX `fk_invoices_salespersons1_idx` (`salespersons_ID` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`customers_ID` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_cars`
    FOREIGN KEY (`cars_ID`)
    REFERENCES `car_sales`.`cars` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_salespersons1`
    FOREIGN KEY (`salespersons_ID`)
    REFERENCES `car_sales`.`salespersons` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_ID`)
    REFERENCES `car_sales`.`customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- 4. POPULATE


INSERT INTO cars VALUES
(0, "3K096I98581DHSNUP", "Volkswagen", "Tiguan", "2019", "Blue"),
(1, "ZM8G7BEUQZ97IH46V", "Peugeot", "Rifter", "2019", "Red"),
(2, "RKXVNNIHLVVZOUB4M", "Ford", "Fusion", "2018", "White"),
(3, "HKNDGS7CU31E9Z7JW", "Toyota", "RAV4", "2018", "Silver"),
(4, "DAM41UDN3CHU2WVF6", "Volvo", "V60", "2019", "Gray");



INSERT INTO customers VALUES


(0, "10001", "Pablo Picasso", "+34 636 17 63 82","", "Paseo de la Chopera, 14", "Madrid", "Madrid", "Spain", "28045"),
(1, "20001", "Abraham Lincoln", "+1 305 907 7086","", "120 SW 8th St", "Miami", "Florida", "United States", "33130"),
(2, "30001", "Napoléon Bonaparte", "+33 1 79 75 40 00","", "40 Rue du Colisée", "Paris", "Île-de-France", "France", "75008");

INSERT INTO salespersons VALUES
(0, 00001, "Petey Cruiser", "Madrid"),
(1, 00002, "Anna Sthesia", "Barcelona"),
(2, 00003, "Paul Molive", "Berlin"),
(3, 00004,  "Gail Forcewind", "Paris"),
(4, 00005, "Paige Turner", "Mimia"),
(5, 00006, "Bob Frapples", "Mexico City"),
(6, 00007, "Walter Melon", "Amsterdam"),
(7, 00008, "Shonda Leer", "São Paulo");

INSERT INTO invoices VALUES
(0, "852399038" , "22-08-2018" , 0 , 1 , 3),
(1, "731166526" , "31-12-2018" , 3 , 0 , 5),
(2, "271135104" , "22-01-2019" , 2 , 2 , 7);
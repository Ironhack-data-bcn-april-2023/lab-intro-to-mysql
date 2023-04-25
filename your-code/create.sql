CREATE SCHEMA IF NOT EXISTS `create_sql` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `create_sql` ;

-- -----------------------------------------------------
-- Table `create_sql`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `create_sql`.`Cars` (
  `ID` INT(15) NOT NULL,
  `car_VIN` VARCHAR(17) NOT NULL,
  `manufacturer` VARCHAR(20) NULL,
  `model` VARCHAR(20) NULL,
  `year` YEAR(4) NULL,
  `color` VARCHAR(10) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `car_VIN_UNIQUE` (`car_VIN` ASC) VISIBLE,
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `create_sql`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `create_sql`.`Customers` (
  `ID` INT(15) NOT NULL,
  `customer_id` INT NOT NULL,
  `customer_name` VARCHAR(30) NOT NULL,
  `phone_num` VARCHAR(20) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(20) NULL,
  `state_province` VARCHAR(20) NULL,
  `country` VARCHAR(20) NULL,
  `postal` VARCHAR(10) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `create_sql`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `create_sql`.`Salespersons` (
  `ID` INT(15) NOT NULL,
  `staff_id` INT(15) NOT NULL,
  `staff_name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `create_sql`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `create_sql`.`Invoices` (
  `ID` INT(15) NOT NULL,
  `invoice_num` INT NOT NULL,
  `date` DATE NOT NULL,
  `Salespersons_ID` INT(15) NOT NULL,
  `Cars_ID` INT(15) NOT NULL,
  `Customers_ID` INT(15) NOT NULL,
  PRIMARY KEY (`ID`, `Salespersons_ID`, `Cars_ID`, `Customers_ID`),
  UNIQUE INDEX `invoice_num_UNIQUE` (`invoice_num` ASC) VISIBLE,
  INDEX `fk_Invoices_Salespersons_idx` (`Salespersons_ID` ASC) VISIBLE,
  INDEX `fk_Invoices_Cars1_idx` (`Cars_ID` ASC) VISIBLE,
  INDEX `fk_Invoices_Customers1_idx` (`Customers_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Salespersons`
    FOREIGN KEY (`Salespersons_ID`)
    REFERENCES `create_sql`.`Salespersons` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Cars1`
    FOREIGN KEY (`Cars_ID`)
    REFERENCES `create_sql`.`Cars` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Customers1`
    FOREIGN KEY (`Customers_ID`)
    REFERENCES `create_sql`.`Customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

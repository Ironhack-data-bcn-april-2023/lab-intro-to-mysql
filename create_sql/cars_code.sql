CREATE DATABASE IF NOT EXISTS cars;
USE cars;
-- -----------------------------------------------------
-- Table `mydb`.`Cars2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`Cars2` (
  `VIN` INT NOT NULL,
  `Manufacturer` VARCHAR(20) NULL,
  `Model` VARCHAR(20) NULL,
  `Year` DATE NULL,
  `Color` VARCHAR(45) NULL,
  PRIMARY KEY (`VIN`),
  UNIQUE INDEX `VIN_UNIQUE` (`VIN` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customers2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`Customers2` (
  `Customer_id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Phone_number` VARCHAR(20) NULL,
  `Email` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State/Country` VARCHAR(45) NULL,
  `Zip_postal_code` INT NULL,
  PRIMARY KEY (`Customer_id`),
  UNIQUE INDEX `Customer_id_UNIQUE` (`Customer_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sales_person2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`Sales_person2` (
  `Staff_id` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Store_company` VARCHAR(45) NULL,
  PRIMARY KEY (`Staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Invoices2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`Invoices2` (
  `Invoice_number` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Car` VARCHAR(45) NOT NULL,
  `Customer` VARCHAR(45) NOT NULL,
  `Sales_person_Staff_id` INT NOT NULL,
  `Cars2_VIN` INT NOT NULL,
  `Customers2_Customer_id` INT NOT NULL,
  PRIMARY KEY (`Invoice_number`, `Sales_person_Staff_id`, `Cars2_VIN`, `Customers2_Customer_id`),
  INDEX `fk_Invoices_Sales_person1_idx` (`Sales_person_Staff_id` ASC) VISIBLE,
  UNIQUE INDEX `Invoice_number_UNIQUE` (`Invoice_number` ASC) VISIBLE,
  INDEX `fk_Invoices2_Cars21_idx` (`Cars2_VIN` ASC) VISIBLE,
  INDEX `fk_Invoices2_Customers21_idx` (`Customers2_Customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Sales_person1`
    FOREIGN KEY (`Sales_person_Staff_id`)
    REFERENCES `mydb`.`Sales_person2` (`Staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices2_Cars21`
    FOREIGN KEY (`Cars2_VIN`)
    REFERENCES `mydb`.`Cars2` (`VIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices2_Customers21`
    FOREIGN KEY (`Customers2_Customer_id`)
    REFERENCES `mydb`.`Customers2` (`Customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
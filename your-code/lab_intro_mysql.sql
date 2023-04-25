-- 1. CREATE DATABASE:

DROP DATABASE IF EXISTS lab_intro_mysql;
CREATE DATABASE IF NOT EXISTS lab_intro_mysql;
USE lab_intro_mysql;

-- 2. CREATE TABLES: 

CREATE TABLE IF NOT EXISTS cars  (
CarID varchar(25) PRIMARY KEY,
Manufacturer varchar(25),
Model varchar(10),
Year int,
Color varchar(10)
);

CREATE TABLE IF NOT EXISTS customers (
CustomerID int PRIMARY KEY,
Name varchar(50),
Phone_Number varchar(20),
Email varchar(50),
Address varchar(100),
City varchar(25),
State_Province varchar(25),
Country varchar(25),
Zip_Postal_Code varchar(10)
);

CREATE TABLE IF NOT EXISTS salespersons (
StaffID int PRIMARY KEY,
Name varchar(50),
Store varchar(50)
);

CREATE TABLE IF NOT EXISTS invoices (
Invoice_Number INT PRIMARY KEY,
Date date,
Car_ID varchar (25),
Customer_ID int, 
Staff_ID int
);

-- 3. ALTER TABLE:

ALTER TABLE	invoices
ADD FOREIGN KEY (Car_ID)
REFERENCES cars(CarID);

ALTER TABLE	invoices
ADD FOREIGN KEY (Customer_ID)
REFERENCES customers(CustomerID);

ALTER TABLE	invoices
ADD FOREIGN KEY (Staff_ID)
REFERENCES salespersons(StaffID);

-- 4. POPULATE
INSERT INTO cars(CarID, Manufacturer, Model, Year, Color)
VALUES 
("3K096I98581DHSNUP", "Volkswagen", "Tiguan", "2019", "Blue"),
("ZM8G7BEUQZ97IH46V", "Peugeot", "Rifter", "2019", "Red"),
("RKXVNNIHLVVZOUB4M", "Ford", "Fusion", "2018", "White"),
("HKNDGS7CU31E9Z7JW", "Toyota", "RAV4", "2018", "Silver"),
("DAM41UDN3CHU2WVF6", "Volvo", "V60", "2019", "Gray");

INSERT INTO customers(CustomerID, Name, Phone_Number, Email, Address, City, State_Province, Country, Zip_Postal_Code)
VALUES 
("10001", "Pablo Picasso", "+34 636 17 63 82", "-", "Paseo de la Chopera, 14", "Madrid", "Madrid", "Spain", "28045"),
("20001", "Abraham Lincoln", "+1 305 907 7086", "-", "120 SW 8th St", "Miami", "Florida", "United States", "33130" ),
("30001", "Napoléon Bonaparte", "+33 1 79 75 40 00", "-", "40 Rue du Colisée", "Paris", "Île-de-France	", "France", "75008");

INSERT INTO salespersons(StaffID, Name, Store)
VALUES 
("00001", "Petey Cruiser", "Madrid"),
("00002", "Anna Sthesia", "Barcelona"),
("00003", "Paul Molive", "Berlin"),
("00004", "Gail Forcewind", "Paris"),
("00005", "Paige Turner", "Mimia"),
("00006", "Bob Frapples", "Mexico City"),
("00007", "Walter Melon", "Amsterdam"),
("00008", "Shonda Leer", "São Paulo");

INSERT INTO invoices(Invoice_Number, Date, Car_ID, Customer_ID, Staff_ID)
VALUES 
("852399038", "2018-08-22", "3K096I98581DHSNUP", "10001", "00001"),
("731166526", "2018-12-31", "ZM8G7BEUQZ97IH46V", "20001", "00002"),
("271135104", "2019-01-22", "RKXVNNIHLVVZOUB4M", "30001", "00003");







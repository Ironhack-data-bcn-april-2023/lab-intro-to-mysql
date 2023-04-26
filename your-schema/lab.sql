-- 1. CREATE DATABASE
DROP DATABASE IF EXISTS test;
CREATE DATABASE IF NOT EXISTS test;
USE test;

-- 2. TABLES
-- 2.1 Car
CREATE TABLE IF NOT EXISTS car (
		VIN_no VARCHAR(17) PRIMARY KEY NOT NULL UNIQUE, -- PK / NN
    manufacturer VARCHAR (15) NOT NULL, -- NN
    car_model VARCHAR(20) NOT NULL, -- NN
    year YEAR NULL, 
    color VARCHAR(10) NULL 
    
);

-- 2.2 Sales Person
CREATE TABLE IF NOT EXISTS sales (
		staff_id INT PRIMARY KEY NOT NULL, -- PK
    s_name VARCHAR(30) NOT NULL UNIQUE, -- NN / U
    store VARCHAR(15) NULL UNIQUE -- U 

);


-- 2.3 Customer Person
CREATE TABLE IF NOT EXISTS customer (
		customer_id INT PRIMARY KEY NOT NULL, -- PK / NN
	c_name VARCHAR(20) NOT NULL, -- NN
	phone_no VARCHAR(20) NULL, 
	email VARCHAR(30) NULL, 
	adress VARCHAR(40) NULL, 
	city VARCHAR(15) NULL, 
	state_province VARCHAR(15) NULL, 
	country VARCHAR(15) NULL, 
	zip_postal VARCHAR(10) NULL 

  );
  
-- 2.4 Invoices

CREATE TABLE IF NOT EXISTS invoices (
		invoice_no INT PRIMARY KEY NOT NULL, -- PK / NN
	date DATE NULL,
	car VARCHAR(17) NOT NULL, 
	customer INT NOT NULL,
	sales_person INT NOT NULL

);

-- 3. ALTER TABLE

ALTER TABLE	invoices
	ADD FOREIGN KEY (car)
REFERENCES car(VIN_no)
ON DELETE CASCADE;
  
  ALTER TABLE	invoices
	ADD FOREIGN KEY (customer)
REFERENCES customer(customer_id)
ON DELETE CASCADE;

  ALTER TABLE	invoices
	ADD FOREIGN KEY (sales_person)
REFERENCES sales(staff_id)
ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS invoices_company (
	customer_id INT,
    invoice_no INT,
    PRIMARY KEY(customer_id, invoice_no),
		FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
        FOREIGN KEY (invoice_no) REFERENCES invoices(invoice_no)
);



-- 4. POPULATE
INSERT INTO car(VIN_no, manufacturer, car_model, year, color) -- CAR
VALUES 
("3K096I98581DHSNUP", "Volkswagen", "Tiguan", "2019", "Blue"),
("ZM8G7BEUQZ97IH46V", "Peugeot", "Rifter", "2019", "Red"),
("RKXVNNIHLVVZOUB4M", "Ford", "Fusion", "2018", "White"),
("HKNDGS7CU31E9Z7JW", "Toyota", "RAV4", "2018", "Silver"),
("DAM41UDN3CHU2WVF6", "Volvo", "V60", "2019", "Gray");
-- ("DAM41UDN3CHU2WVF6", "Volvo", "V60 Cross Country", "2019", "Blue"); -- stucked :(

INSERT INTO sales(staff_id, s_name, store) -- SALES
VALUES 
(00001, "Petey Cruiser", "Madrid"),
(00002, "Anna Sthesia", "Barcelona"),
(00003, "Paul Molive", "Berlin"),
(00004, "Gail Forcewind", "Paris"),
(00005, "Paige Turner", "Mimia"),
(00006, "Bob Frapples", "Mexico City"),
(00007, "Walter Melon", "Amsterdam"),
(00008, "Shonda Leer", "São Paulo");


INSERT INTO customer(customer_id, c_name, phone_no, email, adress, city, state_province, country, zip_postal) -- CUSTOMER
VALUES 
("10001", "Pablo Picasso", "+34 636 17 63 82", "-", "Paseo de la Chopera, 14", "Madrid", "Madrid", "Spain", "28045"),
("20001", "Abraham Lincoln", "+1 305 907 7086", "-", "120 SW 8th St", "Miami", "Florida", "United States", "33130"),
("30001", "Napoléon Bonaparte", "+33 1 79 75 40 00", "-", "40 Rue du Colisée", "Paris", "Île-de-France", "France", "75008");


INSERT INTO invoices (invoice_no, date, car, customer, sales_person)
VALUES 
(1, '2023-04-26', '3K096I98581DHSNUP', 10001, 00001);
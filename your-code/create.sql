DROP DATABASE IF EXISTS lab_mysql;
CREATE DATABASE IF NOT EXISTS lab_mysql;
USE lab_mysql;

CREATE TABLE IF NOT EXISTS cars(
	id INT PRIMARY KEY,
    vin VARCHAR(50),
    manufacturer VARCHAR(20),
    model VARCHAR(30),
    year INT,
    color VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS customers(
	id INT PRIMARY KEY,
    customer_id INT,
    name VARCHAR(25),
    phone VARCHAR(25),
    email VARCHAR(15),
    address VARCHAR(25),
    city VARCHAR(15),
    state_province VARCHAR(20),
    country VARCHAR(20),
    postal VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS sales_person(
	id INT PRIMARY KEY,
    staff_id VARCHAR(10),
    name VARCHAR(25), 
    store VARCHAR(25)
);

CREATE TABLE IF NOT EXISTS invoices(
	id INT PRIMARY KEY,
    invoice_number INT,
    date DATE,
    cars INT,
    customers INT,
    sales_person INT
);

ALTER TABLE invoices
	ADD FOREIGN KEY (cars)
REFERENCES cars(id)
ON DELETE SET NULL;

ALTER TABLE invoices
	ADD FOREIGN KEY (customers)
REFERENCES customers(id)
ON DELETE SET NULL;

ALTER TABLE invoices
	ADD FOREIGN KEY (sales_person)
REFERENCES sales_person(id)
ON DELETE SET NULL;

INSERT INTO cars VALUES
(0, "3K096I98581DHSNUP", "Volkswagen", "Tiguan", 2019, "Blue"),
(1, "ZM8G7BEUQZ97IH46V", "Peugeot", "Rifter", 2019,	"Red"),
(2, "RKXVNNIHLVVZOUB4M", "Ford", "Fusion", 2018, "White"),
(3, "HKNDGS7CU31E9Z7JW", "Toyota", "RAV4", 2018, "Silver"),
(4, "DAM41UDN3CHU2WVF6", "Volvo", "V60", 2019, "Gray"),
(5, "DAM41UDN3CHU2WVF6", "Volvo", "V60 Cross Country", 2019, "Gray");

INSERT INTO customers VALUES
(0,	10001,	"Pablo Picasso", "+34 636 17 63 82", "-", "Paseo de la Chopera, 14", "Madrid", "Madrid", "Spain", "28045"),
(1,	20001,	"Abraham Lincoln", "+1 305 907 7086", "-", "120 SW 8th St", "Miami", "Florida", "United States", "33130"),
(2,	30001,	"Napoléon Bonaparte", "+33 1 79 75 40 00", "-", "40 Rue du Colisée", "Paris", "Île-de-France", "France", "75008");

INSERT INTO sales_person VALUES
(0, "00001", "Petey Cruiser", "Madrid"),
(1, "00002", "Anna Sthesia", "Barcelona"),
(2, "00003", "Paul Molive", "Berlin"),
(3, "00004", "Gail Forcewind", "Paris"),
(4, "00005", "Paige Turner", "Mimia"),
(5, "00006", "Bob Frapples", "Mexico City"),
(6, "00007", "Walter Melon", "Amsterdam"),
(7, "00008", "Shonda Leer", "São Paulo");

INSERT INTO invoices VALUES
(0, 852399038, "22-08-2018", 0, 1, 3),
(1, 731166526, "31-12-2018", 3, 0, 5),
(2, 271135104, "22-01-2019", 2, 2, 7);
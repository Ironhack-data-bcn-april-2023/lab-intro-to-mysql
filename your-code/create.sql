DROP DATABASE dealership;
CREATE DATABASE IF NOT EXISTS dealership;
USE dealership;

CREATE TABLE IF NOT EXISTS cars (
id INT AUTO_INCREMENT PRIMARY KEY,
vin VARCHAR(17),
manufacturer VARCHAR(10),
model VARCHAR(20),
year YEAR,
color VARCHAR(15)
) AUTO_INCREMENT=1; 

CREATE TABLE IF NOT EXISTS customers (
id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT UNIQUE,
customer_name VARCHAR(30),
phone_no VARCHAR(20),
email VARCHAR(20),
address VARCHAR(60),
city VARCHAR(20),
state VARCHAR (15),
country VARCHAR(15),
postal_code VARCHAR(10)
) AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS salespersons(
id INT AUTO_INCREMENT PRIMARY KEY,
staff_id INT(5) zerofill,
staff_name VARCHAR(30),
store VARCHAR(15)
) AUTO_INCREMENT=1; 

CREATE TABLE IF NOT EXISTS invoices(
id INT AUTO_INCREMENT PRIMARY KEY,
invoice_number INT UNIQUE,
date_purchase VARCHAR(10),
car INT,
customer INT,
salesperson INT
) AUTO_INCREMENT=1;

alter table invoices
ADD FOREIGN KEY (car)
REFERENCES cars(id);

alter table invoices
ADD FOREIGN KEY(customer)
REFERENCES customers(id);

alter table invoices
ADD FOREIGN KEY (salesperson)
REFERENCES salespersons(id);
DROP DATABASE IF EXISTS lab_intro_sql;
CREATE DATABASE IF NOT EXISTS lab_intro_sql;
USE lab_intro_sql;

CREATE TABLE IF NOT EXISTS car (car_id INT PRIMARY KEY,
color VARCHAR(15),
model VARCHAR(10) NOT NULL,
year_model int(4),
car_dealer INT
);

CREATE TABLE IF NOT EXISTS customer (
customer_id INT PRIMARY KEY,
client_name VARCHAR(20),
address VARCHAR(40),
office_no INT
);

CREATE TABLE IF NOT EXISTS seller (
seller_id INT PRIMARY KEY,
name VARCHAR(30),
car_sold_id INT,
phone_no VARCHAR(20),
client INT -- this will be a FK from client table
);

CREATE TABLE IF NOT EXISTS invoice (
invoice_id INT PRIMARY KEY,
sold_by INT,
car_sold INT,
txn_date DATE,
dealership INT,
buyer INT
);

 
AlTER TABLE seller
ADD FOREIGN KEY (car_sold_id)
REFERENCES car(car_id),
ADD FOREIGN KEY (client)
REFERENCES customer(customer_id);

ALTER TABLE invoice
ADD FOREIGN KEY (sold_by)
REFERENCES seller(seller_id),
ADD FOREIGN KEY (car_sold)
REFERENCES car(car_id),
ADD FOREIGN KEY (buyer)
REFERENCES customer(customer_id);

INSERT INTO car(car_id, color, model, year_model, car_dealer)
VALUES (1, "Yellow", "skv", 2024, 55);

INSERT INTO customer(customer_id, client_name, address, office_no)
VALUES (100, "Ramses", "calle Barcelona", 55);

 INSERT INTO seller(seller_id, name, car_sold_id, phone_no, client)
VALUES (75, "Paul", "1", 5548026407, 100);

INSERT INTO invoice(invoice_id, sold_by, car_sold, txn_date, dealership, buyer)
VALUES (80, 75, 1, "2024-04-25", 55, 100);
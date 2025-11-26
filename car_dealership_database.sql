DROP DATABASE if exists dealership_database;
CREATE DATABASE if not exists dealership_database;

USE dealership_database;

drop table if exists dealerships;
drop table if exists vehicles;
drop table if exists inventory;
drop table if exists sales_contracts;
drop table if exists lease_contracts;

create table dealerships (
dealership_id INT auto_increment PRIMARY KEY,
dealership_name VARCHAR(50),
address VARCHAR(50),
phone VARCHAR(12)
);

create table vehicles (
VIN INT PRIMARY KEY,
SOLD VARCHAR(50),
sale_type VARCHAR(10) DEFAULT 'Sale',
make VARCHAR(50),
model VARCHAR(50)
);

create table inventory (
dealership_id INT,
VIN INT
);

create table sales_contracts (
VIN INT,
saleID INT auto_increment primary key,
sale_date DATE,
customer_first_name VARCHAR(50),
customer_last_name VARCHAR(50),
customer_phone VARCHAR(12),
price INT,
sale_type VARCHAR(10) DEFAULT 'Sale'
);

create table lease_contracts (
VIN INT,
leaseID INT auto_increment primary key,
sale_date DATE,
customer_first_name VARCHAR(50),
customer_last_name VARCHAR(50),
customer_phone VARCHAR(12),
monthly_price INT,
contract_duration_months INT,
sale_type VARCHAR(10) DEFAULT 'Lease'
);

INSERT INTO dealerships (dealership_name, address, phone) VALUES
('Premium Auto Sales', '123 Main St, Boston MA', '617-555-0101'),
('Elite Motors', '456 Oak Ave, Austin TX', '512-555-0202'),
('Coastal Car Center', '789 Beach Blvd, Miami FL', '305-555-0303'),
('Mountain View Autos', '321 Hill Rd, Denver CO', '303-555-0404');

INSERT INTO vehicles (VIN, SOLD, sale_type, make, model) VALUES
(10001, 'YES', 'Sale', 'Toyota', 'Camry'),
(10002, 'NO', null, 'Honda', 'Accord'),
(10003, 'YES', 'Sale', 'Ford', 'F-150'),
(10004, 'NO', null, 'Tesla', 'Model 3'),
(10005, 'YES', 'Lease', 'BMW', '3 Series'),
(10006, 'YES', 'Lease', 'Mercedes', 'C-Class'),
(10007, 'YES', 'Sale', 'Toyota', 'RAV4');


INSERT INTO inventory (dealership_id, VIN) VALUES
(1, 10001),
(1, 10002),
(2, 10003),
(3, 10004),
(3, 10005),
(4, 10006),
(2, 10007);

INSERT INTO sales_contracts (VIN, sale_date, customer_first_name, customer_last_name, customer_phone, price) VALUES
(10001, "2024-08-21", 'John', 'Smith', '617-555-1001', 28500),
(10003, "2025-01-03", 'Sarah', 'Johnson', '512-555-1002', 45000),
(10007, "2025-08-16", 'Bill', 'Nye', '636-515-4502', 12500);


INSERT INTO lease_contracts (VIN, sale_date, customer_first_name, customer_last_name, customer_phone, monthly_price, contract_duration_months) VALUES
(10005, "2025-10-30", 'Michael', 'Brown', '305-555-2001', 450, 36),
(10006, "2025-05-06", 'Emily', 'Davis', '303-555-2002', 520, 24);




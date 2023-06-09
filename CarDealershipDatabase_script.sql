USE sys;

/***********************
STEP 1: CREATE DATABASE
***********************/

DROP DATABASE IF EXISTS cardealership;

CREATE DATABASE cardealership;

USE cardealership;

/*********************
STEP 2: CREATE TABLES
*********************/

CREATE TABLE dealerships (
  dealership_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50),
  address VARCHAR(50),
  phone VARCHAR(12),
  PRIMARY KEY(dealership_id)
);

CREATE TABLE vehicles (
  VIN VARCHAR(17),
  vehicle_type VARCHAR(20),
  vehicle_make VARCHAR(10),
  vehicle_model VARCHAR(10),
  vehicle_color VARCHAR(10),
  vehicle_year VARCHAR(4),
  vehicle_price DECIMAL(10,2),
  vehicle_odometer INT,
  sold BOOLEAN,
  PRIMARY KEY(VIN)
);

CREATE TABLE inventory (
  dealership_id INT,
  VIN VARCHAR(17),
  FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
  FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

CREATE TABLE sales_contracts (
  sale_id INT NOT NULL AUTO_INCREMENT,
  VIN VARCHAR(17),
  sale_date DATETIME,
  customer_firstName VARCHAR(10),
  customer_lastName VARCHAR(10),
  customer_phone VARCHAR(12),
  customer_email VARCHAR(30),
  sale_tax DECIMAL (10,2),
  sale_price DECIMAL (10,2),
  sale_payment DECIMAL(10,2),
  PRIMARY KEY (sale_id),
  FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

CREATE TABLE lease_contracts (
  lease_id INT NOT NULL AUTO_INCREMENT,
  VIN VARCHAR(17),
  lease_date DATETIME,
  lease_lenght INT,  -- count by month.
  customer_firstName VARCHAR(10),
  customer_lastName VARCHAR(10),
  customer_phone VARCHAR(12),
  customer_email VARCHAR(30),
  lease_price DECIMAL(10,2),
  lease_payment DECIMAL(10,2),
  PRIMARY KEY (lease_id),
  FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

/****************************
STEP 3: POPULATE SAMPLE DATA
****************************/

-- Sample data for dealerships table
INSERT INTO dealerships (name, address, phone)
VALUES
  ('ABC Motors', '123 Main Street', '555-1234'),
  ('XYZ Auto', '456 Elm Street', '555-5678'),
  ('123 Cars', '789 Oak Street', '555-9012');

-- Sample data for vehicles table
INSERT INTO vehicles (VIN, vehicle_type, vehicle_make, vehicle_model, vehicle_color, vehicle_year, vehicle_price, vehicle_odometer, sold)
VALUES
  ('1HGCM82633A123456', 'Sedan', 'Honda', 'Accord', 'Blue', '2010', 15000.00, 50000, TRUE),
  ('5LMFU28575LJ12345', 'SUV', 'Lincoln', 'Navigator', 'Black', '2022', 55000.00, 10000, TRUE),
  ('WBAVL1C59EVR12345', 'Sedan', 'BMW', '328i', 'White', '2014', 20000.00, 80000, FALSE),
  ('2HGCM82633A123476', 'Sedan', 'Honda', 'Accord', 'Blue', '2010', 15000.00, 50000, FALSE),
  ('7LMFU28575LJ12382', 'SUV', 'Lincoln', 'Navigator', 'Black', '2022', 55000.00, 10000, FALSE),
  ('ABAVL1C59EVR12423', 'Sedan', 'BMW', '328i', 'White', '2014', 20000.00, 80000, FALSE),
  ('JHLRD78835C123456', 'SUV', 'Honda', 'CR-V', 'Silver', '2015', 18000.00, 60000, FALSE),
  ('3MZBN1U70HM123456', 'Sedan', 'Mazda', 'Mazda3', 'Red', '2017', 16000.00, 40000, FALSE);

-- Sample data for inventory table
INSERT INTO inventory (dealership_id, VIN)
VALUES
  (1, '1HGCM82633A123456'),
  (2, '5LMFU28575LJ12345'),
  (3, 'WBAVL1C59EVR12345'),
  (2, '2HGCM82633A123476'),
  (1, '7LMFU28575LJ12382'),
  (3, 'ABAVL1C59EVR12423'),
  (3, 'JHLRD78835C123456'),
  (2, '3MZBN1U70HM123456');

-- Sample data for sales_contracts table
INSERT INTO sales_contracts (VIN, sale_date, customer_firstName, customer_lastName, customer_phone, customer_email, sale_tax, sale_price, sale_payment)
VALUES
  ('1HGCM82633A123456', '2023-06-01', 'John', 'Doe', '555-1111', 'john.doe@example.com', 500.00, 15500.00, 15500.00),
  ('5LMFU28575LJ12345', '2023-06-02', 'Jane', 'Smith', '555-2222', 'jane.smith@example.com', 1000.00, 56000.00, 40000.00);

-- Sample data for lease_contracts table
INSERT INTO lease_contracts (VIN, lease_date, lease_lenght, customer_firstName, customer_lastName, customer_phone, customer_email, lease_price, lease_payment)
VALUES
  ('WBAVL1C59EVR12345', '2023-06-03', 36, 'David', 'Johnson', '555-3333', 'david.johnson@example.com', 25000.00, 500.00);
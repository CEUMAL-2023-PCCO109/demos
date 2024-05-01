DROP DATABASE IF EXISTS 2a_admin_05022024DB;
CREATE DATABASE IF NOT EXISTS 2a_admin_05022024DB;

USE 2a_admin_05022024DB;

-- 1) Defining a single-column primary key example
CREATE TABLE IF NOT EXISTS products(
   id INT PRIMARY KEY,
   name VARCHAR(255) NOT NULL
);

INSERT INTO products (id, name) 
VALUES 
	(1, 'Laptop'),
    (2, 'Smartphone'),
    (3, 'Wireless Headphones');
    
INSERT INTO products (id, name) 
VALUES 
	(1, 'Bluetooth Speaker');

-- 2) Defining a single-column primary key with AUTO_INCREMENT attribute example
DROP TABLE products; 

CREATE TABLE IF NOT EXISTS products(
   id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(255) NOT NULL
);

INSERT INTO products (name) 
VALUES 
    ('Laptop'),
    ('Smartphone'),
    ('Wireless Headphones');

INSERT INTO products (name) 
VALUES 
	('Bluetooth Speaker');
    
SELECT * FROM products;

-- 3) Defining a multi-column primary key example
CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE faviorites(
    customer_id INT,
    product_id INT,
    favorite_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(customer_id, product_id)
);

INSERT INTO faviorites (customer_id, product_id)
VALUES (1, 1);

-- 4) Adding a primary key to a table example
SET sql_generate_invisible_primary_key=OFF; 
CREATE TABLE tags(
    id INT,
    name VARCHAR(25) NOT NULL
);

SHOW CREATE TABLE tags;

ALTER TABLE tags
ADD PRIMARY KEY (id);

-- 4) Removing the primary key from a table
ALTER TABLE tags
DROP PRIMARY KEY;
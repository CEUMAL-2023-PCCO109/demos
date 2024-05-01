USE 2a_admin_05022024DB;

-- MySQL UNIQUE constraint example
CREATE TABLE IF NOT EXISTS suppliers (
    supplier_id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (supplier_id),
    CONSTRAINT uc_name_address UNIQUE (name,address)
);

INSERT INTO suppliers(name, phone, address) 
VALUES( 'ABC Inc', '(408)-908-2476', '4000 North 1st Street');
       
INSERT INTO suppliers(name, phone, address) 
VALUES( 'XYZ Corporation','(408)-908-2476','3000 North 1st Street');

INSERT INTO suppliers(name, phone, address) 
VALUES( 'ABC Inc', '(408)-908-1111', '4000 North 1st Street');

-- MySQL UNIQUE constraint & NULL
CREATE TABLE IF NOT EXISTS contacts(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20) UNIQUE
);

INSERT INTO contacts(name, phone)
VALUES
   ('Alice','(408)-102-2456'),
   ('John', NULL),
   ('Jane', NULL); 

SELECT * FROM contacts;

-- MySQL UNIQUE constraints and indexes
SHOW CREATE TABLE suppliers;
SHOW INDEX FROM suppliers;

-- Drop a unique constraint
DROP INDEX uc_name_address ON suppliers;
SHOW INDEX FROM suppliers;

-- Add new unique constraint
ALTER TABLE suppliers
ADD CONSTRAINT uc_name_address 
UNIQUE (name,address);

SHOW CREATE TABLE suppliers;
SHOW INDEX FROM suppliers;
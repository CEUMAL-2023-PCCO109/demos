USE 2a_admin_05022024DB;

-- 1) Creating CHECK constraints as column constraints
CREATE TABLE IF NOT EXISTS parts (
    part_no VARCHAR(18) PRIMARY KEY,
    description VARCHAR(40),
    cost DECIMAL(10,2 ) NOT NULL CHECK (cost >= 0),
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0)
);

SHOW CREATE TABLE parts;

INSERT INTO parts(part_no, description,cost,price) 
VALUES('A-001','Cooler',0,-100);

-- 2) Creating CHECK constraints as a table constraints
DROP TABLE IF EXISTS parts;

CREATE TABLE IF NOT EXISTS parts (
    part_no VARCHAR(18) PRIMARY KEY,
    description VARCHAR(40),
    cost DECIMAL(10,2 ) NOT NULL CHECK (cost >= 0),
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    CONSTRAINT parts_chk_price_gt_cost 
        CHECK(price >= cost)
);

SHOW CREATE TABLE parts;

INSERT INTO parts(part_no, description,cost,price) 
VALUES('A-001','Cooler',200,100);

-- Adding a check constraint to a table
ALTER TABLE parts
ADD CHECK (part_no <> description);

INSERT INTO parts 
VALUES('A','A',100,120);

-- Removing a check constraint from a table
SHOW CREATE TABLE parts;

ALTER TABLE parts
DROP CHECK parts_chk_3;

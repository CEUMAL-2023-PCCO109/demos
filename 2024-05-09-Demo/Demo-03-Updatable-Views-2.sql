USE classicmodels;

DROP TABLE IF EXISTS items;
DROP VIEW IF EXISTS LuxuryItems;

-- create a new table named items
CREATE TABLE items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(11 , 2 ) NOT NULL
);

-- insert data into the items table
INSERT INTO items(name,price) 
VALUES('Laptop',700.56),('Desktop',699.99),('iPad',700.50) ;

-- return all items from items table
SELECT * FROM items;

-- create a view based on items table
CREATE OR REPLACE VIEW LuxuryItems AS
    SELECT 
        *
    FROM
        items
    WHERE
        price > 700;
        
-- query data from the LuxuryItems view
SELECT 
    *
FROM
    LuxuryItems;

-- remove data from the LuxuryItems view
DELETE FROM LuxuryItems 
WHERE
    id = 3;

-- query data from the LuxuryItems view
SELECT 
    *
FROM
    LuxuryItems;
 
-- query the data in table 
SELECT 
    *
FROM
    items;

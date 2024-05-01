USE 2a_admin_05022024DB;

-- MySQL DEFAULT constraint example
CREATE TABLE IF NOT EXISTS cart_items 
(
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    price DEC(5,2) NOT NULL,
    sales_tax DEC(5,2) NOT NULL DEFAULT 0.1,
    CHECK(quantity > 0),
    CHECK(sales_tax >= 0) 
);

DESC cart_items;

INSERT INTO cart_items(name, quantity, price)
VALUES('Keyboard', 1, 50);

SELECT * FROM cart_items;

INSERT INTO cart_items(name, quantity, price, sales_tax)
VALUES('Battery',4, 0.25 , DEFAULT);

SELECT * FROM cart_items;

-- Adding a DEFAULT constraint to a column
ALTER TABLE cart_items
ALTER COLUMN quantity SET DEFAULT 1;

DESC cart_items;

INSERT INTO cart_items(name, price, sales_tax)
VALUES('Maintenance services',25.99, 0);

SELECT * FROM cart_items;

-- Removing a DEFAULT constraint from a column
ALTER TABLE cart_items
ALTER COLUMN quantity DROP DEFAULT;

DESC cart_items;
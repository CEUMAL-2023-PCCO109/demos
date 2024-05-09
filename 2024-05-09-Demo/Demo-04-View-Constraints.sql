USE classicmodels;

-- insert into LuxuryItems view, item watch will not display on LuxuryItems view
INSERT INTO LuxuryItems(name, price) 
VALUES('Phone', 720.00), ('Watch', 680.50) ;

SELECT * FROM items;

-- update data via LuxuryItems view, item id 1 price will change and will not display anymore on LuxuryItems view
UPDATE LuxuryItems 
SET 
    price = 600.00
WHERE
    id = 1;

SELECT * FROM items;

-- Recreate LuxuryItems view to enable check option.
CREATE OR REPLACE VIEW LuxuryItems AS
    SELECT 
        *
    FROM
        items
    WHERE
        price > 700
WITH CHECK OPTION;

-- Prevent insert to LuxuryItems since price for item is not > 700
INSERT INTO LuxuryItems(name, price) 
VALUES('Bag', 680.50) ;

-- Prevent update of LuxuryItem id 4 since price sets for item is not > 700
UPDATE LuxuryItems 
SET 
    price = 600.00
WHERE
    id = 4;

-- query data from the LuxuryItems view
SELECT 
    *
FROM
    LuxuryItems;
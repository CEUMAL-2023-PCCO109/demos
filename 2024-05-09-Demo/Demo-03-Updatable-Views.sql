USE classicmodels;

-- Create the view
CREATE OR REPLACE VIEW officeInfo
 AS 
   SELECT officeCode, phone, city
   FROM offices;

-- Display from view   
SELECT * FROM officeInfo;

-- Update via view
UPDATE officeInfo 
SET 
    phone = '+33 14 723 5555'
WHERE
    officeCode = 4;
    
-- Display from view       
SELECT * FROM officeInfo;
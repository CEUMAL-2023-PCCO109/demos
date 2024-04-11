use classicmodels;

-- Get existing
SELECT 
	employeeNumber,
    firstname, 
    lastname, 
    email
FROM
    employees_new
WHERE
    employeeNumber = 1056;
 
-- Execute update
UPDATE employees_new
SET 
    email = 'mary.patterson@classicmodelcars.com'
WHERE
    employeeNumber = 1056;

-- Verify update    
SELECT 
    firstname, 
    lastname, 
    email
FROM
    employees_new
WHERE
    employeeNumber = 1056;
    
-- Update multiple column
UPDATE employees 
SET 
    lastname = 'Hill',
    email = 'mary.hill@classicmodelcars.com'
WHERE
    employeeNumber = 1056;
    
-- Verify update
SELECT 
	employeeNumber,
    firstname, 
    lastname, 
    email
FROM
    employees
WHERE
    employeeNumber = 1056;
    
-- Update multiple rows
UPDATE employees_new
SET email = REPLACE(email,'@classicmodelcars.com','@cars.org')
WHERE
   jobTitle = 'Sales Rep' AND
   officeCode = 6;
 
-- Verify update 
SELECT 
    *
FROM
    employees_new
WHERE
    jobTitle = 'Sales Rep'
        AND officeCode = 6;
        
-- Update using subquery
SELECT 
    customername, 
    salesRepEmployeeNumber
FROM
    customers_new
WHERE
    salesRepEmployeeNumber IS NULL;
    
-- 
SELECT 
    employeeNumber
FROM
    employees_new
WHERE
    jobtitle = 'Sales Rep'
ORDER BY RAND()
LIMIT 1;

UPDATE customers_new 
SET 
    salesRepEmployeeNumber = (SELECT 
            employeeNumber
        FROM
            employees_new
        WHERE
            jobtitle = 'Sales Rep'
        ORDER BY RAND()
        LIMIT 1)
WHERE
    salesRepEmployeeNumber IS NULL;
    
-- Verify update
SELECT 
     salesRepEmployeeNumber
FROM
    customers_new
WHERE
    salesRepEmployeeNumber IS NULL;
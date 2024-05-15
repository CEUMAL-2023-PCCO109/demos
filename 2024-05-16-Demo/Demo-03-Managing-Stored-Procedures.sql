-- Demo-03-Managing-Stored-Procedures
USE classicmodels;

-- Drop Procedures
DROP PROCEDURE IF EXISTS spGetCustomers;
DROP PROCEDURE IF EXISTS spGetOfficeByCountry;
DROP PROCEDURE IF EXISTS spGetOrderCountByStatus;
DROP PROCEDURE IF EXISTS spSetCounter;

-- Alter Procedure
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS spGetEmployees()
BEGIN
	SELECT * FROM employees;
END $$
DELIMITER ;

SHOW CREATE PROCEDURE spGetEmployees;

-- Add Comment
ALTER PROCEDURE spGetEmployees COMMENT "Get employees";

SHOW CREATE PROCEDURE spGetEmployees;
 
-- Alter and Drop via MySQL Workbench
DROP PROCEDURE IF EXISTS spGetOrderAmount;

DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS spGetOrderAmount()
BEGIN
	SELECT 
        SUM(quantityOrdered * priceEach) 
    FROM orderDetails;
END $$
DELIMITER ;

-- Update on MySQL Workbench
-- CREATE PROCEDURE IF NOT EXISTS spGetOrderAmount(
--	IN pOrderNumber INT
-- )
-- BEGIN
--	SELECT 
--       SUM(quantityOrdered * priceEach) 
--   FROM orderDetails
--    WHERE orderNumber = pOrderNumber;
--  END
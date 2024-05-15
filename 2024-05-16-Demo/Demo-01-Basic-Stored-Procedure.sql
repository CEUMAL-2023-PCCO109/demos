-- Demo-01-Basic-Stored-Procedure
USE classicmodels;

DROP PROCEDURE IF EXISTS spGetCustomers;

DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS spGetCustomers()
BEGIN
	SELECT 
		customerName, 
		city, 
		state, 
		postalCode, 
		country
	FROM
		customers
	ORDER BY customerName;    
END$$
DELIMITER ;

CALL spGetCustomers();
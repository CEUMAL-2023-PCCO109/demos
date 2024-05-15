-- Demo-04-Stored-Procedure-Variables
USE classicmodels;

DROP PROCEDURE IF EXISTS spGetTotalOrder;

DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS spGetTotalOrder()
BEGIN
	DECLARE totalOrder INT DEFAULT 0;
    
	SELECT 
		COUNT(*)
	INTO totalOrder FROM
		orders;
    
	SELECT totalOrder;
END$$
DELIMITER ;

CALL spGetTotalOrder();
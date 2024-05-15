-- Demo-02-Basic-Stored-Procedure-With-Parameters
USE classicmodels;

-- IN Parameter Example
DROP PROCEDURE IF EXISTS spGetOfficeByCountry;

DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS spGetOfficeByCountry(
	IN countryName VARCHAR(255)
)
BEGIN
	SELECT * 
 	FROM offices
	WHERE country = countryName;
END $$
DELIMITER ;

CALL spGetOfficeByCountry('USA');
CALL spGetOfficeByCountry('France');

-- OUT Parameter Example
DROP PROCEDURE IF EXISTS spGetOrderCountByStatus;

DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS spGetOrderCountByStatus (
	IN  orderStatus VARCHAR(25),
	OUT total INT
)
BEGIN
	SELECT COUNT(orderNumber)
	INTO total
	FROM orders
	WHERE status = orderStatus;
END$$
DELIMITER ;

CALL spGetOrderCountByStatus('Shipped',@total);
SELECT @total;

CALL spGetOrderCountByStatus('In Process',@total);
SELECT @total AS total_in_process;

-- InOut Parameter Example
DROP PROCEDURE IF EXISTS spSetCounter;

DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS spSetCounter(
	INOUT counter INT,
    IN inc INT
)
BEGIN
	SET counter = counter + inc;
END$$
DELIMITER ;

SET @counter = 1;
CALL spSetCounter(@counter,1); -- 2
CALL spSetCounter(@counter,1); -- 3
CALL spSetCounter(@counter,5); -- 8
SELECT @counter; -- 8
-- Demo-07-Case-Statements
USE classicmodels;

DROP PROCEDURE IF EXISTS spGetCustomerShipping;

-- Simple CASE statement
DELIMITER $$ 
CREATE PROCEDURE IF NOT EXISTS spGetCustomerShipping(
  IN pCustomerNumber INT, 
  OUT pShipping VARCHAR(50),
  OUT pCountry VARCHAR(50)
) 
BEGIN 
	DECLARE customerCountry VARCHAR(100);
	SELECT 
	  country, country INTO customerCountry, pCountry 
	FROM 
	  customers 
	WHERE 
	  customerNumber = pCustomerNumber;

	CASE customerCountry 
		WHEN 'USA' THEN 
			SET pShipping = '2-day Shipping';
		WHEN 'Canada' THEN 
			SET pShipping = '3-day Shipping';
		ELSE 
			SET pShipping = '5-day Shipping';
	END CASE;
END$$ 
DELIMITER ;

CALL spGetCustomerShipping(112,@shipping,@country);
SELECT @shipping, @country;

-- Searched CASE statement
DROP PROCEDURE IF EXISTS spGetCustomerShipping;

DELIMITER $$ 
CREATE PROCEDURE IF NOT EXISTS spGetDeliveryStatus(
  IN pOrderNumber INT, 
  OUT pDeliveryStatus VARCHAR(100)
) 

BEGIN 
	-- get the waiting day from the orders table
	DECLARE waitingDay INT DEFAULT 0;
	SELECT 
	  DATEDIFF(shippedDate, requiredDate) INTO waitingDay 
	FROM 
	  orders 
	WHERE 
	  orderNumber = pOrderNumber;
      
	-- determine delivery status	  
	CASE 
		WHEN waitingDay < 0 THEN 
			SET pDeliveryStatus = 'Early Delivery';
        WHEN waitingDay = 0 THEN 
			SET pDeliveryStatus = 'On Time';
		WHEN waitingDay >= 1 AND waitingDay < 5 THEN 
			SET pDeliveryStatus = 'Late';
		WHEN waitingDay >= 5 THEN 
			SET pDeliveryStatus = 'Very Late';
		ELSE 
			SET pDeliveryStatus = 'No Information';
	END CASE;

END$$ 
DELIMITER ;

SELECT orderNumber,  DATEDIFF(shippedDate, requiredDate) FROM orders;
CALL spGetDeliveryStatus(10100,@delivery); -- Early Delivery
SELECT @delivery;
CALL spGetDeliveryStatus(10160,@delivery); -- On Time
SELECT @delivery;
CALL spGetDeliveryStatus(10165,@delivery); -- Very Late
SELECT @delivery;
CALL spGetDeliveryStatus(10260,@delivery); -- No Information
SELECT @delivery;
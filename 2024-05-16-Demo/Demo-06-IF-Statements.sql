-- Demo-06-IF-Statements
USE classicmodels;

-- IF..THEN Statement
DROP PROCEDURE IF EXISTS spGetCustomerLevel;

DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS spGetCustomerLevel(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20),
    OUT pCreditLimit DECIMAL(10,2)
)
BEGIN
    DECLARE credit DECIMAL(10,2) DEFAULT 0;

    SELECT creditLimit, creditLimit
    INTO credit, pCreditLimit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
        SET pCreditLimit = credit;
    END IF;
END$$
DELIMITER ;

CALL spGetCustomerLevel(141, @level, @credit);
SELECT @level, @credit;

-- IF..ELSE Statement
DROP PROCEDURE IF EXISTS spGetCustomerLevel;

DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS spGetCustomerLevel(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20),
    OUT pCreditLimit DECIMAL(10,2)
)
BEGIN
    DECLARE credit DECIMAL(10,2) DEFAULT 0;

    SELECT creditLimit, creditLimit
    INTO credit, pCreditLimit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
	ELSE
        SET pCustomerLevel = 'NOT PLATINUM';
    END IF;
END$$
DELIMITER ;

CALL spGetCustomerLevel(447, @level, @credit);
SELECT @level, @credit;

-- IF..THEN..ELSEIF..ELSE Statement
DROP PROCEDURE IF EXISTS spGetCustomerLevel;

DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS spGetCustomerLevel(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20),
    OUT pCreditLimit DECIMAL(10,2)
)
BEGIN
    DECLARE credit DECIMAL(10,2) DEFAULT 0;

    SELECT creditLimit, creditLimit
    INTO credit, pCreditLimit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
    ELSEIF credit <= 50000 AND credit > 10000 THEN
        SET pCustomerLevel = 'GOLD';
    ELSE
        SET pCustomerLevel = 'SILVER';
    END IF;
END$$
DELIMITER ;

CALL spGetCustomerLevel(447, @level, @credit);
SELECT @level, @credit;
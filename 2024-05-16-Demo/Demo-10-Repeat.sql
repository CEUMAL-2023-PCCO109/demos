-- Demo-10-Repeat
USE classicmodels;

DROP PROCEDURE IF EXISTS spRepeatDemo;

DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS spRepeatDemo()
BEGIN
    DECLARE counter INT DEFAULT 1;
    DECLARE result VARCHAR(100) DEFAULT '';
    
    REPEAT
        SET result = CONCAT(result,counter,',');
        SET counter = counter + 1;
    UNTIL counter >= 10
    END REPEAT;
    
    -- display result
    SELECT result;
END$$
DELIMITER ;

CALL spRepeatDemo();
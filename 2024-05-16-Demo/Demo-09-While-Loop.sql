-- Demo-09-While-Loop
USE classicmodels;

DROP TABLE IF EXISTS calendars;

CREATE TABLE IF NOT EXISTS calendars (
    date DATE PRIMARY KEY,
    month INT NOT NULL,
    quarter INT NOT NULL,
    year INT NOT NULL
);

DROP PROCEDURE IF EXISTS spFillDates

DELIMITER $$
CREATE PROCEDURE spFillDates(
    startDate DATE, 
    day INT
)
BEGIN
    
    DECLARE counter INT DEFAULT 0;
    DECLARE currentDate DATE DEFAULT startDate;

    WHILE counter <= day DO
        CALL InsertCalendar(currentDate);
        SET counter = counter + 1;
        SET currentDate = DATE_ADD(currentDate ,INTERVAL 1 day);
    END WHILE;

END$$
DELIMITER ;

CALL spFillDates('2024-05-01',30);
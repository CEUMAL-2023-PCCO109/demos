-- Demo-08-Loop
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
CREATE PROCEDURE IF NOT EXISTS spFillDates(
	IN startDate DATE,
    IN endDate DATE
)
BEGIN
	DECLARE currentDate DATE DEFAULT startDate;
    
	insert_date: LOOP
		-- increase date by one day
		SET currentDate = DATE_ADD(currentDate, INTERVAL 1 DAY);
        
        -- leave the loop if the current date is after the end date
        IF currentDate > endDate THEN
			LEAVE insert_date;
        END IF;
        
        -- insert date into the table
        INSERT INTO calendars(date, month, quarter, year)
        VALUES(currentDate, MONTH(currentDate), QUARTER(currentDate), YEAR(currentDate));
    END LOOP;
END $$
DELIMITER ;

CALL spFillDates('2024-05-01','2024-05-31');
SELECT * FROM calendars;
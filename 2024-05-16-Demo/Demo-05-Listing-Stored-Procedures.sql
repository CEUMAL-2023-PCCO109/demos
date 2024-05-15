-- Demo-05-Listing-Stored-Procedures
USE classicmodels;

-- Pattern Matching
SHOW PROCEDURE STATUS LIKE 'sp_%';

-- Search Condition
SHOW PROCEDURE STATUS WHERE db = 'classicmodels';

-- Data Dictionary
SELECT 
    routine_name
FROM
    information_schema.routines
WHERE
    routine_type = 'PROCEDURE'
        AND routine_schema = 'classicmodels';
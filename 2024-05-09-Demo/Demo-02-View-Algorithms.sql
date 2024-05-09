use classicmodels;

CREATE ALGORITHM=MERGE VIEW contactPersonsMerge(
    customerName, 
    firstName, 
    lastName, 
    phone
) AS
SELECT 
    customerName, 
    contactFirstName, 
    contactLastName, 
    phone
FROM customers;

SELECT * FROM contactPersonsMerge WHERE customerName LIKE '%Co%';

CREATE ALGORITHM=TEMPTABLE VIEW contactPersonsTemp(
    customerName, 
    firstName, 
    lastName, 
    phone
) AS
SELECT 
    customerName, 
    contactFirstName, 
    contactLastName, 
    phone
FROM customers;

SELECT * FROM contactPersonsTemp WHERE customerName LIKE '%Co%';
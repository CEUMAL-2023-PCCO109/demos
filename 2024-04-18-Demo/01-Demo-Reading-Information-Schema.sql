-- Accessing the INFORMATION_SCHEMA Database (Data Dictionary of MySQL)
USE INFORMATION_SCHEMA;
SHOW TABLES;

-- Display all databases accessible to logged in user
SELECT * FROM INFORMATION_SCHEMA.Schemata;

-- Display all tables in selected database
SELECT * FROM INFORMATION_SCHEMA.Tables WHERE table_schema = '2a_admin_sampledb';
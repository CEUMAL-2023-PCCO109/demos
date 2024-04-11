use demo_dml;

-- DELETE Demo
DROP TABLE IF EXISTS contacts;

CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

INSERT INTO contacts (first_name, last_name, email, phone)
VALUES
    ('John', 'Doe', 'john.doe@email.com', '123-456-7890'),
    ('Jane', 'Smith', 'jane.smith@email.com', '987-654-3210'),
    ('Alice', 'Doe', 'alice.doe@email.com', '555-123-4567'),
    ('Bob', 'Johnson', 'bob.johnson@email.com', '789-321-6540'),
    ('Eva', 'Doe', 'eva.doe@email.com', '111-222-3333'),
    ('Michael', 'Smith', 'michael.smith@email.com', '444-555-6666'),
    ('Sophia', 'Johnson', 'sophia.johnson@email.com', '777-888-9999'),
    ('Matthew', 'Doe', 'matthew.doe@email.com', '333-222-1111'),
    ('Olivia', 'Smith', 'olivia.smith@email.com', '999-888-7777'),
    ('Daniel', 'Johnson', 'daniel.johnson@email.com', '666-555-4444'),
    ('Emma', 'Doe', 'emma.doe@email.com', '222-333-4444'),
    ('William', 'Smith', 'william.smith@email.com', '888-999-0000'),
    ('Ava', 'Johnson', 'ava.johnson@email.com', '111-000-9999'),
    ('Liam', 'Doe', 'liam.doe@email.com', '444-777-3333'),
    ('Mia', 'Smith', 'mia.smith@email.com', '222-444-8888'),
    ('James', 'Johnson', 'james.johnson@email.com', '555-666-1111'),
    ('Grace', 'Doe', 'grace.doe@email.com', '777-222-8888'),
    ('Benjamin', 'Smith', 'benjamin.smith@email.com', '999-111-3333'),
    ('Chloe', 'Johnson', 'chloe.johnson@email.com', '111-444-7777'),
    ('Logan', 'Doe', 'logan.doe@email.com', '333-555-9999');

-- Delete a row
DELETE FROM contacts
WHERE id = 1;

-- Verify Delete (Expected, contactId 1 is removed)
SELECT * FROM contacts
WHERE id = 1;

-- Delete multiple rows
DELETE FROM contacts 
WHERE last_name = 'Smith';

-- Verify Delete (Expected, all contact with last_name = 'Smith' is removed)
SELECT * FROM contacts 
WHERE last_name = 'Smith';

-- Delete Sort Limit
DELETE FROM contacts
ORDER BY first_name
LIMIT 3;

-- Verify Delete (Expected, first 3 records in first_name asc order is removed)
SELECT * FROM contacts 
ORDER BY first_name;

-- Delete all rows
DELETE FROM contacts;

-- Verify Delete (Expected, all contact record is removed)
SELECT * FROM contacts;

-- Truncate Table
TRUNCATE TABLE contacts;

-- All contact record is removed but id will reset to 1.
SELECT * FROM contacts;


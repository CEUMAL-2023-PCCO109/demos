use demo_dml;

-- UPDATE Demo

-- ALTER TABLE employees DROP FOREIGN KEY `employees_ibfk_1`;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS merits;

CREATE TABLE merits (
  performance INT PRIMARY KEY, 
  percentage DEC(11, 2) NOT NULL
);

CREATE TABLE employees (
  emp_id INT AUTO_INCREMENT PRIMARY KEY, 
  emp_name VARCHAR(255) NOT NULL, 
  performance INT DEFAULT NULL, 
  salary DEC(11, 2) DEFAULT NULL, 
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`performance`) REFERENCES `merits` (`performance`)
);

INSERT INTO merits(performance, percentage) 
VALUES 
  (1, 0), 
  (2, 0.01), 
  (3, 0.03), 
  (4, 0.05), 
  (5, 0.08);

INSERT INTO employees(emp_name, performance, salary) 
VALUES 
  ('Mary Doe', 1, 50000), 
  ('Cindy Smith', 3, 65000), 
  ('Sue Greenspan', 4, 75000), 
  ('Grace Dell', 5, 125000), 
  ('Nancy Johnson', 3, 85000), 
  ('John Doe', 2, 45000), 
  ('Lily Bush', 3, 55000);
 
-- Update Inner Join
UPDATE employees
        INNER JOIN
    merits ON employees.performance = merits.performance 
SET 
    salary = salary + salary * percentage;
    
SELECT * FROM employees;

TRUNCATE TABLE employees;

INSERT INTO employees(emp_name, performance, salary) 
VALUES 
  ('Mary Doe', 1, 50000), 
  ('Cindy Smith', 3, 65000), 
  ('Sue Greenspan', 4, 75000), 
  ('Grace Dell', 5, 125000), 
  ('Nancy Johnson', 3, 85000), 
  ('John Doe', 2, 45000), 
  ('Lily Bush', 3, 55000),
  ('Jack William', NULL, 43000), 
  ('Ricky Bond', NULL, 52000);
  
SELECT * FROM employees;

-- Update Left Join
UPDATE 
  employees 
  LEFT JOIN merits ON employees.performance = merits.performance 
SET 
  salary = salary + salary * COALESCE(percentage, 0.015);
  
SELECT 
    *
FROM
    employees;
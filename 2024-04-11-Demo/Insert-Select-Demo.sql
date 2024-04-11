use classicmodels;

DROP TABLE IF EXISTS customers_new;
-- ALTER TABLE employees_new DROP FOREIGN KEY `employees_new_ibfk_1`;
-- ALTER TABLE employees_new DROP FOREIGN KEY `employees_new_ibfk_2`;
DROP TABLE IF EXISTS employees_new;

CREATE TABLE `employees_new` (
  `employeeNumber` int NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`),
  KEY `reportsTo` (`reportsTo`),
  KEY `officeCode` (`officeCode`),
  CONSTRAINT `employees_new_ibfk_1` FOREIGN KEY (`reportsTo`) REFERENCES `employees_new` (`employeeNumber`),
  CONSTRAINT `employees_new_ibfk_2` FOREIGN KEY (`officeCode`) REFERENCES `offices` (`officeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `customers_new` (
  `customerNumber` int NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `contactLastName` varchar(50) NOT NULL,
  `contactFirstName` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postalCode` varchar(15) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `salesRepEmployeeNumber` int DEFAULT NULL,
  `creditLimit` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`customerNumber`),
  KEY `salesRepEmployeeNumber` (`salesRepEmployeeNumber`),
  CONSTRAINT `customers_new_ibfk_1` FOREIGN KEY (`salesRepEmployeeNumber`) REFERENCES `employees_new` (`employeeNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO employees_new SELECT * FROM employees;
SELECT * FROM employees_new;

INSERT INTO customers_new SELECT * FROM customers;
SELECT * FROM customers;
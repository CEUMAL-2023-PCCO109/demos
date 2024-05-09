use classicmodels;

-- 1) Creating a simple view example
CREATE VIEW salePerOrder AS
    SELECT 
        orderNumber, SUM(quantityOrdered * priceEach) total
    FROM
        orderDetails
    GROUP BY orderNumber
    ORDER BY total DESC;
 
SELECT 
    *
FROM
    salePerOrder;
 
-- 2) Creating a view based on another view example
CREATE VIEW bigSalesOrder AS
    SELECT 
        orderNumber, ROUND(total, 2) AS total
    FROM
        salePerOrder
    WHERE
        total > 60000;
        
SELECT 
    orderNumber, total
FROM
    bigSalesOrder;
	
-- 3) Creating a view with join example
CREATE OR REPLACE VIEW customerOrders AS
    SELECT 
        orderNumber,
        customerName,
        SUM(quantityOrdered * priceEach) total
    FROM
        orderDetails
            INNER JOIN
        orders o USING (orderNumber)
            INNER JOIN
        customers USING (customerNumber)
    GROUP BY orderNumber;

SELECT 
    *
FROM
    customerOrders
ORDER BY total DESC;

-- 4) Creating a view with a subquery example
CREATE VIEW aboveAvgProducts AS
    SELECT 
        productCode, productName, buyPrice
    FROM
        products
    WHERE
        buyPrice > (SELECT 
                AVG(buyPrice)
            FROM
                products)
    ORDER BY buyPrice DESC;
    
SELECT 
    *
FROM
    aboveAvgProducts;

-- 5) Creating a view with explicit view columns example
CREATE VIEW customerOrderStats (customerName , orderCount) AS
    SELECT 
        customerName, COUNT(orderNumber)
    FROM
        customers
            INNER JOIN
        orders USING (customerNumber)
    GROUP BY customerName;
    
SELECT 
    customerName, orderCount
FROM
    customerOrderStats
ORDER BY orderCount , customerName;
CREATE DATABASE Amazon_sales;

USE Amazon_sales;

DESCRIBE orders_dataset;

ALTER TABLE orders_dataset
CHANGE COLUMN ï»¿OrderID OrderID VARCHAR(20);

ALTER TABLE orders_dataset
ADD PRIMARY KEY (OrderID);

ALTER TABLE Orders_dataset
MODIFY QUANTITY INT;

SELECT OrderDate FROM Orders_dataset LIMIT 5;


SET SQL_SAFE_UPDATES = 0;

-- BUSINESS KPI's:

-- 1) TOTAL REVENUE :

SELECT 
    SUM(TotalSales) as Total_Revenue
FROM Orders_dataset;

-- 2) TOTAL ORDERS

SELECT 
    COUNT(OrderID) AS Total_Orders
FROM Orders_dataset;

-- 3) AVERAGE ORDER VALUE :

SELECT 
    AVG(TotalSales) AS AVG_ORDER_VALUE
FROM Orders_dataset;

-- 4) ORDER BY CATEGORY :

SELECT 
    Category, 
    COUNT(*) AS ORDERS
FROM Orders_dataset
GROUP BY Category
ORDER BY ORDERS DESC;

-- 5) ORDER BY CATEGORY ONLY FOR DELIVERED/COMPLETED :

SELECT 
    Category,
    COUNT(*) AS ORDER_STATUS
FROM Orders_dataset
WHERE Status = "Completed"
GROUP BY Category
ORDER BY ORDER_STATUS DESC;

-- 6) SALES BY CATEGORY :

SELECT 
    Category, 
    SUM(TotalSales) AS CATEGORY_SALES
FROM Orders_dataset
GROUP BY Category
ORDER BY CATEGORY_SALES DESC;

-- 7) MOST USED PAYMENT METHOD :

SELECT 
    PaymentMethod,
    COUNT(*) AS USAGE_METHOD
FROM Orders_dataset
GROUP BY PaymentMethod
ORDER BY USAGE_METHOD DESC;

-- 8) MONTHLY SALES TREND :

SELECT
   YEAR(OrderDate) AS Year,
   MONTH(OrderDate) AS Month,
   SUM(TotalSales) AS MONTHLY_SALES
FROM Orders_dataset
GROUP BY Year, month
ORDER BY Year, Month;
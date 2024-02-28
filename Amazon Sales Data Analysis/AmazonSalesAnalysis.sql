-- I. SALES ANALYSIS

-- 1) Total Revenue generated in the AMJ Quarter

SELECT SUM(Amount) AS TotalRevenue 
FROM AmazonSalesReport
WHERE Courier_Status = 'Shipped'
	AND Date BETWEEN '2022-04-01' AND '2022-06-30';

-- Total Revenue of INR 70,936,743

-- 2) Top 10 products by Sales

SELECT TOP 10 SKU, Category, SUM(Qty) AS TotalQuantity
FROM AmazonSalesReport
WHERE Courier_Status = 'Shipped'
GROUP BY SKU, Category
ORDER BY TotalQuantity DESC;

-- Bestselling product is a western dress with SKU Code JNE3797-KR-L

-- 3) Average order value

SELECT ROUND(AVG(Amount), 2) AS AverageOrderValue
FROM AmazonSalesReport
WHERE Courier_Status = 'Shipped';

-- The average order value was INR 649

-- 4) Peak sales periods (Day, Week, Month)

-- Peak sales by day
SELECT DATEPART(Day, Date) AS SalesDay, Count(*) AS DailySalesCount
FROM AmazonSalesReport
WHERE Courier_Status = 'Shipped'
GROUP BY DATEPART(Day, Date)
ORDER BY DailySalesCount DESC;

-- This shows that a huge chunk of sales were made in the first 5 days of the month.
-- This indicates that an individual who is paid at the end of every month is more likely
-- to purchase things in the first few days of the month.

-- Peak sales by Week
SELECT DATEPART(Week, Date) AS SalesWeek, Count(*) AS WeeklySalesCount
FROM AmazonSalesReport
WHERE Courier_Status = 'Shipped'
GROUP BY DATEPART(Week, Date)
ORDER BY WeeklySalesCount DESC;

-- Week 19, which is the 2nd month of May has the highest number of sales

-- Peak sales by month
SELECT DATEPART(Month, Date) AS SalesMonth, Count(*) AS MonthlySalesCount
FROM AmazonSalesReport
WHERE Courier_Status = 'Shipped'
GROUP BY DATEPART(Month, Date)
ORDER BY MonthlySalesCount DESC;

-- April has recorded the highest number of sales


-- II. CUSTOMER ANALYSIS

-- 1) Top markets for sales

-- City
SELECT TOP 10 ship_city, SUM(Amount) AS TotalSales
FROM AmazonSalesReport
WHERE Courier_Status = 'Shipped'
GROUP BY ship_city
ORDER BY TotalSales DESC;

-- State
SELECT TOP 10 ship_state, SUM(Amount) AS TotalSales
FROM AmazonSalesReport
WHERE Courier_Status = 'Shipped'
GROUP BY ship_state
ORDER BY TotalSales DESC;

-- Maharashtra has recorded the highest number of sales

-- 2) Trends in order cancellation
SELECT DATEPART(MONTH, Date) AS Month,
	COUNT(*) AS CancellationCount
FROM AmazonSalesReport
WHERE Status = 'Cancelled'
GROUP BY DATEPART(Month, Date)
ORDER BY Month;

-- April had the highest number of cancellations

-- 3) Distribution of B2B vs B2C customers

SELECT B2B, COUNT(B2B) CountOfB2B
FROM AmazonSalesReport
GROUP BY B2B;

-- 99% of the customers are B2C


-- III. Shipping Analysis

-- 1) Amazon vs Non-Amazon fulfillment
SELECT Sales_Channel, COUNT(Sales_Channel) AS FulfillmentCount
FROM AmazonSalesReport
GROUP BY Sales_Channel;

-- Very negligible amount of orders are from Non-amazon sales chanel


-- IV. Product Analysis

-- 1) Most popular product category
SELECT 
	Category,
	COUNT(*) AS TotalOrders
FROM AmazonSalesReport
GROUP BY Category
ORDER BY TotalOrders DESC;

-- The most popular category is Set, followed by Kurta and then Western Dress

-- 2) Most popular styles
SELECT
	Style, Category,
	COUNT(*) AS TotalOrders
FROM AmazonSalesReport
GROUP BY Style, Category
ORDER BY TotalOrders DESC;

-- JNE3797, which is a western dress is the most popular style as per the sales numbers.

-- 3) Average quantity of products ordered
SELECT AVG(Qty) AS AverageQuantity
FROM AmazonSalesReport
WHERE Courier_Status = 'Shipped';

-- On an average, every fulfilled order consists of just one product.


-- V. Promotion Analysis

-- 1) The most popular promotion

SELECT
    promotion_ids,
    COUNT(*) AS UsageCount
FROM AmazonSalesReport
WHERE promotion_ids IS NOT NULL
GROUP BY promotion_ids
ORDER BY UsageCount DESC;

-- The "IN Core Free Shipping 2015/04/08 23-48-5-108" is the most used promotion of all the sales








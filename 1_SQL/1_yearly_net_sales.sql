-- ==========================================================
-- 📊 Yearly Net Sales (excluding 2024)
-- ==========================================================
-- Calculates total sales in USD per year, ignoring 2024
-- Because the latest order in the data is only until 2024-04-20

SELECT  
    year, 
    SUM((s.netprice * s.quantity) * s.exchangerate) AS NetSalesUSD
FROM Sales AS s
LEFT JOIN date AS d ON s.orderdate = d.date
WHERE year <> 2024
GROUP BY year;


-- ----------------------------------------------------------
-- 🕵️ Check Latest Order Date
-- ----------------------------------------------------------
-- Finds the most recent order date in the dataset
SELECT orderdate
FROM Sales
ORDER BY orderdate DESC
LIMIT 1;

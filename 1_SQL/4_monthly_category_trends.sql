-- ==========================================================
-- 📈 Monthly Sales Trend for Each Category (2023)
-- ==========================================================
-- Step 1: Create temporary table (CTE) for 2023 sales with Net Sales in USD
WITH Sales2023 AS (
    SELECT *,
        ((netprice) * quantity) * exchangerate AS NetSalesUSD
    FROM sales AS s
    WHERE orderdate BETWEEN '2023-01-01' AND '2023-12-31'
)

-- Step 2: Aggregate Net Sales per month and category
SELECT 
    EXTRACT(MONTH FROM S.orderdate) AS Month,
    P.categoryname,
    SUM(S.NetSalesUSD) AS NetSalesUSD
FROM Sales2023 S
LEFT JOIN product P ON S.productkey = P.productkey
GROUP BY Month, P.categoryname
ORDER BY Month;
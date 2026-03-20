-- ==========================================================
-- 🌍 Revenue by Location for 2023
-- ==========================================================
-- Step 1: Create a temporary table (CTE) for all 2023 sales
-- Step 2: Calculate Net Sales and Gross Profit per order
WITH Sales2023 AS (
    SELECT *,
        ((netprice) * quantity) * exchangerate AS NetSalesUSD,
        ((netprice - unitcost) * quantity) * exchangerate AS GrossProfitUSD
    FROM sales AS s
    WHERE orderdate BETWEEN '2023-01-01' AND '2023-12-31'
)

-- Step 3: Aggregate total net sales per country
SELECT 
    st.countryname AS Location,
    SUM(s.NetSalesUSD) AS NetSales
FROM Sales2023 s
LEFT JOIN store st ON s.storekey = st.storekey
GROUP BY st.countryname
ORDER BY SUM(s.NetSalesUSD) DESC;
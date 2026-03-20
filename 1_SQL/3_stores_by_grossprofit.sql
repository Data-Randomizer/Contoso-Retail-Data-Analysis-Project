-- ==========================================================
-- 🏬 Stores by Gross Profit for 2023
-- ==========================================================
-- Step 1: Create a temporary table (CTE) for 2023 sales with Gross Profit
WITH Sales2023 AS (
    SELECT *,
        ((netprice - unitcost) * quantity) * exchangerate AS GrossProfitUSD
    FROM sales AS s
    WHERE orderdate BETWEEN '2023-01-01' AND '2023-12-31'
)

-- Step 2: Aggregate total gross profit per store
SELECT 
    st.description AS Store,
    SUM(s.GrossProfitUSD) AS GrossProfit
FROM Sales2023 s
LEFT JOIN store st ON s.storekey = st.storekey
GROUP BY st.description
ORDER BY GrossProfit DESC;
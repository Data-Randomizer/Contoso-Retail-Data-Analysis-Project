-- ==========================================================
-- 🏆 Top 5 Stores Gross Profit by Date (2024)
-- ==========================================================
-- Step 1: CTE for 2024 sales
WITH Sales2024 AS (
    SELECT *,
        ((netprice - unitcost) * quantity) * exchangerate AS GrossProfitUSD
    FROM sales AS s
    WHERE orderdate > '2023-12-31'
),

-- Step 2: Identify top 5 stores by total gross profit
TopStores2024 AS (
    SELECT st.description AS Store
    FROM Sales2024 s
    LEFT JOIN store st ON s.storekey = st.storekey
    GROUP BY st.description
    ORDER BY SUM(s.GrossProfitUSD) DESC
    LIMIT 5
)

-- Step 3: Aggregate cumulative gross profit per date for the top 5 stores
SELECT 
    s.orderdate,
    st.description AS StoreName,
    SUM(s.GrossProfitUSD) AS GrossProfit
FROM Sales2024 s
LEFT JOIN store st ON s.storekey = st.storekey
WHERE st.description IN (SELECT Store FROM TopStores2024)
GROUP BY s.orderdate, st.description
ORDER BY s.orderdate;
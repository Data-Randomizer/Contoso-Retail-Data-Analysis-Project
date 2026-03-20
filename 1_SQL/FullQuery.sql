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
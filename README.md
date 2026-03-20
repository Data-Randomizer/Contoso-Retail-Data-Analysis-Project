# 📊 Retail Data Analytics Project

This project analyzes retail sales and gross profit data using **Python (Pandas + Matplotlib)** and **PostgreSQL**. It answers key business questions such as yearly trends, top-performing locations and stores, category performance, and cumulative profit growth.

---

## 🔹 1. Project Overview

* **Goal:** Transform raw retail data into actionable insights for better decision-making.
* **Tools Used:**

  * Python: `pandas`, `numpy`, `matplotlib`
  * SQL: PostgreSQL
* **Workflow:**

  1. Extract data using SQL
  2. Save results as CSV files
  3. Analyze and visualize using Python

---

## 📁 Project Structure

```id="proj-struct"
Contoso-Retail-Data-Analysis-Project/
│
├─ 1_SQL/
│   ├─ yearly_net_sales.sql
│   ├─ revenue_by_location.sql
│   ├─ stores_by_grossprofit.sql
│   ├─ monthly_category_trends.sql
│   └─ top5_stores_2024.sql
│
├─ 2.5_Extracted Data/
│   ├─ 1_Yearly NetSales.csv
│   ├─ 2_Net Sales by Location For 2023.csv
│   ├─ 3_Store by GrossProfit For 2023.csv
│   ├─ 4_Monthly NetSales By Category For 2023.csv
│   └─ 5_Top 5 Stores GrossProfit By Date For 2024.csv
│
├─ 3_Jupyter_Notebook/
│   └─ Retail_Analysis.ipynb
│
├─ 4_Charts/
│   ├─ yearly_net_sales.png
│   ├─ top_locations.png
│   ├─ top_stores.png
│   ├─ category_trends.png
│   └─ cumulative_profit.png
│
└─ README.md
```

---

## 🔹 2. SQL Data Extraction (1_SQL)

All datasets were generated using PostgreSQL queries:

* **Yearly Net Sales:** Aggregates total sales per year (excluding incomplete 2024).
* **Revenue by Location (2023):** Calculates total sales per country.
* **Stores by Gross Profit (2023):** Identifies most profitable stores.
* **Monthly Sales by Category (2023):** Tracks category performance over time.
* **Top 5 Stores (2024):** Extracts daily gross profit for top-performing stores.

These queries transform raw transactional data into structured datasets ready for analysis.

---

## 🔹 3. Extracted Data (2.5_Extracted Data)

The SQL outputs are stored as CSV files and used directly in Python.

Datasets include:

* Yearly Net Sales
* Sales by Location
* Store Gross Profit
* Monthly Category Sales
* Top Stores Profit Over Time

---

## 🔹 4. Python Analysis & Visualization (3_Jupyter_Notebook)

### ✔ Setup

* Imported required libraries
* Created a `money_formatter` function to display values in **K / M format**

---

### 📈 Yearly Net Sales

* Line chart showing sales growth over time
* Helps identify long-term trends

![image alt](https://github.com/Data-Randomizer/Contoso-Retail-Data-Analysis-Project/blob/1e1b08e6323d2f3c1581d2b2d216cb5e8d7eee8c/4_Charts/1-What%20Are%20The%20Net%20Sales%20For%20Each%20Year.png)

---

### 🌍 Top Locations by Sales (2023)


* Horizontal bar chart
* Includes gradient colors and value labels
* Highlights best-performing countries
* Noticed That Online revenue is roughly equal to the total revenue from all on-site store locations combined

![image alt](https://github.com/Data-Randomizer/Contoso-Retail-Data-Analysis-Project/blob/1e1b08e6323d2f3c1581d2b2d216cb5e8d7eee8c/4_Charts/2-Top%2010%20Net%20Sales%20By%20Location%20For%202023.png)

---

### 🏬 Top Stores by Gross Profit (2023)

* Ranks stores based on profitability
* Cleaned store names for better readability

![image alt](https://github.com/Data-Randomizer/Contoso-Retail-Data-Analysis-Project/blob/1e1b08e6323d2f3c1581d2b2d216cb5e8d7eee8c/4_Charts/3-Top%2010%20Net%20Sales%20By%20Store%20For%202023.png)

---

### 📅 Monthly Sales by Category (2023)

* Multi-line chart comparing categories
* Shows seasonality and trends
* Some product categories consistently bring in most of the revenue

![image alt](https://github.com/Data-Randomizer/Contoso-Retail-Data-Analysis-Project/blob/1e1b08e6323d2f3c1581d2b2d216cb5e8d7eee8c/4_Charts/4-Monthly%20Net%20Sales%20Trend%20by%20Category%20For%202023.png)

---

### 🎛️ Interactive Category Comparison

* User selects categories dynamically
* Validates input before plotting
* Flexible analysis tool

Example:

  ![image alt](https://github.com/Data-Randomizer/Contoso-Retail-Data-Analysis-Project/blob/1e1b08e6323d2f3c1581d2b2d216cb5e8d7eee8c/4_Charts/5-interactive%20Example.png)
  
---

### 📊 Cumulative Gross Profit (Top 5 Stores - 2024)

* Separate subplot for each store
* Uses cumulative sum to track growth over time

![image alt](https://github.com/Data-Randomizer/Contoso-Retail-Data-Analysis-Project/blob/1e1b08e6323d2f3c1581d2b2d216cb5e8d7eee8c/4_Charts/6-Cumulative%20Gross%20Profit%20For%20Each%20Store.png)

---

## 🔹 5. Charts (4_Charts)

All visualizations are exported as images and stored in this folder.

They can be used for:

* Reports
* Dashboards
* Portfolio showcase

---

## 🔹 6. Key Insights

* Identified **top-performing stores and locations**
* Observed **sales trends across years and months**
* Compared **category performance dynamically**
* Tracked **profit growth over time**

---

## 🔹 7. How to Use

### ▶ SQL

 1. The Link of the dataset https://github.com/lukebarousse/Int_SQL_Data_Analytics_Course/releases/download/v.0.0.0/contoso_100k.sql

 2.**Open PostgreSQL**
    
```
CREATE DATABASE contoso;
``` 
 3.**psql**
 
```
\c contoso
```

```
\i 'D:/Downloads/Retail_Dataset_Project/contoso_100k.sql'
```

5. Run queries from `1_SQL/`

7. Export results as CSV

### ▶ Python

1. Open the notebook in `3_Jupyter_Notebook/`

2. Run all cells

3. View generated charts

---

## 🔹 8. Future Improvements

* Build interactive dashboards (Power BI / Tableau)

---

## ⭐ Author

**Sherif Mohamad**

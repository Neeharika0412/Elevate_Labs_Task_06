-- Task 6: Sales Trend Analysis Using Aggregations

--  Create database and table
DROP DATABASE IF EXISTS sales_db;
CREATE DATABASE sales_db;
USE sales_db;

CREATE TABLE online_sales (
    transaction_id INT,
    order_date DATE,
    product_category VARCHAR(100),
    product_name VARCHAR(200),
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_revenue DECIMAL(10,2),
    region VARCHAR(100),
    payment_method VARCHAR(50)
);

--  Import CSV with date conversion
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/online_sales.csv'
INTO TABLE online_sales
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(transaction_id, @order_date, product_category, product_name, units_sold, unit_price, total_revenue, region, payment_method)
SET order_date = STR_TO_DATE(@order_date, '%d-%m-%Y');

--  Verify data
SELECT COUNT(*) AS total_records FROM online_sales;
SELECT * FROM online_sales LIMIT 5;

--  Monthly revenue & order volume
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_revenue) AS monthly_revenue,
    COUNT(DISTINCT transaction_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year, month;

--  Top 3 months by sales
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_revenue) AS monthly_revenue
FROM online_sales
GROUP BY year, month
ORDER BY monthly_revenue DESC
LIMIT 3;

--  Export monthly results to CSV
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_revenue) AS monthly_revenue,
    COUNT(DISTINCT transaction_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year, month
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/monthly_sales_results.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

--  Export top 3 results to CSV
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_revenue) AS monthly_revenue
FROM online_sales
GROUP BY year, month
ORDER BY monthly_revenue DESC
LIMIT 3
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/top3_sales_months.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

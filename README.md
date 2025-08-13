# Elevate_Labs_Task_06

# Task 6: Sales Trend Analysis Using Aggregations

## Objective
Analyze monthly revenue and order volume from an online sales dataset using MySQL.

## Tools Used
- MySQL Server 8.0
- MySQL Command Line Client
- Windows 10

## Dataset
The dataset contains online sales transactions with:
- Transaction ID
- Order Date
- Product Category
- Product Name
- Units Sold
- Unit Price
- Total Revenue
- Region
- Payment Method

## Steps
1. Created a MySQL database `sales_db` and table `online_sales`.
2. Imported `online_sales.csv` using `LOAD DATA INFILE` with date conversion to handle `DD-MM-YYYY` format.
3. Wrote SQL queries to:
   - Calculate monthly revenue and order volume.
   - Identify top 3 months by revenue.
4. Exported results to CSV files for submission.

## Files in this Repository
- `online_sales.csv` — Original dataset.
- `task6_sales_analysis.sql` — SQL script containing all commands for the task.
- `monthly_sales_results.csv` — Output showing monthly revenue and order volume.
- `top3_sales_months.csv` — Output showing the top 3 months by revenue.

## Results Summary
- **Highest Revenue Month:** January 2024 — ₹29,096.64
- **Next Highest Months:** March 2024 and April 2024
- Total of 8 months of data analyzed.

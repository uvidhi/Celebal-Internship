# E-Commerce Order Analytics System

## About the Project

This project is an end-to-end e-commerce data analytics system built using Python, Pandas, SQL, and Databricks.

The main idea of the project is to take raw e-commerce data, clean and validate it, store it in SQL tables, and then use SQL and Python to generate useful business reports.

The project covers the complete process from data generation to customer analysis and reporting.

---

## Technologies Used

* Python
* Pandas
* SQL
* PySpark
* Databricks
* Tabulate
* GitHub

---

## Project Workflow

```text
Generate Raw Data
       ↓
Data Cleaning
       ↓
Load Data into SQL Tables
       ↓
SQL Analytics
       ↓
Window Functions & CTEs
       ↓
Cohort & Retention Analysis
       ↓
Customer Segmentation
       ↓
Python Reporting Tool
       ↓
Edge Case Testing
       ↓
Final Reports
```

---

## Dataset

The project uses four main datasets:

### Customers

Contains information about customers, such as:

* Customer ID
* Customer name
* Registration date

### Products

Contains product-related information:

* Product ID
* Product name
* Category
* Cost price

### Orders

Contains order information:

* Order ID
* Customer ID
* Order date
* Order status

### Order Items

Contains details about the products purchased in each order:

* Order ID
* Product ID
* Quantity
* Unit price
* Discount

---

## 1. Data Generation

The raw datasets were generated using Python.

To make the project more realistic, some problems were intentionally added to the raw data, such as:

* Missing customer IDs
* Duplicate records
* Invalid IDs
* Negative quantities
* Invalid dates

This helped simulate the type of data quality issues that can occur in real-world projects.

---

## 2. Data Cleaning

Pandas was used to clean the generated datasets.

The cleaning process included:

* Removing duplicate records
* Handling missing values
* Fixing incorrect data types
* Removing invalid records
* Checking negative quantities
* Checking invalid IDs
* Validating relationships between tables

After cleaning, the datasets were prepared for SQL analysis.

---

## 3. SQL Tables

The cleaned data was loaded into Databricks SQL tables.

The main tables are:

```text
customers
products
orders
order_items
```

Relationships between the tables were checked using:

```text
customer_id
order_id
product_id
```

This helped make sure that the data relationships were correct before performing analytics.

---

## 4. SQL Analytics

SQL was used to answer common business questions.

Some of the reports created were:

* Total revenue
* Revenue by customer
* Revenue by category
* Monthly revenue
* Top-selling products
* Top customers
* Average order value

Different SQL concepts were used, including:

* JOIN
* GROUP BY
* WHERE
* HAVING
* SUM
* COUNT
* AVG
* CTEs
* Window functions

---

## 5. Window Functions and CTEs

Window functions were used for more advanced analysis.

Examples include:

* Ranking customers
* Running revenue totals
* Moving averages
* Comparing monthly results

CTEs were used to divide complex queries into smaller steps so that they were easier to understand and maintain.

---

## 6. Cohort and Retention Analysis

Customers were grouped into cohorts based on the month of their first purchase.

The analysis was used to find:

* First purchase month
* Monthly active customers
* Repeat customers
* One-time customers
* Customer retention
* Last purchase month

This helped understand whether customers continued purchasing after their first order.

---

## 7. Customer Segmentation

Customers were divided into different groups based on their purchasing behavior.

### Purchase Frequency

```text
0 orders       → No Purchase
1 order        → One-time
2–4 orders     → Occasional
5+ orders      → Loyal
```

### Spending Level

```text
0             → No Purchase
Below 1000    → Low
1000–5000     → Medium
Above 5000    → High
```

An RFM-style analysis was also performed using:

* **Recency** – how recently the customer purchased
* **Frequency** – how often the customer purchased
* **Monetary** – how much the customer spent

---

## 8. Python Reporting Tool

A simple Python reporting tool was created to make the reports easier to access.

The user can select different reports from a menu:

```text
1. Revenue
2. Top Customers
3. Monthly Revenue
4. Top Products
5. Customer Segments
```

The selected report runs the corresponding SQL query and displays the result in a table using the `tabulate` library.

Example revenue output:

```text
+-----------------+
|   total_revenue |
+=================+
|     6.40639e+07 |
+-----------------+
```

The revenue generated in the dataset was approximately **64 million**.

---

## 9. Edge Case Testing

The system was tested with different situations to make sure it handles unexpected input properly.

The following cases were checked:

* Invalid report name
* Empty query result
* Database/table error
* Customers with zero orders
* Single customer case
* Future order dates
* Negative quantities
* Invalid order IDs

The goal was to make the system handle these situations without crashing.

---

## Project Structure

```text
Week_8_ecommerce-analytics-system/
│
├── data/
│   ├── raw/
│   │   └── 01_generate_data.ipynb
│   │
│   └── cleaned/
│       └── 02_clean_data.ipynb
│
├── sql/
│   ├── 03_sql_database.ipynb
│   ├── 04_sql_analytics.ipynb
│   ├── 05_window_cte_analysis.ipynb
│   ├── 06_cohort_retention.ipynb
│   └── 07_customer_segmentation.ipynb
│
├── scripts/
│   └── report_cli.ipynb
│
├── tests/
│   └── 09_edge_case_testing.ipynb
│
├── output/
│   ├── 01_total_revenue.png
│   ├── 02_total_orders.png
│   ├── 03_monthly_revenue.png
│   ├── 04_top_10_products.png
│   ├── 05_category_performance.png
│   ├── 06_customer_revenue.png
│   ├── 07_customer_segmentation.png
│   ├── 08_return_analysis.png
│   ├── 09_average_order_value.png
│   └── 10_sales_by_region.png
│
└── README.md
```

---

## How to Run the Project

### Step 1: Generate the data

Open and run:

```text
data/raw/01_generate_data.ipynb
```

This creates the raw CSV files.

### Step 2: Clean the data

Open and run:

```text
data/cleaned/02_clean_data.ipynb
```

This cleans the raw datasets and creates the cleaned files.

### Step 3: Create the SQL tables

Open and run:

```text
sql/03_sql_database.ipynb
```

This creates the tables and loads the cleaned datasets into them.

### Step 4: Run SQL analysis

Open and run the notebooks in the `sql` folder:

```text
04_sql_analytics.ipynb
05_window_cte_analysis.ipynb
06_cohort_retention.ipynb
07_customer_segmentation.ipynb
```

### Step 5: Run the reporting tool

Open and run:

```text
scripts/report_cli.ipynb
```

Select the report you want from the menu.

### Step 6: Run edge case tests

Open and run:

```text
tests/09_edge_case_testing.ipynb
```

---

## Sample Reports

Sample chart outputs are stored in:

```text
output/
```

Includes:

* Total revenue
* Total orders
* Monthly revenue
* Top 10 products
* Category performance
* Customer revenue
* Customer segmentation
* Return analysis
* Average order value
* Sales by region

---

## What I Learned From This Project

Through this project, I worked on the complete data analytics workflow.

I learned how to:

* Generate and work with realistic datasets
* Clean data using Pandas
* Validate data quality
* Work with SQL tables
* Use SQL joins and aggregations
* Write CTEs and window functions
* Perform cohort and retention analysis
* Segment customers using RFM-style metrics
* Connect Python with SQL analysis
* Build a simple reporting tool
* Handle common edge cases

---

## Conclusion

This project demonstrates how raw e-commerce data can be transformed into useful business information.

Starting with raw and inconsistent data, the project goes through cleaning, validation, SQL analysis, customer segmentation, retention analysis, and finally reporting.

The main goal was to build a complete and practical analytics workflow rather than only writing individual SQL queries.

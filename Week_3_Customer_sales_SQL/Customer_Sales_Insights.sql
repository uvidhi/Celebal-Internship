-- ==========================================================
-- CUSTOMER SALES INSIGHTS
-- ==========================================================

-- Step 1: Create Database

CREATE DATABASE superstore_db;

USE superstore_db;

-- ==========================================================
-- Step 2: Create Raw Table
-- ==========================================================

CREATE TABLE superstore_raw (
    row_id INT,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);

-- ==========================================================
-- Step 3: Import Dataset
-- ==========================================================

LOAD DATA LOCAL INFILE '/Users/vidhiupadhyay/Documents/important/Week_3_/superstore_utf8.csv'
INTO TABLE superstore_raw
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    row_id,
    order_id,
    @order_date,
    @ship_date,
    ship_mode,
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    sales,
    quantity,
    discount,
    profit
)
SET
    order_date = STR_TO_DATE(@order_date,'%m/%d/%Y'),
    ship_date = STR_TO_DATE(@ship_date,'%m/%d/%Y');

-- Verify Import

SELECT COUNT(*) FROM superstore_raw;

-- ==========================================================
-- Step 4: Create Required Tables
-- ==========================================================

CREATE TABLE customers (
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50)
);

CREATE TABLE products (
    product_id VARCHAR(30),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255)
);

CREATE TABLE orders (
    row_id INT,
    order_id VARCHAR(30),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    product_id VARCHAR(30),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);

-- ==========================================================
-- Step 5: Insert Data
-- ==========================================================

INSERT INTO customers
SELECT DISTINCT
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region
FROM superstore_raw;

INSERT INTO products
SELECT DISTINCT
    product_id,
    category,
    sub_category,
    product_name
FROM superstore_raw;

INSERT INTO orders
SELECT DISTINCT
    row_id,
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    product_id,
    sales,
    quantity,
    discount,
    profit
FROM superstore_raw;

-- Verify Data

SELECT COUNT(*) FROM customers;

SELECT COUNT(*) FROM products;

SELECT COUNT(*) FROM orders;

-- ==========================================================
-- STEP 6 : Required Queries
-- ==========================================================

-- 1. Find all orders where sales are greater than average sales.

SELECT *
FROM orders
WHERE sales >
(
    SELECT AVG(sales)
    FROM orders
);

-- ==========================================================

-- 2. Find the highest sales order for each customer.

SELECT *
FROM orders o
WHERE sales =
(
    SELECT MAX(sales)
    FROM orders
    WHERE customer_id = o.customer_id
);

-- ==========================================================

-- 3. Calculate total sales for each customer.

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT *
FROM customer_sales
ORDER BY total_sales DESC;

-- ==========================================================

-- 4. Find customers whose total sales are above average.

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT *
FROM customer_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
);

-- ==========================================================

-- 5. Rank all customers based on total sales.

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT
    customer_id,
    total_sales,
    RANK() OVER(ORDER BY total_sales DESC) AS sales_rank
FROM customer_sales;

-- ==========================================================

-- 6. Assign row numbers to each order within a customer.

SELECT
    customer_id,
    order_id,
    sales,
    ROW_NUMBER() OVER
    (
        PARTITION BY customer_id
        ORDER BY sales DESC
    ) AS row_number
FROM orders;

-- ==========================================================

-- 7. Display Top 3 Customers based on Total Sales.

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
),
ranked_customers AS
(
    SELECT
        customer_id,
        total_sales,
        RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
    FROM customer_sales
)

SELECT *
FROM ranked_customers
WHERE sales_rank <= 3;
-- ==========================================================
-- STEP 7 : Final Combined Query
-- ==========================================================
WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT
    c.customer_name,
    cs.total_sales,
    RANK() OVER (ORDER BY cs.total_sales DESC) AS sales_rank
FROM customer_sales cs
JOIN customers c
ON cs.customer_id = c.customer_id
ORDER BY sales_rank;
-- ==========================================================
-- MINI PROJECT
-- ==========================================================

-- Top 5 Customers

SELECT
    customer_id,
    SUM(sales) AS total_sales
FROM orders
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- Bottom 5 Customers

SELECT
    customer_id,
    SUM(sales) AS total_sales
FROM orders
GROUP BY customer_id
ORDER BY total_sales ASC
LIMIT 5;

-- Customers Who Made Only One Order

SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(DISTINCT order_id)=1;

-- Customers with Above Average Sales

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT *
FROM customer_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
);

-- Highest Order Value Per Customer

SELECT
    customer_id,
    MAX(sales) AS highest_order_value
FROM orders
GROUP BY customer_id
ORDER BY highest_order_value DESC;
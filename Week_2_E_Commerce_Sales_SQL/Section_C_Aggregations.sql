use E_Commerce_Sales;
/* 
============================================================
   SECTION C – Aggregation (GROUP BY, SUM, COUNT, AVG, MIN, MAX)
============================================================ */
   
-- Q13: Count total number of orders
SELECT COUNT(order_id) AS Total_orders 
FROM orders;

-- Q14: Total revenue from delivered orders
SELECT SUM(total_amount) AS total_revenue
FROM orders
WHERE status = 'Delivered';

-- Q15: Average product price in each category
SELECT category , AVG(unit_price) AS Average_Price
FROM products
GROUP BY category;

-- Q16: Order status-wise count and total revenue (sorted)
SELECT status,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_revenue
FROM orders
GROUP BY status
ORDER BY total_revenue DESC;

-- Q17: Highest and lowest product price in each category
SELECT category,  MAX(unit_price) AS highest_price,
MIN(unit_price) AS lowest_price
FROM products 
GROUP BY category;

-- Q18: Categories where average price > 2000
SELECT category , AVG(unit_price) as Average_price
FROM products
GROUP BY category 
HAVING AVG(unit_price) > 2000;



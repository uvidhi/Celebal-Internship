USE E_Commerce_Sales;
/*
===============================================================================
SECTION B : FILTERING AND SORTING DATA
==============================================================================
*/

-- Q7: Retrieve all orders with status = 'Delivered'
SELECT * FROM orders
WHERE status = 'Delivered';

-- Q8: Products in Electronics category with price > 2000
SELECT * FROM products 
WHERE category = 'Electronics' AND unit_price > 2000;

-- Q9: Customers who joined in 2024 and are from Maharashtra
SELECT * FROM customers
WHERE join_date BETWEEN '2024-01-01' AND '2024-12-31' 
AND state = 'Maharashtra';

-- Q10: Orders between dates excluding cancelled orders
SELECT *
FROM orders
WHERE order_date BETWEEN '2024-08-10' AND '2024-08-25'
  AND status <> 'Cancelled';
  
-- Q11: Index explanation (idx_orders_date)
/*
The index idx_orders_date is created on the order_date column.

It improves performance by allowing the database to:
- Quickly locate rows for a specific date or range
- Avoid scanning the entire orders table (full table scan)

This is especially useful when the table is large and queries
frequently filter by order_date.
*/
-- Query that benefits from index
SELECT *
FROM orders
WHERE order_date = '2024-08-15';


-- Q12: Index usage with function (SARGable vs Non-SARGable)
/*
When we use a function on a column (like YEAR(join_date)),
the index on join_date is NOT used efficiently because:
- The database must apply the function to every row
- So it cannot directly use the index for searching
*/
-- NON-SARGABLE (index not used properly)
SELECT *
FROM customers
WHERE YEAR(join_date) = 2024;
-- INDEX-FRIENDLY (SARGABLE query)
SELECT *
FROM customers
WHERE join_date BETWEEN '2024-01-01' AND '2024-12-31';   


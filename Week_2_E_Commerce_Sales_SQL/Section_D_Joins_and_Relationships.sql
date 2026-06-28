USE E_Commerce_Sales;
/* 
=========================================================
   SECTION D — JOINS & RELATIONSHIPS
=========================================================
*/

-- Q19: INNER JOIN - Orders with customer details
SELECT o.order_id,o.order_date,
       c.first_name,c.last_name,
       o.total_amount
FROM orders o 
INNER JOIN customers c
 ON o.customer_id=c.customer_id;
 
-- Q20: LEFT JOIN - All customers with their orders (if any)
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;
    
-- Q21: JOIN across 3 tables (orders → order_items → products)
SELECT 
    o.order_id,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    oi.discount_pct
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id;
    
-- Q22: LEFT JOIN vs RIGHT JOIN + FULL OUTER JOIN

/*
LEFT JOIN
- Returns all records from the left table.
- Returns matching records from the right table.
- If no matching record exists, the right table columns contain NULL values.

RIGHT JOIN
- Returns all records from the right table.
- Returns matching records from the left table.
- If no matching record exists, the left table columns contain NULL values.

FULL OUTER JOIN
- Returns all matching records along with all unmatched records
  from both tables.
- Missing values from either table are displayed as NULL.

NOTE:
- MySQL does not support FULL OUTER JOIN directly.
- It can be achieved by combining:
  LEFT JOIN
  UNION
  RIGHT JOIN
*/

-- Example: LEFT JOIN
-- Displays all customers, including those who have not placed any orders.
SELECT
    c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- Example: RIGHT JOIN
-- Displays all orders, including those that do not have a matching customer.
SELECT
    c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- Q23: FOREIGN KEY RELATIONSHIPS
/* 
FOREIGN KEYS IN THIS SCHEMA:

1. orders.customer_id → customers.customer_id
   (Every order must belong to a valid customer)

2. order_items.order_id → orders.order_id
   (Every order item must belong to a valid order)

3. order_items.product_id → products.product_id
   (Every order item must belong to a valid product)
   
EXAMPLE:
   
Let’s say in customers table we have:

customer_id = 1 → Asha
customer_id = 2 → Rahul

Now in orders table:

order_id = 101 is placed by customer_id = 1 (Asha)
So this is VALID because Asha exists.

-- WHAT IF WE DO WRONG INSERT?

We try to insert:

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (102, 999, '2026-06-28', 1000);

But here:
customer_id = 999

And in real customers table:
There is NO customer with id 999.

-- WHAT WILL HAPPEN?
   The database will reject this insert
   It will show FOREIGN KEY constraint error
   
-- WHY?
   Because the database does not allow an order to exist without a valid customer.
   It avoids “fake or broken links” between tables.
   IN SHORT : If the customer does not exist, then the order cannot be created.

*/
   

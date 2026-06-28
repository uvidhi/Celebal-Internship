USE E_Commerce_Sales;
/*
===============================================================================
SECTION E — ADVANCED CONCEPTS (CASE, ACID, TRANSACTIONS)
===============================================================================
*/

-- Q24: CASE - Classify products into price tiers
SELECT product_name, 
       unit_price,
       CASE 
           WHEN unit_price < 1000 THEN 'Budget'
           WHEN unit_price BETWEEN 1000 AND 3000 THEN 'Mid-Range'
           ELSE 'Premium'
       END AS price_tier
FROM products;

-- Q25: CASE inside aggregate - Delivered vs Not Delivered orders
SELECT 
    SUM(CASE WHEN status = 'Delivered' THEN 1 ELSE 0 END) AS delivered_orders,
    SUM(CASE WHEN status <> 'Delivered' THEN 1 ELSE 0 END) AS not_delivered_orders
FROM orders;

-- Q26: ACID Properties
/*
ACID stands for the four important properties that make sure
a database transaction is safe and reliable.

A - Atomicity:
This means "all or nothing".
If one part of a transaction fails, the whole transaction fails.

C - Consistency:
The database should always remain in a valid state before and after a transaction.

I - Isolation:
Each transaction works independently.

D - Durability:
Once committed, data is permanently saved even after system crash.
*/

-- Q27: SQL TRANSACTION (Atomic Operation)
START TRANSACTION;

INSERT INTO orders (
    order_id,
    customer_id,
    order_date,
    status,
    total_amount
)
VALUES (
    1011,
    102,
    CURDATE(),
    'Pending',
    1598.00
);

INSERT INTO order_items (
    item_id,
    order_id,
    product_id,
    quantity,
    unit_price,
    discount_pct
)
VALUES 
(6001, 1011, 201, 2, 1499.00, 0),
(6002, 1011, 202, 1, 799.00, 0);

UPDATE products
SET stock_qty = stock_qty - 2
WHERE product_id = 201;

UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 202;

COMMIT;

-- If anything fails, ROLLBACK ensures no partial data is saved
-- ROLLBACK;

USE E_Commerce_Sales;
/*
===============================================================================
SECTION A : SQL BASICS (SELECT, CONSTRAINTS, PRIMARY KEYS)
===============================================================================
*/

-- Q1: Display all columns and rows from the customers table 
SELECT * FROM customers;

-- Q2: Retrieve first_name, last_name, and city of all customers
SELECT first_name, last_name,city FROM customers;

-- Q3: List all unique categories in products table
SELECT DISTINCT category FROM products;

-- Q4: Primary Keys of each table + explanation
/*
PRIMARY KEYS IN SCHEMA :

customers      → customer_id
products       → product_id
orders         → order_id
order_items    → item_id

EXPLANATION :

- A Primary Key uniquely identifies each record in a table.
- It must be UNIQUE so that each record has its own identifier.
- It cannot be NULL because every record must have a valid ID.
- It helps maintain data integrity by preventing duplicate or missing records.
- It is also used to establish relationships between tables through Foreign Keys.

EXAMPLE :

Suppose the products table contains the following records:

product_id | product_name
-----------|--------------------
201        | Wireless Earbuds
202        | Cotton T-Shirt

If we insert a new product with product_id = 203, the record is inserted
successfully because 203 is a new and unique ID.

If we try to insert another product with product_id = 201, the database
returns an error because this ID is already assigned to another product.
Each product must have a unique ID so that it can be identified correctly.

Similarly, if we insert product_id = NULL, the database returns an error
because every product must have a valid ID. Without a Primary Key, the
database cannot identify the product or maintain proper relationships
with other tables.
*/

-- Q5: Constraints on email column + duplicate email behavior
/*
CONSTRAINTS APPLIED TO THE EMAIL COLUMN

- NOT NULL : Ensures that every customer has an email address. A record
  cannot be inserted if the email value is NULL.

- UNIQUE : Ensures that each email address is different. No two customers
  can have the same email address.

EXAMPLE:

customers table:

customer_id | email
-----------------------------
101         | rahul@gmail.com

If we try inserting:
rahul@gmail.com again → ERROR (duplicate email not allowed)
*/

-- Q6: Insert product with unit_price = -50 (CHECK constraint violation)

INSERT INTO products
(
    product_id,
    product_name,
    category,
    brand,
    unit_price,
    stock_qty
)
VALUES
(
    209,
    'Gaming Mouse',
    'Electronics',
    'Logitech',
    -50,
    100
);
/*

EXPLANATION

The database rejects this record because the unit_price is -50, which
violates the following CHECK constraint:

CHECK (unit_price > 0)

This constraint ensures that every product has a positive price. Since
-50 is less than 0, the INSERT operation fails and the record is not
added to the products table.

Expected Result:
The database returns an error because the value of unit_price does not
satisfy the CHECK constraint.
*/



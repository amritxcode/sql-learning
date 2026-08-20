USE shop_db;

-- ============================================================
-- DAY 6: CASE, CTEs, GROUP BY, HAVING, JOIN
-- ============================================================


-- Q1. Age Classification
-- Classify customers based on age.

SELECT
    name,
    age,
    CASE
        WHEN age < 25 THEN 'Young'
        WHEN age BETWEEN 25 AND 29 THEN 'Adult'
        ELSE 'Senior'
    END AS age_group
FROM customers;

-- Q2. Order Classification
-- Classify orders based on amount.

SELECT
    order_id,
    amount,
    CASE
        WHEN amount < 500 THEN 'Small'
        WHEN amount BETWEEN 500 AND 999 THEN 'Medium'
        ELSE 'Large'
    END AS order_size
FROM orders;


-- Q3. Count Orders by Category
-- Count how many orders belong to each size category.

SELECT
    CASE
        WHEN amount < 500 THEN 'Small'
        WHEN amount BETWEEN 500 AND 999 THEN 'Medium'
        ELSE 'Large'
    END AS order_size,
    COUNT(order_id) AS order_count
FROM orders
GROUP BY order_size;


-- Q4. Basic CTE
-- Calculate total spending for each customer
-- and store the result temporarily as customer_spending.

WITH customer_spending AS (
    SELECT
        customer_id,
        SUM(amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM customer_spending;


-- Q5. CTE + JOIN
-- Display customer names along with their total spending.

WITH customer_spending AS (
    SELECT
        customer_id,
        SUM(amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)
SELECT
    customers.name,
    customer_spending.total_spending
FROM customers
INNER JOIN customer_spending
    ON customers.customer_id = customer_spending.customer_id;
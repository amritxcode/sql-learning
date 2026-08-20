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


-- Q6. CTE + Filtering
-- Display customers whose total spending is greater than 1000.

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
    ON customers.customer_id = customer_spending.customer_id
WHERE customer_spending.total_spending > 1000
ORDER BY customer_spending.total_spending DESC;


-- Q7. Customer Classification
-- Classify customers based on their total spending.

WITH customer_spending AS (
    SELECT
        customer_id,
        SUM(amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)
SELECT
    customers.name,
    customer_spending.total_spending,
    CASE
        WHEN customer_spending.total_spending >= 2000 THEN 'Premium'
        WHEN customer_spending.total_spending >= 1000 THEN 'Regular'
        ELSE 'Basic'
    END AS customer_type
FROM customers
INNER JOIN customer_spending
    ON customers.customer_id = customer_spending.customer_id;


-- Q8. Final Day 6 Challenge
-- Display customers with:
-- name, city, total spending, order count, customer type
-- Only Premium and Regular customers.
-- Sort by spending from highest to lowest.

WITH customer_stats AS (
    SELECT
        customer_id,
        SUM(amount) AS total_spending,
        COUNT(order_id) AS order_count
    FROM orders
    GROUP BY customer_id
)
SELECT
    customers.name,
    customers.city,
    customer_stats.total_spending,
    customer_stats.order_count,
    CASE
        WHEN customer_stats.total_spending >= 2000 THEN 'Premium'
        WHEN customer_stats.total_spending >= 1000 THEN 'Regular'
        ELSE 'Basic'
    END AS customer_type
FROM customers
INNER JOIN customer_stats
    ON customers.customer_id = customer_stats.customer_id
WHERE customer_stats.total_spending >= 1000
ORDER BY customer_stats.total_spending DESC;
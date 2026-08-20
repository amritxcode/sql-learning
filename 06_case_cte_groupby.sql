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
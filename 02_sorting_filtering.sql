-- ORDER BY

-- Q1. Display all customers from youngest to oldest.

SELECT *
FROM customers
ORDER BY age ASC;


-- Q2. Display all customers from oldest to youngest.

SELECT *
FROM customers
ORDER BY age DESC;


-- Q3. Display names and ages sorted by age descending.

SELECT name, age
FROM customers
ORDER BY age DESC;


-- Q4. Display customers alphabetically by name.

SELECT *
FROM customers
ORDER BY name ASC;


-- LIMIT

-- Q5. Display the 3 youngest customers.

SELECT *
FROM customers
ORDER BY age ASC
LIMIT 3;


-- Q6. Display the 3 oldest customers.

SELECT *
FROM customers
ORDER BY age DESC
LIMIT 3;


-- Q7. Display the first 5 customers alphabetically by name.

SELECT *
FROM customers
ORDER BY name ASC
LIMIT 5;


-- DISTINCT

-- Q8. Display all different cities.

SELECT DISTINCT city
FROM customers;


-- Q9. Display all different ages.

SELECT DISTINCT age
FROM customers;


-- LIKE

-- Q10. Find customers whose name starts with A.

SELECT *
FROM customers
WHERE name LIKE 'A%';


-- Q11. Find customers whose name starts with R.

SELECT *
FROM customers
WHERE name LIKE 'R%';


-- Q12. Find customers whose name contains 'a'.

SELECT *
FROM customers
WHERE name LIKE '%a%';


-- Q13. Find customers whose email ends with '.com'.

SELECT *
FROM customers
WHERE email LIKE '%.com';


-- NULL

-- Add a customer with no city.

INSERT INTO customers (customer_id, name, email, city, age)
VALUES (9, 'Vikram', 'vikram@gmail.com', NULL, 25);


-- Q14. Find customers whose city is NULL.

SELECT *
FROM customers
WHERE city IS NULL;


-- Q15. Find customers whose city is NOT NULL.

SELECT *
FROM customers
WHERE city IS NOT NULL;


-- Combination Queries

-- Q16. Find the 3 oldest customers from Delhi.

SELECT *
FROM customers
WHERE city = 'Delhi'
ORDER BY age DESC
LIMIT 3;


-- Q17. Find customers whose name contains 'a',
-- sort them from oldest to youngest,
-- and return only the first 2.

SELECT *
FROM customers
WHERE name LIKE '%a%'
ORDER BY age DESC
LIMIT 2;
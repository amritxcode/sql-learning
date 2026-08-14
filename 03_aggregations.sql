-- Day 3: Aggregations and GROUP BY

-- COUNT

-- Q1. Count all customers.

SELECT COUNT(*)
FROM customers;


-- Q2. Count customers who have a city recorded.

SELECT COUNT(city)
FROM customers;


-- SUM

-- Q3. Find the total order amount.

SELECT SUM(amount)
FROM orders;


-- AVG

-- Q4. Find the average customer age.

SELECT AVG(age)
FROM customers;


-- MIN

-- Q5. Find the youngest customer age.

SELECT MIN(age)
FROM customers;


-- MAX

-- Q6. Find the oldest customer age.

SELECT MAX(age)
FROM customers;


-- Multiple Aggregations

-- Q7. Find the total number of customers,
-- average age, youngest age and oldest age.

SELECT
    COUNT(*) AS total_customers,
    AVG(age) AS average_age,
    MIN(age) AS youngest_age,
    MAX(age) AS oldest_age
FROM customers;


-- Orders

-- Q8. Find the average order amount.

SELECT AVG(amount)
FROM orders;


-- Q9. Find the smallest order amount.

SELECT MIN(amount)
FROM orders;


-- Q10. Find the largest order amount.

SELECT MAX(amount)
FROM orders;


-- Q11. Count the total number of orders.

SELECT COUNT(order_id)
FROM orders;


-- Q12. Find the total amount and average order amount.

SELECT
    SUM(amount) AS total_amount,
    AVG(amount) AS average_amount
FROM orders;


-- GROUP BY

-- Q13. Find the number of customers in each city.

SELECT city, COUNT(*)
FROM customers
GROUP BY city;


-- Q14. Find the average age of customers in each city.

SELECT city, AVG(age)
FROM customers
GROUP BY city;


-- Q15. Find the total amount spent by each customer.

SELECT customer_id, SUM(amount)
FROM orders
GROUP BY customer_id;


-- Q16. Find the number of orders placed by each customer.

SELECT customer_id, COUNT(order_id)
FROM orders
GROUP BY customer_id;


-- HAVING

-- Q17. Find customers who have placed more than one order.

SELECT customer_id, COUNT(order_id)
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;


-- Q18. Find cities with at least 2 customers.

SELECT city, COUNT(*)
FROM customers
GROUP BY city
HAVING COUNT(*) >= 2;


-- Q19. Find cities where the average customer age is greater than 24.

SELECT city, AVG(age)
FROM customers
GROUP BY city
HAVING AVG(age) > 24;


-- Q20. Find cities that have at least 2 customers
-- and show their average age.

SELECT city, AVG(age)
FROM customers
GROUP BY city
HAVING COUNT(city) >= 2;
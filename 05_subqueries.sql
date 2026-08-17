-- DAY 5: SUBQUERIES


-- Q1. Find customers older than the average customer age.

SELECT *
FROM customers
WHERE age > (
    SELECT AVG(age)
    FROM customers
);


-- Q2. Find customers whose age is equal to the oldest age.

SELECT *
FROM customers
WHERE age = (
    SELECT MAX(age)
    FROM customers
);


-- Q3. Find customers whose age is equal to the youngest age.

SELECT *
FROM customers
WHERE age = (
    SELECT MIN(age)
    FROM customers
);


-- Q4. Find customers who have placed at least one order.

SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);


-- Q5. Find customers who have never placed an order.

SELECT *
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM orders
);


-- Q6. Find customers older than the average age.
-- Display name and age.

SELECT name, age
FROM customers
WHERE age > (
    SELECT AVG(age)
    FROM customers
);


-- Q7. Find orders whose amount is greater than the average order amount.

SELECT order_id, customer_id, amount
FROM orders
WHERE amount > (
    SELECT AVG(amount)
    FROM orders
);


-- Q8. Find orders having the highest order amount.

SELECT *
FROM orders
WHERE amount = (
    SELECT MAX(amount)
    FROM orders
);


-- Q9. Find customers whose total spending is greater than
-- the average customer spending.

SELECT name, total_spending
FROM (
    SELECT customers.customer_id,
           customers.name,
           SUM(orders.amount) AS total_spending
    FROM customers
    INNER JOIN orders
    ON customers.customer_id = orders.customer_id
    GROUP BY customers.customer_id, customers.name
) AS spending
WHERE total_spending > (
    SELECT AVG(total_spending)
    FROM (
        SELECT SUM(amount) AS total_spending
        FROM orders
        GROUP BY customer_id
    ) AS customer_spending
);


-- Q10. Find customers whose total spending is greater than Amrit's spending.

SELECT name, total_spending
FROM (
    SELECT customers.customer_id,
           customers.name,
           SUM(orders.amount) AS total_spending
    FROM customers
    INNER JOIN orders
    ON customers.customer_id = orders.customer_id
    GROUP BY customers.customer_id, customers.name
) AS spending
WHERE total_spending > (
    SELECT SUM(orders.amount)
    FROM orders
    INNER JOIN customers
    ON customers.customer_id = orders.customer_id
    WHERE customers.name = 'Amrit'
);


-- Q11. Find customers older than the average age of customers
-- from Rourkela.

SELECT name, city, age
FROM customers
WHERE age > (
    SELECT AVG(age)
    FROM customers
    WHERE city = 'Rourkela'
);


-- Q12. Find orders whose amount is greater than the average
-- order amount of that same customer.

SELECT o1.*
FROM orders AS o1
WHERE o1.amount > (
    SELECT AVG(o2.amount)
    FROM orders AS o2
    WHERE o2.customer_id = o1.customer_id
);


-- Q13. Find customers who have placed at least 2 orders
-- using a subquery.

SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(order_id) >= 2
);


-- Q14. Find the customer with the highest total spending.

SELECT name, total_spending
FROM (
    SELECT customers.name,
           SUM(orders.amount) AS total_spending
    FROM customers
    INNER JOIN orders
    ON customers.customer_id = orders.customer_id
    GROUP BY customers.customer_id, customers.name
) AS spending
WHERE total_spending = (
    SELECT MAX(total_spending)
    FROM (
        SELECT SUM(amount) AS total_spending
        FROM orders
        GROUP BY customer_id
    ) AS customer_totals
);


-- Q15. Find the restaurant with the highest total revenue.

SELECT restaurant_name, city, total_revenue
FROM (
    SELECT restaurants.restaurant_id,
           restaurants.restaurant_name,
           restaurants.city,
           SUM(orders.amount) AS total_revenue
    FROM restaurants
    INNER JOIN orders
    ON restaurants.restaurant_id = orders.resturant_id
    GROUP BY restaurants.restaurant_id,
             restaurants.restaurant_name,
             restaurants.city
) AS restaurant_revenue
WHERE total_revenue = (
    SELECT MAX(total_revenue)
    FROM (
        SELECT SUM(amount) AS total_revenue
        FROM orders
        GROUP BY resturant_id
    ) AS revenues
);
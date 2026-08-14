-- SQL Basics

-- Database Setup

CREATE DATABASE shop_db;

USE shop_db;


-- Create Table

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    city VARCHAR(50),
    age INT
);


-- Insert Data

INSERT INTO customers (customer_id, name, email, city, age)
VALUES
(1, 'Amrit', 'amrit@gmail.com', 'Bhubaneswar', 21),
(2, 'Rahul', 'rahul@gmail.com', 'Delhi', 24),
(3, 'Priya', 'priya@gmail.com', 'Mumbai', 22),
(4, 'Arjun', 'arjun@gmail.com', 'Bangalore', 27),
(5, 'Sneha', 'sneha@gmail.com', 'Bhubaneswar', 23),
(6, 'Karan', 'karan@gmail.com', 'Delhi', 31),
(7, 'Neha', 'neha@gmail.com', 'Pune', 26),
(8, 'Rohan', 'rohan@gmail.com', 'Mumbai', 29);


-- SELECT / FROM

-- Q1. Display all customer names.

SELECT name
FROM customers;


-- Q2. Display customer names and cities.

SELECT name, city
FROM customers;


-- Q3. Display customer names and ages.

SELECT name, age
FROM customers;


-- Q4. Display customer names, emails and cities.

SELECT name, email, city
FROM customers;


-- WHERE

-- Q5. Display customers older than 25.

SELECT *
FROM customers
WHERE age > 25;


-- Q6. Display customers younger than 25.

SELECT *
FROM customers
WHERE age < 25;


-- Q7. Display customers from Mumbai.

SELECT *
FROM customers
WHERE city = 'Mumbai';


-- Q8. Display customers aged exactly 22.

SELECT *
FROM customers
WHERE age = 22;


-- Q9. Display customers aged 27 or older.

SELECT *
FROM customers
WHERE age >= 27;


-- AND / OR

-- Q10. Display customers from Delhi or Mumbai.

SELECT *
FROM customers
WHERE city = 'Delhi'
OR city = 'Mumbai';


-- Q11. Display customers from Bhubaneswar and age greater than 21.

SELECT *
FROM customers
WHERE city = 'Bhubaneswar'
AND age > 21;


-- IN / BETWEEN

-- Q12. Display customers aged between 22 and 27.

SELECT *
FROM customers
WHERE age BETWEEN 22 AND 27;


-- Q13. Display customers who are not from Delhi.

SELECT *
FROM customers
WHERE city NOT IN ('Delhi');


-- Q14. Display customers from Delhi, Mumbai or Pune.

SELECT *
FROM customers
WHERE city IN ('Delhi', 'Mumbai', 'Pune');
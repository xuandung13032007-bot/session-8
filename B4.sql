CREATE DATABASE HDBC;
USE HDBC;
create table Products(
product_id INT Primary key auto_increment,
product_name DECIMAL(10,2),
category VARCHAR(200)
);
create table Orders(
order_id INT Primary key auto_increment,
customer_id int not null,
order_date DATE,
total_amount DECIMAL(12,2)
)
SELECT category, COUNT(*) AS number_of_products
FROM Products
GROUP BY category;
SELECT customer_id, SUM(total_amount) AS total_spent
FROM Orders
GROUP BY customer_id;
SELECT category, COUNT(*) AS product_count, AVG(price) AS avg_price,MAX (pric) AS max_price,MIN(price) AS min_price 
FROM Products
GROUP BY category;
SELECT customer_id, SUM(total_amount) AS total_spent
FROM Orders 
GROUP BY customer_id
HAVING SUM(total_amount) >1000;
SELECT category, COUNT(*) AS product_count
FROM Products 
GROUP BY category
HAVING COUNT(*)>5;
SELECT customer_id,SUM(total_amount) AS total_spent
FROM Orders 
GROUP BY customer_id 
ORDER BY total_spent DESC 
LIMIT 3;


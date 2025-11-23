CREATE DATABASE Orders;
USE Orders;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    quantity INT,
    price INT, 
    country VARCHAR(50)
);
INSERT INTO Orders (order_id, product_name, quantity, price, country) VALUES
(1, 'Laptop A', 2, 25000000, 'Vietnam'),
(2, 'Mouse B', 5, 250000, 'Singapore'),
(3, 'Keyboard C', 3, 750000, 'Vietnam'),
(4, 'Monitor D', 1, 5000000, 'Japan'),
(5, 'Laptop A', 1, 25000000, 'Vietnam'),
(6, 'Mouse B', 4, 250000, 'Japan');
SELECT COUNT(order_id) AS total_orders
FROM Orders;
SELECT SUM(quantity) AS total_quantity_sold
FROM Orders;
SELECT AVG(price) AS average_price
FROM Orders;
SELECT MIN(price) AS lowest_price
FROM Orders;
SELECT MAX(price) AS highest_price
FROM Orders;
SELECT
    country,
    COUNT(order_id) AS number_of_orders
FROM Orders
GROUP BY country;
SELECT
    country,
    AVG(price) AS average_price_per_country
FROM Orders
GROUP BY country;
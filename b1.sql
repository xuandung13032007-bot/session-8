create database prd;
use prd;
create table Products(
product_id INT Primary key auto_increment,
product_name VARCHAR(150) not null,
price DECIMAL not null,
stock_quantity INT
);
create table Customers(
customer_id INt Primary key,
customer_name VARCHAR(50) not null,
city VARCHAR(50)
);
create table Orders(
order_id INT Primary key auto_increment,
customer_id int not null,
foreign key (customer_id) references Customers(customer_id),
order_date DATE,
total_amount DECIMAL(12,2)
);
select count(*) as total_products
from Products;
select sum(total_amount) as total_revenue
from Orders;
select avg(price) as average_price
from Products;
select max(total_amount) as max_order_amount
from Orders;
select min(total_amount) as min_order_amount
from Orders;
select count(*) as hanoi_customers_count
from Customers
where city="Hanoi";


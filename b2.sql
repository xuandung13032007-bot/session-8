create database EPY;
use EPY;
create table Employees(
employee_id INT Primary key auto_increment,
full_name VARCHAR(150) not null unique,
department VARCHAR(150) not null,
salary DECIMAL(10,2),
hire_date DATE
);
select count(*) as number_of_employees
from Employees;
select sum(salary) as total_monthly_salary
from Employees;
select avg(salary) as average_salary
from Employees;
select max(salary) as lowest_salary
from  Employees;
select min(hire_date) as earliest_hire_date
from Employees;
select department, sum(salary)  as it_department_salary
from Employees 
where department='IT';

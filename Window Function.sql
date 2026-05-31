
create database companys;
use companys;

create table sales(emp_id int, emp_name varchar(30), month varchar(10), sale int);

insert into sales values
(1,'amit','jan',5000),
(1,'amit','feb',7000),
(1,'amit','mar',6000),
(2,'rahul','jan',8000),
(2,'rahul','feb',9000),
(3,'neha','jan',4000);

# 1. show rank of employees by sale

select emp_name, sale,
rank() over(order by sale desc) as rnk
from sales;

# 2. show dense rank by sale

select emp_name, sale,
dense_rank() over(order by sale desc) as drnk
from sales;

# 3. give row number to each record

select emp_name, sale,
row_number() over(order by sale desc) as rn
from sales;

# 4. show running total of sales

select emp_name, month, sale,
sum(sale) over(order by month) as total_sale
from sales;

# 5. show average sale of each employee

select emp_name, sale,
avg(sale) over(partition by emp_id) as avg_sale
from sales;

# 6. show previous sale of employee

select emp_name, month, sale,
lag(sale) over(partition by emp_id order by month) as prev_sale
from sales;

# 7. show next sale of employee

select emp_name, month, sale,
lead(sale) over(partition by emp_id order by month) as next_sale
from sales;

# 8. show highest sale of each employee

select emp_name, sale,
max(sale) over(partition by emp_id) as max_sale
from sales;

# 9. show lowest sale of each employee

select emp_name, sale,
min(sale) over(partition by emp_id) as min_sale
from sales;

# 10. show second highest sale

select emp_name,sale,
dense_rank() over(order by sale desc) as rnk
from sales;
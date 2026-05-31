create database company_db;
use company_db;

create table employee(
id int primary key,
name varchar(50),
department varchar(50),
salary int
);

insert into employee values
(1,'alice','hr',30000),
(2,'bob','it',45000),
(3,'charlie','finance',50000),
(4,'david','it',40000),
(5,'emma','hr',35000),
(6,'john','marketing',38000),
(7,'mike','finance',55000),
(8,'sophia','it',42000),
(9,'olivia','hr',32000),
(10,'liam','marketing',47000);

select * from employee;

# q1: create function to return minimum salary

delimiter //
create function minimum_salary()
returns int
deterministic
begin
declare min_sal int;
select min(salary) into min_sal from employee;
return min_sal;
end //
delimiter ;

select minimum_salary();


# q2: create function to return employee name by id

delimiter //
create function employee_name(emp_id int)
returns varchar(50)
deterministic
begin
declare emp_name varchar(50);
select name into emp_name from employee where id=emp_id;
return emp_name;
end //
delimiter ;

select employee_name(1);


# q3: create function to calculate double salary

delimiter //
create function double_salary(salary_amount int)
returns int
deterministic
begin
return salary_amount*2;
end //
delimiter ;

select double_salary(30000);


# q4: create function to calculate tax (5% of salary)

delimiter //
create function calculate_tax(salary_amount int)
returns int
deterministic
begin
return salary_amount*0.05;
end //
delimiter ;

select calculate_tax(50000);


# q5: create function to check whether a number is even or odd

delimiter //
create function even_odd(num int)
returns varchar(10)
deterministic
begin
if num%2=0 then
return 'even';
else
return 'odd';
end if;
end //
delimiter ;

select even_odd(15);


# q6: create function to return length of employee name

delimiter //
create function name_length(emp_name varchar(50))
returns int
deterministic
begin
return length(emp_name);
end //
delimiter ;

select name_length('alice');


# q7: create function to return total salary of all employees

delimiter //
create function total_salary()
returns int
deterministic
begin
declare total_sal int;
select sum(salary) into total_sal from employee;
return total_sal;
end //
delimiter ;

select total_salary();


# q8: create function to convert employee name into uppercase

delimiter //
create function upper_name(emp_name varchar(50))
returns varchar(50)
deterministic
begin
return upper(emp_name);
end //
delimiter ;

select upper_name('alice');


# q9: create function to return count of employees in it department

delimiter //
create function it_employee_count()
returns int
deterministic
begin
declare total_it int;
select count(*) into total_it from employee where department='IT';
return total_it;
end //
delimiter ;

select it_employee_count();


# q10: create function to check whether employee exists or not

delimiter //
create function employee_exists(emp_id int)
returns varchar(20)
deterministic
begin
declare emp_count int;
select count(*) into emp_count from employee where id=emp_id;
if emp_count>0 then
return 'exists';
else
return 'not exists';
end if;
end //
delimiter ;

select employee_exists(3);
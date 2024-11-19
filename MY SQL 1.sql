use company;

create table employees(
id INT Primary Key Auto_Increment,
name VARCHAR (50),
position VARCHAR (10),
salary DECIMAL(10),
date_of_joining date
);
Insert into employees(id,name,position,salary,date_of_joining)
Values(1,"John Doe","Manager",55000.00,"2020-01-15"),
(2,"Jane Smith","Developer",48000.00,"2019-07-10"),
(3,"Alice Johnson","Designer",45000.00,"2021-03-22"),
(4,"Bob Brown","Developer",50000.00,"2018-11-01");
select * from employees;

select * from employees where position = "Developer";
update employees set salary = 46000.00 where name="Alice johnson";
set sql_safe_updates=0;
delete from employees where name ="Bob Brown"; 
select * from employees where salary > 48000.00;
alter table employees
add email varchar(20);

update employees set email = "john.doe@company.com" where id = 1;
select name, salary from employees;
select * from employees order by salary desc;


alter table employees
drop email;
select * from employees;

select name from employees order by salary desc limit 1;

select count(date_of_joining) from employees where date_of_joining>"2020-01-01";





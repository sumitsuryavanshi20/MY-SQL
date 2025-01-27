create database sem;
use sem;
create table company(
id int,
name Varchar(50),
position Varchar(50),
salary int,
date_of_joining date);
insert into company(id, name, position, salary, date_of_joining)
values(1, "John Doe", "Manager", 55000, "2020-01-15"),
(2, "Jane Smith", "Developer", 48000, "2019-07-10"),
(3, "Alice Johnson", "Designer", 45000, "2021-03-22"),
(4, "Bob Brown", "Developer", 50000, "2018-11-01");
select * from company;

#Write a query to retrieve all employees who are Developers.
select * from company where position = "Developer";

#Write a query to update the salary of Alice Johnson to 46000.00.
SET SQL_SAFE_UPDATES = 0;
update company set Salary = 46000 where name = "Alice Johnson";

#Write a query to delete the employee record for Bob Brown.
delete from company where id = 4;

##Write a query to find the employees who have a salary greater than 48000.
select * from company where salary > 48000;

#Write a query to add a new column email to the employees table.
Alter table company add column Email varchar(100);

#Write a query to update the email for John Doe to john.doe@company.com.
update company set Email = "john.doe@company.com" where name = "John Doe";

#Write a query to retrieve only the name and salary of all employees.
Select name, salary from company;

#Write a query to count the number of employees who joined after January 1, 2020.
select count(name) from company where date_of_joining > 2020;

#Write a query to order the employees by salary in descending order.
select * from company order by salary DESC;

#Write a query to drop the email column from the employees table.
Alter table company
drop Column Email; 

#Write a query to find the employee with the highest salary.
select max(salary) from company;
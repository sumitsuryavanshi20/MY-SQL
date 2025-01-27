create database ASSIGNMENT3;
use ASSIGNMENT3;
create table ASSIGNMENT(
emp_id int primary key,
first_name varchar(50),
last_name Varchar(50),
department varchar(50),
salary int, 
hire_date int);
insert into ASSIGNMENT (emp_id, first_name, last_name, department, salary, hire_date)
values
(1,"John","Doe","IT",60000,2019-01-10),
(2,"Jane","Smith","HR",55000,2018-03-05),
(3,"Emily","Jones","IT",62000,2020-07-23),
(4,"Michael","Browm","Finance",70000,2016-05-14),
(5,"Sarah","Davis","Finance",69000,2017-11-18),
(6,"David","Johnson","HR",48000,2021-09-10);
select * from ASSIGNMENT;

#1. Find the average salary of employees in each department. 
select department, avg(salary) from ASSIGNMENT group by department;

#2. Find the total number of employees hired after 2019. 
select count(first_name) from ASSIGNMENT where hire_date > "2019-01-10";

#3. List the departments and the total salary of all employees in each department, ordered by the total salary.
select department, sum(salary) from ASSIGNMENT group by department order by "salary" desc;
SELECT department, SUM(salary) AS total_salary from ASSIGNMENT GROUP BY department ORDER BY total_salary DESC;

#4. Find the highest salary in the Finance department. 
select department, sum(salary)as  " the total salary of all employees in each department" from ASSIGNMENT group by department order by sum(salary);

#5. Get the top 3 highest-paid employees. 
select first_name, last_name, salary from ASSIGNMENT order by salary DESC limit 3;

#6. Find the department with the minimum average salary.  
SELECT Department, AVG(Salary) AS Avg_Salary from ASSIGNMENT GROUP BY Department ORDER BY Avg_Salary ASC LIMIT 1;


#7. Display the total number of employees in each department, ordered by the number of employees. 
select emp_id,concat(first_name, " ", last_name)as employee_name, salary from ASSIGNMENT order by "salary" DESC limit 3;

#8. Find the average salary of employees who were hired before 2020.  
select department from ASSIGNMENT group by department order by avg(salary) ASC limit 3;

#9. List the names of employees in the IT department ordered by hire date, with the most recently hired employees first. 
select department, count(*) as employee_count from ASSIGNMENT group by department order by employee_count ASC;

#10. Find the sum of salaries for all employees hired after January 1, 2019, ordered by salary. 
select avg(salary) as "average salary" from ASSIGNMENT  where hire_date < '2020-01-01';

#11. Get the employee with the lowest salary in the HR department. 
select concat(first_name,"",last_name)as employee_name from ASSIGNMENT where department = 'HR' order by hire_date;

#12. Find the total salary paid to employees in each department, but limit the result to the top 2 highest-paying departments. 
SELECT Department, SUM(Salary) AS Total_Salary from ASSIGNMENT GROUP BY Department ORDER BY Total_Salary DESC LIMIT 2;

#13.List all employees hired after 2018, ordered by salary, and show only the first 4 employees
SELECT first_name, hire_date, Salary from ASSIGNMENT WHERE hire_date > '2018-12-31' ORDER BY salary DESC LIMIT 4;

#14. Find the highest salary in the IT department, but limit the results to the top 1 result.   
select first_name, salary from ASSIGNMENT where department = "IT" order by salary ASC limit 1; 

#15. Get the average salary of employees in each department and list only departments with an average salary greater than $60,000. 
SELECT Department, AVG(Salary) AS AverageSalary
from ASSIGNMENT
GROUP BY Department
HAVING AVG(Salary) > 60000;



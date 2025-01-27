create database ASS5;
use ASS5;
create table Employees(
emp_id INT unique,
emp_Name Varchar(50),
dept_id INT);
Insert into Employees(emp_id, emp_name, dept_id)
Values
(1, "Alice",10),
(2,"Bob",20),
(3,"Charlie",30),
(4,"David",10),
(5,"Eve",40);
select *from Employees;

use ASS5;
create table Departments(
department_id INT unique,
department_name Varchar(50)
);
Insert into Departments (department_id, department_name)
Values(10, "HR"),
(20, "Finance"),
(30, "IT"),
(40, "Admin"),
(50,"Marketing");
select * from Departments;

use ASS5;
create table Projects(
project_id int unique,
emp_id int,
project_name varchar(50));
insert into Projects (project_id, emp_id, project_name)
values(101,1,"Alpha"),
(102, 2,"Beta"),
(103, 3,"Gamma"),
(104, 4,"Delta");
select * from Projects;

#1. Write a query to get Employee and Department details using join. 
select Employees.emp_name, Departments.department_name from Employees join Departments on Employees.dept_id = Departments.department_id;

#2. Write a query to retrieve all employees with their departments, even if the department is missing.
select Employees.emp_name, Departments.department_name from Employees left join Departments on Employees.dept_id = Departments.department_id;

#3. Write a query to get department details even if there are no employees in that department. 
select Employees.emp_name, Departments.department_name from Employees right join Departments on Employees.dept_id = Departments.department_id;

#4. Write a query to get all employees and departments, whether matched or not. 
select Employees.emp_name, Departments.department_name from Employees left join Departments on Employees.dept_id = Departments.department_id union 
select Employees.emp_name, Departments.department_name from Employees right join Departments on Employees.dept_id = Departments.department_id;

#5. JOIN three tables (Employees, Departments, Projects) to get employee, department, and project information. 
SELECT 
    Employees.emp_id,
    Employees.emp_name,
    Employees.dept_id,
    Departments.department_id,
    Departments.department_name,
    Projects.project_id,
    Projects.emp_id,
    Projects.project_name
FROM
    Employees
        JOIN
    Departments ON Employees.dept_id = Departments.department_id
        LEFT JOIN
    Projects ON Employees.emp_id = Projects.emp_id;
    
#6. Find employees who are not assigned to any projects.
select Employees.emp_name, Projects.project_name from Employees left join Projects on Employees.emp_id = Projects.emp_id where Projects.project_id is null;

#7. Find departments with no employees using a RIGHT JOIN.
select Employees.emp_name, Departments.department_name from Employees right join Departments on Employees.dept_id = Departments.department_id;

#8. Write a query to get Employee and Department details using join with aliases. 
select Employees.emp_name, Departments.department_name from Employees join Departments on Employees.dept_id = Departments.department_id;

#9. Write a query to find employees in the same department as other employees. 
#Confusion

#10. Write a query to find projects managed by employees in the 'IT' department.
SELECT 
    Employees.emp_id,
    Employees.emp_name,
    Employees.dept_id,
    Departments.department_id,
    Departments.department_name,
    Projects.project_id,
    Projects.emp_id,
    Projects.project_name
FROM
    Employees
        JOIN
    Departments ON Employees.dept_id = Departments.department_id
        JOIN
    Projects ON Employees.emp_id = Projects.emp_id where department_name = "IT";

#11. Write a query to show employees and their project information (even if not assigned to a project). 
select Employees.emp_name, Projects.project_name from Employees left join Projects on Employees.emp_id = Projects.emp_id;

#12. Find employees who work in departments with names starting with 'A'. 
select Employees.emp_name, Departments.department_name from Employees join Departments on Employees.dept_id = Departments.department_id where department_name like "A%";

#13. Find the total number of employees in each department using GROUP BY and JOIN. 
select Departments.department_name,  count(Employees.emp_id) from Employees join Departments on Employees.dept_id = Departments.department_id group by department_name;


#14. Get the list of departments with more than one employee. 
select Departments.department_name, count(Employees.emp_id)from Employees join Departments on Employees.dept_id = Departments.department_id group by department_name having count(Employees.emp_id) > 1;
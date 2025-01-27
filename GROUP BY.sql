use ASSIGNMENT3;
create table Sales(
SalesID int primary key,
ProductID int,
CustomerID int, 
SaleDate int,
Quantity int,
UnitPrice int,
Region varchar(50)
);
insert into Sales(SalesID, ProductID, CustomerID, SaleDate, Quantity, UnitPrice, Region)
values (1, 101, 1001, 2024-01-05, 5, 200, "North"),
(2, 102, 1002, 2024-01-10, 10, 150, "East"),
(3, 103, 1003, 2024-02-15, 2, 300, "North"),
(4, 104, 1001, 2024-03-05, 7, 250, "West"),
(5, 101, 1004, 2024-03-05, 1, 200, "East");
select * from Sales;

#1. Write a query to calculate the total sales (Quantity * UnitPrice) for each product.
select ProductID, SUM(Quantity*UnitPrice) as "total sales" from sales group by ProductID;

#2. Write a query to find the total number of products sold in each region
select Region, sum(Quantity*UnitPrice) As "total sales" from sales group by Region;

#3. Write a query to get the average sales amount per product. 
select ProductID, avg(Quantity * UnitPrice) as "sales amount" from sales group by productID;

#4. Find the regions where total sales are more than 3000.
select region, sum(Quantity * UnitPrice) from sales group by region having SUM(Quantity * UnitPrice) > 3000;

#5. Write a query to get the maximum quantity sold for each product. 
SELECT ProductID, MAX(Quantity) AS MaxQuantitySold FROM Sales GROUP BY ProductID;

#6. Write a query to calculate the average quantity of products sold per region. 
select ProductID, avg(Quantity) from sales group by ProductID;

#7. Find the product IDs that have generated a total sales amount of more than 1000.  
select ProductID, MIN(Quantity * UnitPrice) from sales group by ProductId Having SUM(Quantity * UnitPrice) > 1000;

#8. Write a query to get the total number of sales (rows) made for each customer. 
select CustomerID, Count(salesID) from sales group  by CustomerID;

#9. Find the products for which the average quantity sold is less than 5. 
select ProductID, avg(Quantity) from sales group by ProductID Having avg(Quantity) <5;

#10. Write a query to find the sum of total sales for each customer in each region. 
select CustomerID,region, SUM(Quantity*UnitPrice) from sales group by CustomerID, Region;


#11. Write a query to calculate the total sales for each month. 
SELECT EXTRACT(MONTH FROM SaleDate) as month, sum(Quantity * UnitPrice) as "Total Sales" from Sales GROUP BY EXTRACT(MONTH FROM SaleDate);

#12. Find the regions where the average unit price is more than 200.
SELECT Region, avg(UnitPrice) as "average unit price" from Sales GROUP BY Region HAVING avg(UnitPrice) > 200;

#13. Write a query to get the minimum and maximum quantity sold per region.  
SELECT Region, min(Quantity), max(Quantity) from Sales GROUP BY Region;

#14. Find the customers who have made more than 2 purchases. 
SELECT CustomerID, count(ProductID) from sales group by CustomerID having count(ProductID) > 1;
 
#15. Write a query to find the total sales for each product and filter only those products where the total sales exceed 1500.   
SELECT ProductID, sum(Quantity * UnitPrice) as "total sales" from Sales GROUP BY ProductID HAVING sum(Quantity * UnitPrice) > 1500;





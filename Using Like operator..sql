create database library;
use library;
CREATE TABLE books(
id INT Primary Key Auto_Increment,
title VARCHAR(255),
author VARCHAR(100),
year YEAR,
genre VARCHAR(100)
);
INSERT INTO books (id, title, author, year, genre)
VALUES 
(1, "The Great Gatsby", "F. Scott Fitzgerald", 1925, "Fiction"),
(2, "Pride and Prejudice", "Jane Austen", 1913, "Romance"),
(3, "To Kill a Mockingbird", "Harper Lee", 1960, "Fiction"),
(4, "1984", "George Orwell", 1949, "Dystopian"),
(5, "Moby Dick", "Herman Melville", 1951, "Adventure");

#1. Write a query to select all books where the title starts with the letter 'T' using the LIKE operator.
select * from books where title like "%T%";

#2. Write a query to find all books where the author's last name ends with 'son' using the LIKE operator.
select * from books where author like "%son%"; #Recheck(2)

#3. Write a query to find all books where the title contains the word 'and' using the LIKE operator.
select * from books where title like "%and%";

#4. Write a query to retrieve all books where the title ends with the word 'bird' using the LIKE operator.
select * from books where title like "%bird%";

#5. Write a query to find all books where the title has exactly 3 characters using the REGEXP operator.
select * from books where title REGEXP '3 characters'; 

#6. Write a query to select all books where the title contains a number using the REGEXP operator.
SELECT * FROM books WHERE title REGEXP '[0-9]';

#7. Write a query to retrieve all books where the author's name starts with any letter between 'A' and 'J' using the REGEXP operator.
SELECT * FROM books WHERE author REGEXP '^[A-Ja-j]';

#8. Write a query to select all books where the genre is either 'Fiction' or 'Adventure' using the REGEXP operator.
select * from books where genre REGEXP '^(Fiction|Adventure)$';

#9. Write a query to find all books where the title contains at least one uppercase letter using the REGEXP operator.
select * from books where title REGEXP '[A-Z]';

#10. Write a query to find all books where the year of publication is between 1800 and 1950 using the LIKE operator.
SELECT * FROM books WHERE year LIKE '18%' OR year LIKE '19[0-4]%';

#11. Write a query to retrieve all books where the author's name contains exactly two words using the REGEXP operator.  
SELECT * FROM books WHERE author REGEXP '^[A-Za-z]+ [A-Za-z]+$';

#12. Write a query to find all books where the title starts with the letter 'P' and contains exactly two words using the REGEXP operator
SELECT * FROM books WHERE title REGEXP '^P[A-Za-z]+$'; 

#13. Write a query to find all books where the title contains any special characters (e.g., '!', '@', '#', etc.) using the REGEXP operator.
SELECT * FROM books WHERE title REGEXP '^[A-Za-z0-9]';


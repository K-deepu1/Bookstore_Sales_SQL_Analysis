-- Create Database
CREATE DATABASE OnlineBookstore;

-- Switch to the database
use OnlineBookstore;

-- Create Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);

DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

show variables like 'secure_file_priv';

-- Import Data into Books Table
LOAD Data Infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Books.csv'
into table books
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

-- Import Data into Customers Table
LOAD Data Infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Customers.csv'
into table customers
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

-- Import Data into Orders Table
LOAD Data Infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Orders.csv'
into table orders
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

-- 1) Retrieve all books in the 'Fiction' genre:

select * from books 
where Genre='Fiction';

-- 2) Find books published after the year 1950: 

select * from books 
where Published_Year>1950;

-- 3) List all customers from the Canada:

SELECT * 
FROM customers
WHERE TRIM(REPLACE(country, '\r', '')) = 'Canada';

-- 4) Show orders placed in November 2023:
select * from orders
where Order_Date between '2023-11-01' and '2023-11-30';

-- 5) Retrieve the total stock of books available:

select sum(Stock) as Total_Stock 
from books; 

-- 6) Find the details of the most expensive book:

select * from books 
order by Price desc limit 1; 

-- 7) Show all customers who orderd more than 1 quantity of a book:

select * from orders
where quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:

select * from orders
where Total_Amount>20;

-- 9) List all genre available in the books table:

select distinct genre from books;

-- 10) Find the books with the lowest stock:

select * from books
order by stock 
asc 
limit 1; 

-- 11) Calculate the total revenue generated from all orders:

select sum(Total_Amount) as Total_Revenue 
from orders; 

-- Advanced Queries

-- 1) Retrieve the total number of books sold for each genre:

select * from orders;

select b.Genre, sum(o.Quantity ) as Total_Book_Sold
from orders o
join books b on o.Book_ID = b.Book_ID
group by b.Genre;

-- 2) Find the average price of books in the 'Fantasy' genre:

select avg(price) as AVG_Price
from books
where Genre='Fantasy';

-- 3) List customers who have placed at least 2 orders: 

select o.Customer_ID, c.Name, Count(o.Order_ID) as Order_Count
from orders o
join customers c on o.Customer_ID = c.Customer_ID 
group by o.customer_ID, c.Name
having count(Order_ID) >=2;

-- 4) Find the most frequently ordered book:

select o.Book_ID, b.title, Count(o.Order_ID) as Order_Count
from orders o
join books b on o.Book_ID = b.Book_ID
group by o.Book_ID, b.title
order by Order_Count desc
limit 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' genre:

select * 
from books
where Genre='Fantasy'
order by Price desc
limit 3;

-- 6) Retrieve the total quantity of books sold by each author:

select b.Author, sum(o.Quantity) as Total_Books_Sold
from orders o
join books b on o.Book_ID = b.Book_ID
group by b.Author;


-- 7) List the cities where customers who spent over $30 are located:

select distinct(c.City), Total_Amount
from orders o 
join customers c on o.Customer_ID = c.Customer_ID
where o.Total_Amount>30;

-- 8) Find the customers who spent the most on orders: 

select c.Customer_ID, c.Name, sum(o.Total_Amount) as Total_Spent
from orders o 
join customers c on o.Customer_ID = c.Customer_ID
group by c.Customer_ID, c.Name
order by Total_Spent desc limit 1;

-- 9) Calculate the stock remainind after fulfilling all orders: 

select b.Book_ID, b.Title, b.Stock, coalesce(sum(o.Quantity),0) as Order_Quantity,
b.Stock - coalesce(sum(o.Quantity),0) as Remaining_Quantity 
from books b
left join orders o on b.Book_ID = o.Book_ID
group by b.Book_ID;

-- End of Project
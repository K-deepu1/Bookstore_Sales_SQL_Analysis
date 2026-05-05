📚 Bookstore Sales SQL Analysis
<p align="center"> <img src="https://img.shields.io/badge/Project-SQL%20Analysis-blue?style=for-the-badge" /> <img src="https://img.shields.io/badge/Tool-MySQL-orange?style=for-the-badge" /> <img src="https://img.shields.io/badge/Level-Beginner%20to%20Intermediate-green?style=for-the-badge" /> <img src="https://img.shields.io/badge/Queries-20+-brightgreen?style=for-the-badge" /> </p>
📌 Project Overview

🔍 This project analyzes a Bookstore dataset using SQL to extract meaningful insights from:

📖 Books
👥 Customers
🛒 Orders

💡 The goal is to solve real-world business problems and uncover actionable insights using SQL queries.

🎯 Objectives

✔️ Analyze customer behavior
✔️ Identify top-selling books
✔️ Track overall sales performance
✔️ Perform data cleaning & transformation
✔️ Solve business problems using SQL

🗂️ Dataset Description

📘 Books Table

Book ID, Title, Author, Price

👤 Customers Table

Customer ID, Name, Country

🛍️ Orders Table

Order ID, Book ID, Customer ID, Quantity, Order Date
🛠️ Tech Stack

💻 SQL (MySQL)
🗄️ Database Management System
🌐 Git & GitHub

📊 Key Analysis

This project includes a combination of basic and advanced SQL queries to extract meaningful insights from the bookstore dataset.

🔹 Basic Analysis
📚 Retrieved books based on genre (e.g., Fiction)
📅 Filtered books published after a specific year (1950)
🌍 Identified customers from specific locations (e.g., Canada)
🗓️ Analyzed orders placed within a specific time period (November 2023)
📦 Calculated total available stock of books
💎 Found the most expensive book in the inventory
🛒 Identified customers ordering more than one quantity
💰 Filtered high-value orders (amount > $20)
🏷️ Listed all available book genres
⚠️ Detected books with the lowest stock levels
💵 Calculated total revenue generated from all orders


🔸 Advanced Analysis
📊 Analyzed total books sold per genre
📉 Calculated average price of books in specific genres (e.g., Fantasy)
👥 Identified loyal customers with multiple orders
🏆 Found the most frequently ordered book
💎 Extracted top 3 most expensive books in a genre
✍️ Measured total sales contribution by each author
🌆 Identified cities with high-spending customers (>$30)
👑 Determined the highest spending customer
📦 Calculated remaining stock after fulfilling all orders

🧠 Sample Queries
-- Find customers from Canada
SELECT * 
FROM customers
WHERE TRIM(REPLACE(country, '\r', '')) = 'Canada';

-- Most frequently ordered book
SELECT book_id, COUNT(*) AS total_orders
FROM orders
GROUP BY book_id
ORDER BY total_orders DESC
LIMIT 1;

📁 Project Structure
bookstore-sql-analysis/
│── 📂 dataset/
│   ├── books.csv
│   ├── customers.csv
│   └── orders.csv
│── bookstore_analysis.sql
│── 📄 README.md

🚀 How to Use

1️⃣ Import dataset into your SQL database
2️⃣ Open the SQL file
3️⃣ Run queries step-by-step
4️⃣ Analyze outputs & insights

🚀 Insights Generated
📈 Best-performing genres and books identified
👥 Customer purchasing behavior understood
💰 High-value customers and orders detected
📦 Inventory management insights (stock levels & shortages)
✍️ Author-wise performance analysis
🌍 Location-based revenue insights

💡 Learnings

🚀 Strong SQL query writing
🧹 Data cleaning techniques
📊 Analytical thinking
🧠 Real-world problem solving

👨‍💻 Author

Deepanshu Kashyap
📍 India
🔗 LinkedIn: (https://www.linkedin.com/in/deepanshu-kashyap-deepu01/)

🌟 Support

If you like this project:
⭐ Star this repository
🤝 Connect with me on LinkedIn

Thank you.

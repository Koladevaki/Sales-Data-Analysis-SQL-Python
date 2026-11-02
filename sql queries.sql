CREATE DATABASE sales_project;

USE sales_project;
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    order_date DATE,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    product VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10,2)
);
USE sales_project;

INSERT INTO sales
(sale_id, order_date, customer_name, city,
 product, category, quantity, unit_price)
VALUES
(1,'2026-01-05','Ravi','Hyderabad','Laptop','Electronics',2,45000),
(2,'2026-01-08','Sita','Warangal','Mouse','Accessories',5,500),
(3,'2026-01-10','Rahul','Hyderabad','Keyboard','Accessories',3,1200),
(4,'2026-01-15','Anu','Karimnagar','Mobile','Electronics',2,18000),
(5,'2026-02-02','Ravi','Hyderabad','Headphones','Accessories',4,1500),
(6,'2026-02-07','Kiran','Warangal','Laptop','Electronics',1,45000),
(7,'2026-02-12','Sita','Warangal','Mobile','Electronics',3,18000),
(8,'2026-02-18','Rahul','Hyderabad','Mouse','Accessories',6,500),
(9,'2026-03-03','Anu','Karimnagar','Keyboard','Accessories',2,1200),
(10,'2026-03-09','Kiran','Warangal','Headphones','Accessories',3,1500),
(11,'2026-03-15','Ravi','Hyderabad','Mobile','Electronics',1,18000),
(12,'2026-03-20','Sita','Warangal','Laptop','Electronics',2,45000),
(13,'2026-03-22','Rahul','Hyderabad','Headphones','Accessories',2,1500),
(14,'2026-03-25','Anu','Karimnagar','Mouse','Accessories',4,500),
(15,'2026-03-28','Kiran','Warangal','Keyboard','Accessories',5,1200);
SELECT * FROM sales;
SELECT COUNT(*) FROM sales;
SELECT
    SUM(quantity * unit_price) AS total_revenue
FROM sales;
SELECT SUM(quantity) AS total_quantity
FROM sales;
SELECT
    city,
    SUM(quantity * unit_price) AS revenue
FROM sales
GROUP BY city
ORDER BY revenue DESC;
SELECT
    product,
    SUM(quantity) AS total_sold
FROM sales
GROUP BY product
ORDER BY total_sold DESC;
SELECT
    MONTH(order_date) AS month_number,
    SUM(quantity * unit_price) AS monthly_revenue
FROM sales
GROUP BY MONTH(order_date)
ORDER BY month_number;
SELECT
    product,
    SUM(quantity * unit_price) AS revenue
FROM sales
GROUP BY product
ORDER BY revenue DESC
LIMIT 1;
SELECT
    customer_name,
    SUM(quantity * unit_price) AS total_spending
FROM sales
GROUP BY customer_name
ORDER BY total_spending DESC;
SELECT
    AVG(quantity * unit_price) AS average_sale_value
FROM sales;
-- Basic Queries

-- List all smartphones with their company names
SELECT s.model_name, c.company_name FROM Smartphone s
JOIN Company c ON s.company_id = c.company_id;

-- Count smartphones per category
SELECT cat.category_name, COUNT(s.smartphone_id) AS total_smartphones
FROM Smartphone s
JOIN Category cat ON s.category_id = cat.category_id
GROUP BY cat.category_name;

-- Intermediate Queries

-- Total sales amount per company
SELECT c.company_name, SUM(o.total_amount) AS total_sales
FROM Orders o
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Smartphone s ON od.smartphone_id = s.smartphone_id
JOIN Company c ON s.company_id = c.company_id
GROUP BY c.company_name;

-- Top 5 best-selling smartphones
SELECT s.model_name, SUM(od.quantity) AS total_sold
FROM Order_Details od
JOIN Smartphone s ON od.smartphone_id = s.smartphone_id
GROUP BY s.model_name
ORDER BY total_sold DESC
LIMIT 5;

-- Advanced Queries

-- Monthly sales trend
SELECT DATE_FORMAT(order_date, '%Y-%m') AS sales_month, SUM(total_amount) AS total_sales
FROM Orders
GROUP BY sales_month
ORDER BY sales_month;

-- Smartphones with low stock (<50) and their last order date
SELECT s.model_name, s.stock_quantity, MAX(o.order_date) AS last_order_date
FROM Smartphone s
JOIN Order_Details od ON s.smartphone_id = od.smartphone_id
JOIN Orders o ON od.order_id = o.order_id
WHERE s.stock_quantity < 50
GROUP BY s.model_name, s.stock_quantity;

-- Customer purchase analysis with running total
SELECT o.customer_name, o.order_date, o.total_amount,
       SUM(o.total_amount) OVER (PARTITION BY o.customer_name ORDER BY o.order_date) AS running_total
FROM Orders o;

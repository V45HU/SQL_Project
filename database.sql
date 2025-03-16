CREATE DATABASE SmartphoneSales;
USE SmartphoneSales;

-- Drop tables if they exist (for clean setup)
DROP TABLE IF EXISTS Order_Details;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Smartphone;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Company;

-- Table Creation
CREATE TABLE Company (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(50),
    country VARCHAR(50),
    founded_year INT
);

CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50),
    description VARCHAR(100)
);

CREATE TABLE Smartphone (
    smartphone_id INT PRIMARY KEY,
    company_id INT,
    category_id INT,
    model_name VARCHAR(50),
    price DECIMAL(10,2),
    release_date DATE,
    stock_quantity INT,
    FOREIGN KEY (company_id) REFERENCES Company(company_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATE,
    total_amount DECIMAL(10,2)
);

CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    smartphone_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (smartphone_id) REFERENCES Smartphone(smartphone_id)
);

-- Sample Data Insertion
-- Company Data (10 rows)
INSERT INTO Company VALUES
(1, 'Apple', 'USA', 1976),
(2, 'Samsung', 'South Korea', 1938),
(3, 'Xiaomi', 'China', 2010),
(4, 'OnePlus', 'China', 2013),
(5, 'Google', 'USA', 1998),
(6, 'Oppo', 'China', 2004),
(7, 'Vivo', 'China', 2009),
(8, 'Sony', 'Japan', 1946),
(9, 'Huawei', 'China', 1987),
(10, 'Nokia', 'Finland', 1865);

-- Category Data (5 rows)
INSERT INTO Category VALUES
(1, 'Flagship', 'High-end premium phones'),
(2, 'Mid-range', 'Balanced performance phones'),
(3, 'Budget', 'Affordable phones'),
(4, 'Gaming', 'Performance-focused phones'),
(5, 'Foldable', 'Innovative foldable design');

-- Smartphone Data (55 rows)
INSERT INTO Smartphone VALUES
(1, 1, 1, 'iPhone 15 Pro', 1299.99, '2024-09-15', 50),
(2, 1, 1, 'iPhone 14', 799.99, '2023-09-10', 100),
(3, 2, 1, 'Galaxy S23 Ultra', 1199.99, '2023-02-01', 75),
(4, 2, 2, 'Galaxy A54', 449.99, '2023-03-15', 150),
(5, 3, 2, 'Redmi Note 12', 299.99, '2023-04-20', 200),
(6, 3, 3, 'Poco M5', 199.99, '2022-09-05', 300),
(7, 4, 1, 'OnePlus 11', 899.99, '2023-01-04', 80),
(8, 5, 1, 'Pixel 8 Pro', 999.99, '2024-10-05', 60),
(9, 5, 2, 'Pixel 7a', 499.99, '2023-05-10', 120),
(10, 6, 5, 'Find N2 Flip', 1099.99, '2023-02-15', 40),
(11, 7, 2, 'Vivo Y76', 349.99, '2022-11-20', 180),
(12, 8, 1, 'Xperia 1 V', 1399.99, '2023-05-25', 30),
(13, 9, 1, 'P60 Pro', 1199.99, '2023-03-23', 70),
(14, 10, 3, 'Nokia G22', 179.99, '2023-02-25', 250),
(15, 2, 5, 'Galaxy Z Fold 5', 1799.99, '2024-08-10', 25),
(16, 1, 1, 'iPhone 15', 999.99, '2024-09-15', 90),
(17, 4, 4, 'OnePlus Nord N30', 399.99, '2023-06-15', 110),
(18, 3, 4, 'Poco F5', 499.99, '2023-05-10', 130),
(19, 6, 2, 'Oppo Reno 8', 549.99, '2022-12-01', 140),
(20, 7, 3, 'Vivo T1', 249.99, '2022-10-15', 220),
(21, 1, 1, 'iPhone 13', 699.99, '2022-09-15', 85),
(22, 2, 1, 'Galaxy S22', 999.99, '2022-02-25', 60),
(23, 3, 3, 'Redmi 12C', 149.99, '2023-01-10', 350),
(24, 4, 2, 'OnePlus 10T', 649.99, '2022-08-03', 95),
(25, 5, 1, 'Pixel 7', 799.99, '2023-10-15', 70),
(26, 6, 2, 'Oppo A78', 399.99, '2023-03-20', 160),
(27, 7, 1, 'Vivo X80', 899.99, '2022-12-15', 45),
(28, 8, 2, 'Xperia 5 IV', 999.99, '2022-10-20', 55),
(29, 9, 2, 'Nova 10', 499.99, '2022-11-10', 125),
(30, 10, 3, 'Nokia X30', 299.99, '2022-09-01', 200),
(31, 1, 5, 'iPhone 14 Pro Fold', 1599.99, '2024-11-01', 20),
(32, 2, 4, 'Galaxy F54', 599.99, '2023-06-10', 115),
(33, 3, 1, 'Mi 13 Pro', 1099.99, '2023-02-28', 65),
(34, 4, 3, 'Nord CE 3', 349.99, '2023-07-05', 175),
(35, 5, 3, 'Pixel 6a', 399.99, '2022-07-21', 140),
(36, 6, 1, 'Oppo Find X6', 1199.99, '2023-03-25', 50),
(37, 7, 4, 'Vivo V27 Pro', 549.99, '2023-04-15', 130),
(38, 8, 3, 'Xperia 10 V', 449.99, '2023-05-15', 180),
(39, 9, 5, 'Mate Xs 2', 1899.99, '2022-10-25', 15),
(40, 10, 2, 'Nokia G60', 349.99, '2022-09-20', 190),
(41, 1, 2, 'iPhone SE 4', 599.99, '2024-03-15', 110),
(42, 2, 3, 'Galaxy A14', 199.99, '2023-01-20', 300),
(43, 3, 2, 'Redmi Note 11', 279.99, '2022-11-01', 210),
(44, 4, 1, 'OnePlus 12', 999.99, '2024-01-15', 70),
(45, 5, 4, 'Pixel 8 Gaming', 1099.99, '2024-11-10', 40),
(46, 6, 3, 'Oppo A58', 249.99, '2023-02-10', 220),
(47, 7, 2, 'Vivo Y35', 299.99, '2022-08-15', 195),
(48, 8, 1, 'Xperia Pro-I', 1799.99, '2022-12-10', 25),
(49, 9, 3, 'Huawei Y9s', 229.99, '2022-09-30', 260),
(50, 10, 1, 'Nokia XR21', 599.99, '2023-05-03', 90),
(51, 2, 2, 'Galaxy A34', 399.99, '2023-03-15', 145),
(52, 3, 1, 'Xiaomi 14', 1299.99, '2024-03-01', 55),
(53, 4, 2, 'Nord 3', 499.99, '2023-07-10', 135),
(54, 1, 1, 'iPhone 15 Plus', 1099.99, '2024-09-15', 80),
(55, 5, 2, 'Pixel 7 Pro', 899.99, '2023-10-15', 100);

-- Orders Data (50 rows)
INSERT INTO Orders VALUES
(1, 'John Doe', '2024-10-01', 2599.98),
(2, 'Jane Smith', '2024-10-05', 799.99),
(3, 'Mike Johnson', '2024-11-01', 1199.99),
(4, 'Emily Brown', '2024-11-10', 899.99),
(5, 'David Lee', '2024-12-01', 1999.98),
(6, 'Sarah Davis', '2024-12-15', 449.99),
(7, 'Chris Wilson', '2025-01-01', 999.99),
(8, 'Lisa Anderson', '2025-01-15', 1799.99),
(9, 'Tom Clark', '2025-02-01', 599.98),
(10, 'Anna White', '2025-02-10', 1399.99),
(11, 'Robert Green', '2024-10-20', 349.99),
(12, 'Kelly Black', '2024-11-25', 499.99),
(13, 'Peter Gray', '2024-12-20', 1099.99),
(14, 'Laura Blue', '2025-01-20', 299.99),
(15, 'James Red', '2025-02-15', 179.99),
(16, 'Alice Brown', '2024-10-10', 1299.99),
(17, 'Bob White', '2024-10-15', 699.99),
(18, 'Carol Green', '2024-11-05', 999.99),
(19, 'Dan Blue', '2024-11-15', 1599.99),
(20, 'Eve Black', '2024-12-05', 399.99),
(21, 'Frank Red', '2024-12-10', 599.99),
(22, 'Grace Yellow', '2025-01-05', 899.99),
(23, 'Hank Purple', '2025-01-10', 1099.99),
(24, 'Ivy Orange', '2025-02-05', 249.99),
(25, 'Jack Pink', '2025-02-20', 799.99),
(26, 'Kara Gold', '2024-10-25', 1799.99),
(27, 'Leo Silver', '2024-11-20', 149.99),
(28, 'Mia Bronze', '2024-12-25', 349.99),
(29, 'Ned Teal', '2025-01-25', 499.99),
(30, 'Ola Cyan', '2025-02-25', 1199.99),
(31, 'Pat Magenta', '2024-10-02', 999.99),
(32, 'Quinn Lime', '2024-10-07', 449.99),
(33, 'Ray Indigo', '2024-11-02', 199.99),
(34, 'Sue Violet', '2024-11-12', 1299.99),
(35, 'Tim Gray', '2024-12-02', 599.99),
(36, 'Uma Brown', '2024-12-17', 799.99),
(37, 'Vic Green', '2025-01-02', 1399.99),
(38, 'Wes Blue', '2025-01-17', 299.99),
(39, 'Xena Red', '2025-02-02', 899.99),
(40, 'Yul Black', '2025-02-17', 1099.99),
(41, 'Zoe White', '2024-10-17', 399.99),
(42, 'Adam Gold', '2024-11-07', 649.99),
(43, 'Beth Silver', '2024-11-17', 1799.99),
(44, 'Carl Bronze', '2024-12-07', 229.99),
(45, 'Dana Teal', '2024-12-22', 999.99),
(46, 'Evan Cyan', '2025-01-07', 499.99),
(47, 'Fay Magenta', '2025-01-22', 349.99),
(48, 'Gus Lime', '2025-02-07', 1599.99),
(49, 'Hal Indigo', '2025-02-22', 799.99),
(50, 'Ida Violet', '2024-10-22', 1199.99);

-- Order_Details Data (60 rows)
INSERT INTO Order_Details VALUES
(1, 1, 1, 2, 1299.99),
(2, 2, 2, 1, 799.99),
(3, 3, 3, 1, 1199.99),
(4, 4, 7, 1, 899.99),
(5, 5, 8, 2, 999.99),
(6, 6, 4, 1, 449.99),
(7, 7, 16, 1, 999.99),
(8, 8, 15, 1, 1799.99),
(9, 9, 5, 2, 299.99),
(10, 10, 12, 1, 1399.99),
(11, 11, 11, 1, 349.99),
(12, 12, 9, 1, 499.99),
(13, 13, 10, 1, 1099.99),
(14, 14, 6, 1, 199.99),
(15, 15, 14, 1, 179.99),
(16, 16, 1, 1, 1299.99),
(17, 17, 21, 1, 699.99),
(18, 18, 22, 1, 999.99),
(19, 19, 31, 1, 1599.99),
(20, 20, 17, 1, 399.99),
(21, 21, 32, 1, 599.99),
(22, 22, 27, 1, 899.99),
(23, 23, 33, 1, 1099.99),
(24, 24, 20, 1, 249.99),
(25, 25, 25, 1, 799.99),
(26, 26, 15, 1, 1799.99),
(27, 27, 23, 1, 149.99),
(28, 28, 11, 1, 349.99),
(29, 29, 18, 1, 499.99),
(30, 30, 13, 1, 1199.99),
(31, 31, 8, 1, 999.99),
(32, 32, 4, 1, 449.99),
(33, 33, 6, 1, 199.99),
(34, 34, 52, 1, 1299.99),
(35, 35, 35, 1, 599.99),
(36, 36, 2, 1, 799.99),
(37, 37, 12, 1, 1399.99),
(38, 38, 5, 1, 299.99),
(39, 39, 7, 1, 899.99),
(40, 40, 10, 1, 1099.99),
(41, 41, 17, 1, 399.99),
(42, 42, 24, 1, 649.99),
(43, 43, 39, 1, 1899.99),
(44, 44, 49, 1, 229.99),
(45, 45, 16, 1, 999.99),
(46, 46, 9, 1, 499.99),
(47, 47, 34, 1, 349.99),
(48, 48, 31, 1, 1599.99),
(49, 49, 25, 1, 799.99),
(50, 50, 3, 1, 1199.99),
(51, 1, 54, 1, 1099.99),
(52, 5, 45, 1, 1099.99),
(53, 9, 43, 1, 279.99),
(54, 19, 15, 1, 1799.99),
(55, 23, 36, 1, 1199.99),
(56, 26, 48, 1, 1799.99),
(57, 30, 52, 1, 1299.99),
(58, 34, 1, 2, 1299.99),
(59, 37, 28, 1, 999.99),
(60, 43, 15, 2, 1799.99);

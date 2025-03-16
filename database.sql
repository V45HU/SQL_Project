-- SQL Script to create and populate the Smartphone Sales Database

-- Create the Company table
CREATE TABLE Company (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    country VARCHAR(50),
    founded_year INT
);

-- Create the Category table
CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100),
    description TEXT
);

-- Create the Smartphone table
CREATE TABLE Smartphone (
    smartphone_id INT PRIMARY KEY,
    company_id INT,
    category_id INT,
    model_name VARCHAR(100),
    price DECIMAL(10,2),
    release_date DATE,
    stock_quantity INT,
    FOREIGN KEY (company_id) REFERENCES Company(company_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- Create the Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATE,
    total_amount DECIMAL(10,2)
);

-- Create the Order_Details table
CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    smartphone_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (smartphone_id) REFERENCES Smartphone(smartphone_id)
);

-- Insert sample data into Company
INSERT INTO Company VALUES (1, 'Apple', 'USA', 1976),
                           (2, 'Samsung', 'South Korea', 1938),
                           (3, 'OnePlus', 'China', 2013);

-- Insert sample data into Category
INSERT INTO Category VALUES (1, 'Flagship', 'Premium smartphones'),
                            (2, 'Mid-Range', 'Affordable with good specs'),
                            (3, 'Budget', 'Basic smartphones');

-- Insert sample data into Smartphone
INSERT INTO Smartphone VALUES (1, 1, 1, 'iPhone 14 Pro', 999.99, '2022-09-14', 150),
                              (2, 2, 1, 'Samsung Galaxy S22', 899.99, '2022-02-25', 200),
                              (3, 3, 2, 'OnePlus Nord', 399.99, '2021-07-27', 300);

-- Insert sample data into Orders
INSERT INTO Orders VALUES (1, 'John Doe', '2023-03-10', 999.99),
                          (2, 'Jane Smith', '2023-04-15', 399.99);

-- Insert sample data into Order_Details
INSERT INTO Order_Details VALUES (1, 1, 1, 1, 999.99),
                                 (2, 2, 3, 1, 399.99);

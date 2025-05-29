CREATE DATABASE PracticeDB;
GO

USE PracticeDB;
GO


CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName NVARCHAR(100)
);

INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Sales');



CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName NVARCHAR(100),
    Gender NVARCHAR(10),
    DeptID INT,
    JoiningDate DATE,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees VALUES
(101, 'Alice', 'Female', 1, '2019-03-01'),
(102, 'Bob', 'Male', 2, '2020-07-15'),
(103, 'Charlie', 'Male', 3, '2021-01-10'),
(104, 'Diana', 'Female', 4, '2018-10-20'),
(105, 'Eve', 'Female', 2, '2022-05-12');





CREATE TABLE Salaries (
    EmpID INT,
    Salary INT,
    Bonus INT,
    EffectiveFrom DATE,
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);

INSERT INTO Salaries VALUES
(101, 60000, 5000, '2023-01-01'),
(102, 75000, 7000, '2023-01-01'),
(103, 80000, 6000, '2023-01-01'),
(104, 65000, 3000, '2023-01-01'),
(105, 70000, 5000, '2023-01-01');





CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName NVARCHAR(100),
    StartDate DATE,
    EndDate DATE
);

INSERT INTO Projects VALUES
(1, 'Project Apollo', '2022-01-01', '2022-06-30'),
(2, 'Project Titan', '2022-07-01', '2022-12-31'),
(3, 'Project Zephyr', '2023-01-01', NULL);



CREATE TABLE EmployeeProjects (
    EmpID INT,
    ProjectID INT,
    HoursPerWeek INT,
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

INSERT INTO EmployeeProjects VALUES
(101, 1, 20),
(102, 1, 25),
(103, 2, 30),
(104, 3, 15),
(105, 3, 20);



CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(100),
    City NVARCHAR(50),
    Country NVARCHAR(50)
);

INSERT INTO Customers VALUES
(1, 'John Smith', 'New York', 'USA'),
(2, 'Jane Doe', 'London', 'UK'),
(3, 'Carlos Santana', 'Madrid', 'Spain'),
(4, 'Ling Wei', 'Beijing', 'China');




CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products VALUES
(1, 'Laptop', 999.99),
(2, 'Phone', 499.99),
(3, 'Tablet', 299.99),
(4, 'Monitor', 199.99);




CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders VALUES
(1001, 1, '2023-01-10'),
(1002, 2, '2023-01-12'),
(1003, 3, '2023-01-15'),
(1004, 1, '2023-02-01');




CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderItems VALUES
(1, 1001, 1, 1),
(2, 1001, 4, 2),
(3, 1002, 2, 1),
(4, 1003, 3, 3),
(5, 1004, 1, 2);




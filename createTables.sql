USE BekoWarehouse;
GO

CREATE TABLE Categories (
    category_id INT IDENTITY(1,1) PRIMARY KEY,
    category_name NVARCHAR(100) NOT NULL
);

CREATE TABLE Products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name NVARCHAR(100) NOT NULL,
    model NVARCHAR(100) NOT NULL,
    serial_number NVARCHAR(50) NOT NULL,
    manufacture_date DATE,
    category_id INT NOT NULL,

    CONSTRAINT FK_Products_Categories 
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Warehouses (
    warehouse_id INT IDENTITY(1,1) PRIMARY KEY,
    warehouse_name NVARCHAR(100) NOT NULL,
    address NVARCHAR(200) NOT NULL
);

CREATE TABLE Employees (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    full_name NVARCHAR(150) NOT NULL,
    position NVARCHAR(100) NOT NULL,
    phone NVARCHAR(20)
);

CREATE TABLE Deliveries (
    delivery_id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT NOT NULL,
    warehouse_id INT NOT NULL,
    employee_id INT NOT NULL,
    quantity INT NOT NULL,
    delivery_date DATE NOT NULL,

    CONSTRAINT FK_Deliveries_Products
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    CONSTRAINT FK_Deliveries_Warehouses
    FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id),
    CONSTRAINT FK_Deliveries_Employees
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);
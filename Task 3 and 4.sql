-- CREATING A TABLE
/*
CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY(1, 1),
    name VARCHAR(100) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
); */

-- INSERTING WITH DEFINING COLUMN NAMES AND INCREMENTING ID AUTOMATICALLY
/*
INSERT INTO Users (name, username, email, password, created_at) VALUES
('Alice Johnson', 'alicej', 'alice@example.com', '$2b$10$C6UUrT...', '2024-02-01 10:15:00'),
('Bob Smith', 'bobsmith', 'bob@example.com', '$2b$10$9qN1rU...', '2024-02-02 12:30:00'),
('Charlie Brown', 'charlieb', 'charlie@example.com', '$2b$10$A1b2C3...', '2024-02-03 08:45:00'),
('David Miller', 'davidm', 'david@example.com', '$2b$10$XyZ123...', '2024-02-04 14:20:00'),
('Emily Davis', 'emilyd', 'emily@example.com', '$2b$10$WqRtUv...', '2024-02-05 09:10:00'),
('Franklin Carter', 'frankc', 'frank@example.com', '$2b$10$MnOpQr...', '2024-02-06 17:40:00'),
('Grace Wilson', 'gracew', 'grace@example.com', '$2b$10$StUvWx...', '2024-02-07 11:55:00'),
('Henry Thomas', 'henryt', 'henry@example.com', '$2b$10$YzA1B2...', '2024-02-08 13:25:00'),
('Isabella Moore', 'isabellam', 'isabella@example.com', '$2b$10$C3D4E5...', '2024-02-09 16:30:00'),
('Jack Anderson', 'jacka', 'jack@example.com', '$2b$10$F6G7H8...', '2024-02-10 19:10:00'); */


-- DISPLAYING ALL DETAILS OF Users TABLE 
SELECT * FROM Users;

-- MANUALLY INSERTING VALUES OF user_id OVERRIDING THE AUTO_INCREMENT

SET IDENTITY_INSERT Users ON;  -- Allow manual insertion into IDENTITY column

/*INSERT INTO Users
(user_id, name, username, email, password, created_at)
VALUES
(35, 'Katherine White', 'kwhite', 'katherine@example.com', '$2b$10$I9J0K1...', '2024-02-11 08:00:00'),
(42, 'Liam Harris', 'liamh', 'liam@example.com', '$2b$10$L2M3N4...', '2024-02-12 10:45:00');
-- If Done without IDENTITY_INSERT ON then it will throw an error and 'Column list' should be used */

SET IDENTITY_INSERT Users OFF; -- We need to turn it off to allow insertion without column list

-- INSERTING DATA INTO TABLE WITHOUT SPECIFYING THE COLUMN LIST

/* INSERT INTO Users
VALUES
('Mia Robinson', 'miar', 'mia@example.com', '$2b$10$O5P6Q7...', '2024-02-13 14:55:00'),
('Noah Lewis', 'noahl', 'noah@example.com', '$2b$10$R8S9T0...', '2024-02-14 18:20:00'),
('Olivia Walker', 'oliviaw', 'olivia@example.com', '$2b$10$U1V2W3...', '2024-02-15 20:10:00'),
('Patrick Young', 'patricky', 'patrick@example.com', '$2b$10$X4Y5Z6...', '2024-02-16 09:30:00'),
('Quinn Scott', 'quinns', 'quinn@example.com', '$2b$10$A7B8C9...', '2024-02-17 11:20:00'),
('Ryan Hall', 'ryanh', 'ryan@example.com', '$2b$10$D0E1F2...', '2024-02-18 15:40:00'),
('Sophia Adams', 'sophiaa', 'sophia@example.com', '$2b$10$G3H4I5...', '2024-02-19 17:50:00'),
('Tyler Baker', 'tylerb', 'tyler@example.com', '$2b$10$J6K7L8...', '2024-02-20 21:05:00'),
('Uma Mitchell', 'umam', 'uma@example.com', '$2b$10$M9N0O1...', '2024-02-21 08:15:00'),
('Victor Perez', 'victorp', 'victor@example.com', '$2b$10$P2Q3R4...', '2024-02-22 10:25:00'),
('William Gonzalez', 'williamg', 'william@example.com', '$2b$10$S5T6U7...', '2024-02-23 13:35:00'),
('Xander Cooper', 'xanderc', 'xander@example.com', '$2b$10$V8W9X0...', '2024-02-24 15:50:00'),
('Zoe Ramirez', 'zoer', 'zoe@example.com', '$2b$10$Y1Z2A3...', '2024-02-25 18:10:00'),
('David Miller', 'davidm2', 'david2@example.com', '$2b$10$XyZ456...', '2024-02-26 14:45:00'),
('Emily Davis', 'emilyd2', 'emily2@example.com', '$2b$10$MnOpQ2...', '2024-02-27 11:30:00'); */

SELECT * FROM Users;

-- INSERTING INTO TABLE WITH SOME DEFAULT VALUES

INSERT INTO Users
(name, username, email, password)  -- WE WILL NEED TO SPECIFY THE COLUMN LIST 
VALUES
('Jack Anderson', 'jacka2', 'jack2@example.com', '$2b$10$StUvW2...'),  -- ALL ROWS MUST HAVE EQUAL ELEMENTS
('Ryan Hall', 'ryanh2', 'ryan2@example.com', '$2b$10$YzA1B9...');

-- SELECT QUERIES

-- These QUERIES will give some specified columns from the table
SELECT user_id, name, username, email FROM Users;
SELECT user_id AS ID, name AS Name, username, email FROM Users;  -- Can change the names of column to be viewed as own choice


SELECT * FROM Users;  -- This will result in all columns of the Table


-- SELECT DISTINCT -> This returns the distinct elements in specified column from the TABLE
SELECT DISTINCT name FROM Users;  -- It will give records with distinct names
SELECT DISTINCT email, name FROM Users;  -- It will give records with distinct (emails and name) pair


-- WHERE Clause -> Used to extract only those records that fulfill a specified condition
SELECT * FROM Users
WHERE name = 'David Miller';


-- BETWEEN -> Between a Certain Range

SELECT user_id, name FROM Users
WHERE user_id BETWEEN 16 AND 45;   -- Will give records with user_id as 16 and upto records having user_id 16 to 45 (inclusive)


-- LIKE -> Search for a Pattern

SELECT user_id, name FROM Users WHERE name LIKE 'S%'; -- Will give records whose names are starting with 's'


SELECT user_id, name FROM Users WHERE name LIKE '%S'; -- Will give records whose names are ending with 's'


-- LIKE Usage
	-- Names Starting with a Letter 
		SELECT * FROM Users WHERE name LIKE 'A%';

	-- Names Ending with a Letter
		SELECT * FROM Users WHERE name LIKE '%n';

	-- Names Containing a Word
		SELECT * FROM Users WHERE name LIKE '%John%';

	-- Names with a Specific Length (Using _)
		SELECT * FROM Users WHERE name LIKE 'A__';

	-- Names Starting with 'A' and Ending with 'n'

		SELECT * FROM Users WHERE name LIKE 'A%n';


-- IN -> To Specify multiple possible vallues for a column

	SELECT * FROM Users
	WHERE name IN ('Alice Johnson', 'Jack', 'Ryan Hall');


-- ORDER BY -> Used to sort the result-set in Ascending or Descending Order

	SELECT * FROM Users
	ORDER BY name;

	SELECT name, email FROM Users
	ORDER BY name DESC;						-- cAN USE ASC / DESC TO SPECIFY Ascending and Descending


-- AND operator -> USED TO FILTER RECORDS BASED ON MORE THAN ONE CONDITION  (aLL CONDITIONS INVOLVED IN STATEMENT MUST BE TRUE)
-- OR operator -> USED TO FILTER RECORDS BASED ON MORE THAN ONE CONDITION (any ONE CONDITION OR ALL SHOULD BE TRUE)
-- NOT -> uSED WWITH OTHER OPERATORS TO GIVE OPPOSITE RESULTS

SELECT name FROM Users
WHERE name NOT LIKE '%N';  -- Will give all records in which names are not ending with (n / N);

-- NULL VALUE -> Field with no value

-- Null values can't be checked using comparison operators
-- Instead we can check by two methods : 
			-- -> IS NULL			(Used to test for EMPTY VALUES)
			-- -> IS NOT NULL		(Used to test for NON_EMPTY VALUES)



-- UPDATE Statement -> Used to update existing records in the table

	-- Syntax => UPDATE table_name SET column_1 = value_1, column_2 = value_2 WHERE condition;

	UPDATE Users
	SET name = 'Abhishek Kushwaha', username = 'Mr_Abhishek001', email = 'kabhishek5710@gmail.com'
	WHERE name = 'Bob Smith';

	SELECT * FROM Users WHERE name = 'Abhishek Kushwaha';

	-- UPDATE Users SET user_id = 91 WHERE user_id = 3;  -- Primary Keys cannot be updated

	UPDATE Users SET name = 'Barack Obama', username = 'President of US' WHERE user_id = 3;

	SELECT * FROM Users WHERE user_id = 3;

	UPDATE Users
	SET created_at = GETDATE(), name = 'Temba Bavuma'
	WHERE name = 'David Miller';

	SELECT * FROM Users WHERE name = 'Temba Bavuma';

-- WARNING -> If Executed without WHERE condition then all the records will be updated!!!


-- DELETE Statement -> Used to DELETE existing records in the Table

	-- Syntax => DELETE FROM table_name WHERE condition

	DELETE FROM Users WHERE user_id = 49;

	SELECT * FROM Users WHERE user_id = 49;
	

	-- DELETE FROM table_name  -> Will delete all records from the table


-- SQL SELECT TOP clause -> Used to specify the number of records to return

	SELECT TOP 5 * FROM Users;

	SELECT TOP 30 PERCENT * FROM Users;


/*
		SQL Aggregate Functions
				-> Fucntion that performs calculation on a	set of valaurs and returns a single value
				
				-> Aggregate functions are often used with GROUP BY clause of SELECT statement
				-> GROUP BY -> Used to split result-set into groups of values and aggregate functions can be used to return a single valuefor each group

				-> Most Commonly used SQL Aggregate Functions
						1. MIN() -> return minimum value within the selected column
						2. MAX() -> returns the largest value within the selected column
						3. COUNT() -> return the number of records in the set
						4. SUM() -> return total sum of a numerical column
						5. AVG() -> return the average value of a numerical column

				-> Aggregate functions ignore the NULL values except for the count function
*/
/*
-- Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    Product VARCHAR(50),
    Category VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    SaleDate DATE,
    Store VARCHAR(50),
    Region VARCHAR(50)
);

-- Sample Data for Sales Table
INSERT INTO Sales (SaleID, Product, Category, Quantity, Price, SaleDate, Store, Region) VALUES
(1, 'Laptop', 'Electronics', 2, 60000, '2024-01-15', 'Store A', 'North'),
(2, 'Smartphone', 'Electronics', 5, 25000, '2024-02-10', 'Store B', 'South'),
(3, 'Laptop', 'Electronics', 1, 62000, '2024-03-05', 'Store C', 'East'),
(4, 'TV', 'Electronics', 3, 40000, '2024-03-15', 'Store A', 'North'),
(5, 'Jeans', 'Clothing', 4, 2000, '2024-04-20', 'Store B', 'South'),
(6, 'T-shirt', 'Clothing', 6, 800, '2024-05-25', 'Store C', 'East'),
(7, 'Sofa', 'Furniture', 2, 30000, '2024-06-30', 'Store A', 'North'),
(8, 'Table', 'Furniture', 3, 12000, '2024-07-10', 'Store B', 'South'),
(9, 'Chair', 'Furniture', 4, 5000, '2024-08-15', 'Store C', 'East'),
(10, 'Laptop', 'Electronics', 3, 59000, '2024-09-05', 'Store A', 'North'); */

SELECT * FROM Sales;

SELECT MIN(Quantity) AS MIN_QUANTITY FROM Sales;

SELECT MIN(Price) AS Minimum_Price FROM Sales GROUP BY Category;

SELECT Category, MIN(Price) AS MinPrice
FROM Sales
GROUP BY Category;

--SELECT Category, MIN(Price) AS MinPrice FROM Sales; -- MIN(Price) is an aggregate function that requires GROUP BY to compute the minimum price for each category.
													-- Without GROUP BY, SQL does not know how to group data before applying MIN()

SELECT COUNT(*) AS product_count FROM Sales WHERE pRODUCT = 'Laptop';

SELECT COUNT(*) AS PRODUCT_COUNT, category FROM Sales GROUP BY Category;

-- SUM()

SELECT SUM(Price) AS totalCost FROM Sales;

SELECT SUM(Price) AS TotalLaptopPrice FROM Sales WHERE Product = 'Laptop';

SELECT SUM(Price * Quantity) AS totalCost FROM Sales WHERE Product = 'Laptop';


-- AVG()

SELECT AVG(Price) FROM Sales;

SELECT AVG(Price) AS AVG_PRICE FROM Sales WHERE Product = 'Laptop';

SELECT * FROM Sales
WHERE Price > (SELECT AVG(Price) FROM Sales);

SELECT AVG(Price) AS AVG_PRICE, Category FROM Sales WHERE Category = 'Electronics' GROUP BY Category;

SELECT AVG(Price) AS AVG_PRICE, Category FROM Sales GROUP BY Category;


/*
		SQL Wildcards
			1. % -> Represents zero or more characters
			2. _ -> Represents Single Character
			3. [] -> Represents any single character within the brackets  -> Used where we need to check for either of many characters
			5. !  -> Represents any character not in the brackets	h[!oa]t finds hit, but not hot and hat
			6. -  -> Represents any single character within the specified range	c[a-b]t finds cat and cbt
			7. #  -> Represents any single numeric character	2#5 finds 205, 215, 225, 235, 245, 255, 265, 275, 285, and 295
*/


SELECT * FROM Sales WHERE Product LIKE '[LCP]%';


SELECT * FROM Sales;



-- SQL JOINS

-- JOINS -> used to combine rows from two or more tables, based on related column between them
/*
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO Customers VALUES
(1, 'Alice', 'alice@example.com', 'New York'),
(2, 'Bob', 'bob@example.com', 'Los Angeles'),
(3, 'Charlie', 'charlie@example.com', 'Chicago'),
(4, 'David', 'david@example.com', 'Miami');

INSERT INTO Customers VALUES
(5, 'Abhishek', 'abhi@example.com', 'New York');


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders VALUES
(101, 1, '2024-01-10', 250.00),
(102, 2, '2024-02-15', 400.50),
(103, 1, '2024-03-05', 150.75),
(104, 3, '2024-04-20', 300.00),
(105, NULL, '2024-05-01', 500.00);
*/

SELECT * FROM Customers;

SELECT * FROM Orders;

/* 
		Types of JOINS
			1. (INNER JOIN) -> Returns records that have matching values in both the tables
			2. LEFT (OUTER) JOIN -> Return all records from Left Table, and the matched records from the right table.
			3. RIGHT (OUTER) JOIN -> Returns all records from Right Table and the matched records from the left table.
			4. FULL (OUTER) JOIN -> Return all records when there is a Match in either of Left or Right table
*/

-- INNER JOIN

	SELECT * FROM Customers INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;

	SELECT Customers.customer_id, Customers.name, Customers.city, Orders.order_id, Orders.total_amount FROM Customers INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;


-- LEFT JOIN
	
	SELECT * FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

	SELECT name, email, order_id, total_amount FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

	SELECT Customers.customer_id, name, email, order_id, total_amount FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;


-- RIGHT JOIN

	SELECT * FROM Customers RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;

	SELECT name, email, order_id, total_amount FROM Customers RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;

	SELECT Customers.customer_id, name, email, order_id, total_amount FROM Customers RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;


-- FULL JOIN

	SELECT * FROM Customers FULL OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id;

	SELECT name, email, order_id, total_amount FROM Customers FULL JOIN Orders ON Customers.customer_id = Orders.customer_id;

	SELECT Customers.customer_id, name, email, order_id, total_amount FROM Customers FULL JOIN Orders ON Customers.customer_id = Orders.customer_id;


-- SELF JOIN

	SELECT A.name AS customerName1, B.name AS customerName2, A.city
	FROM Customers A JOIN Customers B ON A.city = B.city
	WHERE A.customer_id != B.customer_id AND A.city = B.city;

	SELECT A.name, B.name FROM Customers A, Customers B WHERE A.customer_id > B.customer_id AND A.city = B.city;


	SELECT * FROM Customers SELF JOIN Customers on Customers.name = Customers.name;


-- UNION Operator
	--	-> Used to Combine result-set of two or more SELECT statements
	--			->  Every Select Statement within UNION must have the same number of columns
	--			-> Columns must also have similar datatypes
	--			-> Columns in every SELECT statement must also be in same order

	SELECT name FROM Customers UNION SELECT order_id FROM Orders;  -- This is Invalid as name and order_id has different types

	SELECT Customers.customer_id AS union_ids FROM Customers UNION SELECT Orders.order_id AS union_ids FROM Orders;


	-- HAVING Clause
			-- It is used as WHERE keyword cannot be used with aggregate functions

			SELECT Product, COUNT(Quantity) AS totalCount, SUM(Quantity * Price) AS totalCost
 			FROM Sales
			GROUP BY Product
			HAVING SUM(Quantity * Price) > 20000;

			SELECT SaleID, Product, Quantity,
			CASE
				WHEN Quantity < 2 THEN 'The quantity is less than 2'
				WHEN Quantity = 3 THEN 'The quantity is 3'
				ELSE 'The quantity is over 3'
			END AS QuantityText
			FROM Sales;




-- Stored Procedures
		-- It is a prepared SQL Code than you can save, so that the code can be reused again and again.
		-- So If there is a SQL Query that you need to write again and again , save it as Stored Procedure the just call it to execute it

		/*
				Syntax

				CREATE PROCEDURE procedureName
				AS
				sql_statement
				GO;

				EXEC procedureName;
		*/

		-- Creating a Procedure
		CREATE PROCEDURE SelectAllSales
		AS
		SELECT * FROM Sales
		GO;

		-- Calling the Procedure
		EXEC SelectAllSales;

		CREATE PROCEDURE FilterSales @Product VARCHAR(20), @Price INT
		AS
		SELECT * FROM Sales WHERE Product = @Product AND Price = @Price;

		EXEC FilterSales @Product = 'Laptop', @Price = 60000;


		-- Creating Procedure to find User By ID

		CREATE PROCEDURE GetUserById @userID INT
		AS
		BEGIN
		SELECT * FROM Users WHERE user_id = @userID;
		END

		EXEC GetUserById @userID = 45;

		-- Creating Procedure to find if User Exists in Table
		CREATE PROCEDURE UserExists @userID INT
		AS
		BEGIN
			IF NOT EXISTS (SELECT * FROM Users WHERE user_id = @userID)
			BEGIN
				PRINT 'User Does not exists!!!!'
			END
			ELSE
			BEGIN
				SELECT * FROM Users WHERE user_id = @userid;
			END
		END;

		EXEC UserExists @userID = 100;



-- STORE PROCEDURES EXAMPLES

	CREATE TABLE Employees(
		emp_id INT PRIMARY KEY NOT NULL,
		emp_name VARCHAR(40) NOT NULL,
		age INT
	);

	INSERT INTO Employees
	(emp_id, emp_name, age)
	VALUES
	(1, 'Abhishek Kushwaha', 23);




	-- ADD USER

	CREATE PROCEDURE AddEmployee
		@id INT,
		@name VARCHAR(40),
		@age INT
	AS
	BEGIN
		INSERT INTO Employees
		(emp_id, emp_name, age)
		VALUES
		(@id, @name, @age);
	END;

	EXEC AddEmployee 2, 'Andres', 54;
	EXEC AddEmployee 3, 'Harry Potter', 15;
	EXEC AddEmployee 4, 'Hermionie Granger', 16;
	EXEC AddEmployee 5, 'Ron Weasely', 16;
	EXEC AddEmployee 6, 'Ryan Reynolds', 23;




	-- GET ALL EMPLOYEE DETAILS

	CREATE PROCEDURE GetAllEmployeesDetails
	AS
	BEGIN
		SELECT emp_id AS ID, emp_name AS EmployeeNAME, age AS EmployeeAge FROM Employees;
	END;

	DROP PROCEDURE GetAllEmployeesDetails;

	EXEC GetAllEmployeesDetails;




	-- Get Single Employee Details using ID

	DROP PROCEDURE GetUserById;

	CREATE PROCEDURE GetEmployeeByID @empID INT
	AS
	BEGIN
		IF NOT EXISTS (SELECT * FROM Employees WHERE emp_id = @empID)
		BEGIN
			SELECT 'NO Employee assciated with this ID exists in database' AS Message;
		END
		ELSE
		BEGIN
			SELECT * FROM Employees WHERE emp_id = @empID;
		END
	END;


	EXEC GetEmployeeByID 20;
	EXEC GetEmployeeByID 1;



	-- Update Employee Details

	CREATE PROCEDURE UpdateEmployeeDetails
		@id INT,
		@name VARCHAR(40),
		@age INT
	AS
	BEGIN
		IF EXISTS (SELECT 1 FROM Employees WHERE emp_id = @id)
		BEGIN
			UPDATE Employees
			SET emp_name = @name, age = @age
			WHERE emp_id = @id;
		END
		ELSE
		BEGIN
			SELECT 'User does not exists with this id!!!' AS Message;
		END
	END;

	EXEC UpdateEmployeeDetails 2, 'Professor', 45;

	EXEC GetAllEmployeesDetails;



	-- Delete Employee Details

	CREATE PROCEDURE DeleteEmployeeDetails @empID INT
	AS
	BEGIN
		IF EXISTS (SELECT 1 FROM Employees WHERE emp_id = @empID)
		BEGIN
			DELETE FROM Employees
			WHERE emp_id = @empID;
		END
		ELSE
		BEGIN
			SELECT 'No Employee with this ID EXISTS!!!!' AS Message;
		END
	END;

	EXEC DeleteEmployeeDetails 6;

	EXEC GetAllEmployeesDetails;



	-- Procedure to get count of all employees

	CREATE PROCEDURE GetEmployeesCount
	AS
	BEGIN
		SELECT COUNT(*) AS Total_Employees FROM Employees;
	END;

	DROP PROCEDURE GetEmployeesCount;

	EXEC GetEmployeesCount;
	EXEC GetAllEmployeesDetails;


	-- Multiple Queries and Complex Queries for Stored Procedures

	CREATE TABLE Departments (
    dept_id INT PRIMARY KEY IDENTITY(1,1),
    dept_name VARCHAR(50) NOT NULL
	);

	CREATE TABLE Salaries (
    salary_id INT PRIMARY KEY IDENTITY(1,1),
    emp_id INT,
    amount DECIMAL(10,2),
    effective_date DATE
	);

	CREATE TABLE Staff (
    emp_id INT PRIMARY KEY IDENTITY(1,1),
    emp_name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 18),
    dept_id INT,
    salary_id INT
	);


	INSERT INTO Staff
	(emp_name, age, dept_id, salary_id)
	VALUES 
	('John Doe', 30, 1, 1),
	('Jane Smith', 25, 2, 2),
	('Mike Johnson', 40, 1, 3),
	('Emily Davis', 28, 3, 4);

	INSERT INTO Departments (dept_name) VALUES 
	('HR'),
	('IT'),
	('Finance');

	INSERT INTO Salaries (emp_id, amount, effective_date) VALUES 
	(1, 50000, '2024-01-01'),
	(2, 60000, '2024-01-01'),
	(3, 75000, '2024-01-01'),
	(4, 55000, '2024-01-01');

	SELECT * FROM Staff;
	SELECT * FROM Departments;
	SELECT * FROM Salaries;

	SELECT * FROM Staff, Departments, Salaries;   -- > This Statement will by default give CROSS Join as Output Table

	DROP Procedure GetEmployeesAndDepartments ;



	-- Running Multiple Queries Together
	CREATE PROCEDURE GetEmployeesAndDepartments @empID INT
	AS
	BEGIN
		SELECT * FROM Staff WHERE emp_id = @empID;

		SELECT * FROM Departments WHERE dept_id = (SELECT dept_id FROM Staff WHERE emp_id = @empID);

		SELECT Staff.emp_name AS [Employee Name], Departments.dept_name as [Department Name], Salaries.amount AS Salary
		FROM Staff
		LEFT JOIN Departments ON Staff.dept_id = Departments.dept_id
		LEFT JOIN Salaries ON Staff.emp_id = Salaries.emp_id
		WHERE Staff.emp_id = @empID;
	END;

	EXEC GetEmployeesAndDepartments 1;


	-- Using OUTPUT Parameters

	DROP PROCEDURE GetEmployeeInfo;

		CREATE PROCEDURE GetEmployeeInfo
			@empID INT,
			@empName VARCHAR(40) OUTPUT,
			@empAge INT OUTPUT
		AS
		BEGIN
			SELECT @empName = emp_name, @empAge = age FROM Staff WHERE emp_id = @empID;
		END;

		DECLARE @empName VARCHAR(40), @empAge INT;
		EXEC GetEmployeeInfo 2, @empNAME OUTPUT, @empAge OUTPUT;
		PRINT 'Employee Name : ' + @empName;
		PRINT 'Employee Age : ' + CAST (@empAge AS VARCHAR);



-- TRANSACTIONS USING STORED PROCEDURES

		-- > Sequence of operations performed as a single unit of work ensuring ACID (Atomicity, Consistency, Isolation and Durability) properties.
		-- > Used to maintain data Integrity

		/*
				Basic Structure of Transaction in a Stored Procedure

					BEGIN TRANSACTION -> Starts a Transaction
					COMMIT TRANSACTION -> Saves all Changes permanently
					ROLLBACK TRANSACTION -> Reverts Changes in case of an error

				Why Transactions?
					1. Prevents inconsistent data (e.g., if the update fails mid-way).
					2. Ensures reliability by rolling back changes if an error occurs.
					3. Maintains data integrity in case of system failure.
		*/

		DROP PROCEDURE UpdateSalary;

		-- Pricedure including Transaction
		CREATE PROCEDURE UpdateSalary
		@empID INT, @increment_percent DECIMAL(5, 2)
		AS
		BEGIN
			BEGIN TRANSACTION;

			BEGIN TRY
				UPDATE Salaries
				SET amount = amount + amount * @increment_percent / 100
				WHERE emp_id = @empID;
		
				COMMIT;
			END TRY
			BEGIN CATCH
				ROLLBACK;

				PRINT 'ERROR OCCURRED : ' + ERROR_MESSAGE();
			END CATCH
		END;

		EXEC UpdateSalary 1, 30;


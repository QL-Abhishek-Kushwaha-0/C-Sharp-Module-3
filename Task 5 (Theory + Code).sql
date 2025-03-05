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

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

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
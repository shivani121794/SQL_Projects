-- Operators 1)Arithmetic 2)Comparison 3)Logical 4)Bitwise 

CREATE DATABASE IF NOT EXISTS db_1;

USE db_1;

CREATE TABLE IF NOT EXISTS employee(
employee_id INT PRIMARY KEY, 
first_name VARCHAR(20) NOT NULL, 
last_name VARCHAR(20) NOT NULL,
email VARCHAR(30),
department VARCHAR(20),
salary INT,
joining_date DATE,
age INT
);

SELECT * FROM employee;

INSERT INTO employee(employee_id, first_name, last_name, email,	department,	salary,	joining_date, age)
VALUES (1, "Ram", "Yadav", "ramy122@gmail.com", "IT", 30000, '2024-05-23', 32),
(2, "Lucky", "Kumar", "luckyK232@gmail.com", "Finance", 25000, '2024-02-10', 28),
(3, "Shiv", "Kapoor", "shivka89@gmail.com", "HR", 24000, '2024-04-15', 25),
(4, "Abhishek", "Rajput", "abhishraj34@gmail.com", "Operations", 36000, '2024-11-09', 32);

SELECT first_name, salary, (salary*0.10) AS bonus
FROM employee;

-- CALCULATING NEW SALARY
SELECT first_name, 
last_name, 
salary, 
(salary*12) AS annual_salary, 
(salary*0.05) AS increment_salary,
(salary + salary*0.05) AS new_salary,
(salary *1.05) AS new_salary2
FROM employee;


-- Comparison Operators

-- Matches exact age
SELECT * 
FROM employee
WHERE age=28;

-- Matches all except 28
SELECT first_name, age
FROM employee
WHERE age!=28;

-- Salary greater than 30000
SELECT *
FROM employee
WHERE salary>30000;

-- Salary greater than or equal to 30000
SELECT *
FROM employee
WHERE salary>=30000;

-- Salary less than 30000
SELECT *
FROM employee
WHERE salary<30000;

-- Salary less than or equal to 30000
SELECT *
FROM employee
WHERE salary<=30000;

-- Logical Operators - AND , OR , NOT 
SELECT * 
FROM employee
WHERE age>=30 AND salary>=30000;

SELECT * 
FROM employee
WHERE age>=25 OR salary=20000; 

SELECT * 
FROM employee
WHERE NOT (department='IT'); 

-- BETWEEN , LIKE and IN Operators

-- Retrieve employee whose salary is between 25000 and 30000
SELECT first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 25000 and 30000;

-- Find employees whose email address end with gmail.com
SELECT first_name, last_name, email
FROM employee
WHERE email LIKE '%@gmail.com';

SELECT first_name
FROM employee
WHERE first_name LIKE 'L%';

SELECT first_name
FROM employee
WHERE first_name LIKE '%m';

SELECT first_name
FROM employee
WHERE first_name LIKE '%a%';

-- Retrieve employees who belongs to either the 'Finance' or 'IT' departments
SELECT first_name, last_name, department
FROM employee
WHERE department IN ('Finance', 'IT');

-- OTHER OPERATOR = IS NULL operator, ORDER BY operator , LIMIT operator &  Distinct operator

-- Find employees where the email column is NULL (if applicable)
SELECT first_name, last_name, email
FROM employee
WHERE email IS NULL;

-- List employees sorted by salary in Descending order
SELECT first_name, last_name, salary
FROM employee
ORDER BY salary DESC;

-- Retrieve the top 2 highest paid employees
SELECT first_name, last_name, salary
FROM employee
ORDER BY salary DESC
LIMIT 2;

-- Retrieve a list of unique departments
SELECT DISTINCT department
FROM employee;

SELECT COUNT(DISTINCT department) AS Dep_Unique_Count
FROM employee;


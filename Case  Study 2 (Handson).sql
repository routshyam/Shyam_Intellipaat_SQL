--Case Study 2 (Handson)

Create Database Feb6

Use Feb6



---Create Location Table,Deaprtment Table & Job Table 
---Insert Values in All 3 Table

---LOCATION table CREATE TABLE LOCATION ( Location_ID INT PRIMARY KEY, City VARCHAR(50) ); 

-- DEPARTMENT table CREATE TABLE DEPARTMENT ( Department_Id INT PRIMARY KEY, Name VARCHAR(50), 

---Location_Id INT, FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID) ); 

-- JOB table CREATE TABLE JOB ( Job_ID INT PRIMARY KEY, Designation VARCHAR(50) );

---Create Location Table

CREATE TABLE LOCATION (Location_ID INT PRIMARY KEY,
    City VARCHAR(50));

---Insert value into LOCATION Table

INSERT INTO LOCATION  VALUES(122, 'New York'),
(123, 'Dallas'),
(124, 'Chicago'),
(167, 'Boston');

------Create DEPARTMENT table

CREATE TABLE DEPARTMENT (
    Department_Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Location_Id INT,
    FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID));

---- Insert Value Into DEPARTMENT Table

INSERT INTO DEPARTMENT VALUES(10, 'Accounting', 122),
(20, 'Sales', 124),
(30, 'Research', 123),
(40, 'Operations', 167);


------Create JOB table

CREATE TABLE JOB (
    Job_ID INT PRIMARY KEY,
    Designation VARCHAR(50)
);

---- Insert Value Into JOB Table

INSERT INTO JOB  VALUES
(667, 'Clerk'),
(668, 'Staff'),
(669, 'Analyst'),
(670, 'Sales Person'),
(671, 'Manager'),
(672, 'President');

------Create EMPLYOYEE Table

CREATE TABLE EMPLOYEE (
    Employee_Id INT,
    Last_Name VARCHAR(50),
    First_Name VARCHAR(50),
    Middle_Name VARCHAR(50),
    Job_Id INT,
    Hire_Date DATE,
    Salary INT,
    Comm INT,
    Department_Id INT,
    FOREIGN KEY (Job_Id) REFERENCES JOB(Job_ID),
    FOREIGN KEY (Department_Id) REFERENCES DEPARTMENT(Department_Id)
);

---- Insert Value Into Employee Table

INSERT INTO EMPLOYEE  VALUES(7369, 'Smith', 'John', 'Q', 667, '1984-12-17', 800, NULL, 20),
(7499, 'Allen', 'Kevin', 'J', 670, '1985-02-20', 1600, 300, 30),
(755, 'Doyle', 'Jean', 'K', 671, '1985-04-04', 2850, NULL, 30),
(756, 'Dennis', 'Lynn', 'S', 671, '1985-05-15', 2750, NULL, 30),
(757, 'Baker', 'Leslie', 'D', 671, '1985-06-10', 2200, NULL, 40),
(7521, 'Wark', 'Cynthia', 'D', 670, '1985-02-22', 1250, 50, 30);

select * from Location
Select * from Department
Select * from job
select * from employee


-----Simple Queries:
--1. List all the employee details.

SELECT * FROM EMPLOYEE;


--2. List all the department details. 

SELECT * FROM DEPARTMENT;


--3. List all job details. 

SELECT * FROM JOB;


--4. List all the locations.

SELECT * FROM LOCATION;


--5. List out the First Name, Last Name, Salary, Commission for allEmployees.

SELECT First_Name, Last_Name, Salary, Comm FROM EMPLOYEE;


--6. List out the Employee ID, Last Name, Department ID for all employees and
--alias Employee ID as "ID of the Employee", Last Name as "Name of the
--Employee", Department ID as "Dep_id".

SELECT Employee_Id AS 'ID of the Employee', Last_Name AS 'Name of the Employee', Department_Id AS 'Dep_id' FROM EMPLOYEE;


--7. List out the annual salary of the employees with their names only.

Select * from Employee


SELECT First_Name + ' ' + Last_Name AS 'Employee Name', Salary * 12 AS 'Annual Salary' FROM EMPLOYEE;

---Reference

SELECT First_Name AS 'Employee Name', Salary * 12 AS 'Annual Salary' FROM EMPLOYEE;


----reference

SELECT First_Name + ' '+Middle_Name+' ' + Last_Name AS 'Employee Name', Salary * 12 AS 'Annual Salary' FROM EMPLOYEE;


 ----WHERE Condition:


--1. List the details about "Smith". 

SELECT * FROM EMPLOYEE WHERE Last_Name = 'Smith';

--2. List out the employees who are working in department 20.

SELECT * FROM EMPLOYEE WHERE Department_Id = 20;

--3. List out the employees who are earning salaries between 3000 and4500.

SELECT * FROM EMPLOYEE WHERE Salary BETWEEN 3000 AND 4500;

--4. List out the employees who are working in department 10 or 20.
select * from employee
SELECT * FROM EMPLOYEE WHERE Department_Id IN (10, 20);

--5. Find out the employees who are not working in department 10 or 30.

SELECT * FROM EMPLOYEE WHERE Department_Id NOT IN (10, 30);

--6. List out the employees whose name starts with 'S'.

SELECT * FROM EMPLOYEE WHERE Last_Name LIKE 'S%';

--7. List out the employees whose name starts with 'S' and ends with 'H'. 
    
	Select * from employee

	SELECT * FROM EMPLOYEE WHERE Last_Name like 'S%H' ;


--8. List out the employees whose name length is 4 and start with 'S'.

SELECT * FROM EMPLOYEE WHERE LEN(Last_Name) = 4 AND Last_Name LIKE 'S%';

-------Reference

SELECT * FROM EMPLOYEE WHERE LEN(First_Name) = 4 AND First_Name LIKE 'J%';


--9. List out employees who are working in department 10 and draw salaries more than 3500.

Select * from Employee

SELECT * FROM EMPLOYEE WHERE Department_Id = 10 AND Salary > 3500;

SELECT * FROM EMPLOYEE WHERE Comm IS NULL;

--10. List out the employees who are not receiving commission.

SELECT * FROM EMPLOYEE WHERE Comm IS NULL;


select * from Location
Select * from Department
Select * from job
select * from employee

----- ORDER BY Clause:

---1. List out the Employee ID and Last Name in ascending order based on the Employee ID. 

SELECT Employee_Id, Last_Name FROM EMPLOYEE ORDER BY Employee_Id ASC;

---2. List out the Employee ID and Name in descending order based on salary. 

SELECT Employee_Id, First_Name + ' ' + Last_Name AS 'Name',Salary FROM EMPLOYEE ORDER BY Salary DESC;

---3. List out the employee details according to their Last Name in ascending-order.

SELECT * FROM EMPLOYEE ORDER BY Last_Name ASC;

---4. List out the employee details according to their Last Name in ascending
---order and then Department ID in descending order.

SELECT * FROM EMPLOYEE ORDER BY Last_Name , Department_Id DEsc ;


---reference

SELECT *
FROM (
    SELECT *
    FROM EMPLOYEE
) AS EmployeeDetails
ORDER BY Last_Name ASC, Department_Id DESC;

----Reference ---> Distinct

SELECT DISTINCT Last_Name AS ResultColumn
FROM EMPLOYEE
ORDER BY Last_Name ASC;

SELECT DISTINCT Department_Id AS ResultColumn
FROM EMPLOYEE
ORDER BY Department_Id DESC;



------GROUP BY and HAVING Clause:

---1. How many employees are in different departments in the organization?

SELECT Department_Id, COUNT(*) AS NumberOfEmployees
FROM EMPLOYEE
GROUP BY Department_Id;

---2. List out the department wise maximum salary, minimum salary and
--average salary of the employees.

select * from EMPLOYEE

SELECT Department_Id, MAX(Salary) AS MaxSalary, MIN(Salary) AS MinSalary, AVG(Salary) AS AvgSalary
FROM EMPLOYEE
GROUP BY Department_Id;


---3. List out the job wise maximum salary, minimum salary and average
--salary of the employees.

SELECT Job_Id, MAX(Salary) AS MaxSalary, MIN(Salary) AS MinSalary, AVG(Salary) AS AvgSalary
FROM EMPLOYEE
GROUP BY Job_Id;

---4. List out the number of employees who joined each month in ascendingorder.

select * from EMPLOYEE


SELECT MONTH(Hire_Date) AS JoiningMonth, COUNT(*) AS NumberOfEmployees
FROM EMPLOYEE
GROUP BY MONTH(Hire_Date)
ORDER BY JoiningMonth ASC;

---5. List out the number of employees for each month and year in
--ascending order based on the year and month. 

SELECT YEAR(Hire_Date) AS JoiningYear, MONTH(Hire_Date) AS JoiningMonth, COUNT(*) AS NumberOfEmployees
FROM EMPLOYEE
GROUP BY YEAR(Hire_Date), MONTH(Hire_Date)
ORDER BY JoiningYear ASC, JoiningMonth ASC;

---6. List out the Department ID having at least four employees. 

SELECT Department_Id, COUNT(*) AS NumberOfEmployees
FROM EMPLOYEE
GROUP BY Department_Id
HAVING COUNT(*) >= 4;


---7. How many employees joined in the month of January?

SELECT COUNT(*) AS NumberOfEmployees
FROM EMPLOYEE
WHERE MONTH(Hire_Date) = 1;

---8. How many employees joined in the month of January or September?

select * from EMPLOYEE

SELECT COUNT(*) AS NumberOfEmployees
FROM EMPLOYEE
WHERE MONTH(Hire_Date) IN (1, 9);


---9. How many employees joined in 1985?

SELECT COUNT(*) AS NumberOfEmployees
FROM EMPLOYEE
WHERE YEAR(Hire_Date) = 1985;

----- reference

select Count(Hire_date) Join_Employee_1985 from Employee where Year(hire_date) = 1985


---10. How many employees joined each month in 1985?

SELECT MONTH(Hire_Date) AS JoiningMonth, COUNT(*) AS NumberOfEmployees
FROM EMPLOYEE
WHERE YEAR(Hire_Date) = 1985
GROUP BY MONTH(Hire_Date);

---11. How many employees joined in March 1985?

select * from EMPLOYEE

SELECT COUNT(*) AS NumberOfEmployees
FROM EMPLOYEE
WHERE MONTH(Hire_Date) = 3 AND YEAR(Hire_Date) = 1985;


---12. Which is the Department ID having greater than or equal to 3 employees
---joining in April 1985?

select * from EMPLOYEE

SELECT Department_Id, COUNT(*) AS NumberOfEmployees
FROM EMPLOYEE
WHERE MONTH(Hire_Date) = 4 And YEAR(Hire_Date) = 1985
GROUP BY Department_Id
HAVING COUNT(Department_Id) >= 3;

-------JOINS:

---1. List out employees with their department names. 

select * from EMPLOYEE
select * from DEPARTMENT

SELECT EMPLOYEE.Employee_Id, EMPLOYEE.Last_Name, EMPLOYEE.First_Name, DEPARTMENT.Name AS Department_Name
FROM EMPLOYEE
JOIN DEPARTMENT ON EMPLOYEE.Department_Id = DEPARTMENT.Department_Id;

---Reference

SELECT E.Employee_Id, E.Last_Name, E.First_Name, D.Name AS Department_Name
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id;


---2. Display employees with their designations.

select * from EMPLOYEE
select * from JOB

SELECT EMPLOYEE.Employee_Id, EMPLOYEE.Last_Name, EMPLOYEE.First_Name, JOB.Designation
FROM EMPLOYEE
JOIN JOB ON EMPLOYEE.Job_Id = JOB.Job_ID;

---3. Display the employees with their department names and regional groups.

select * from LOCATION

SELECT EMPLOYEE.Employee_Id, EMPLOYEE.Last_Name, EMPLOYEE.First_Name, DEPARTMENT.Name AS Department_Name, LOCATION.City AS Regional_Group
FROM EMPLOYEE
JOIN DEPARTMENT ON EMPLOYEE.Department_Id = DEPARTMENT.Department_Id
JOIN LOCATION ON DEPARTMENT.Location_Id = LOCATION.Location_ID;

---4. How many employees are working in different departments? Display with
---department names. 

SELECT DEPARTMENT.Name AS Department_Name, COUNT(*) AS NumberOfEmployees
FROM EMPLOYEE
JOIN DEPARTMENT ON EMPLOYEE.Department_Id = DEPARTMENT.Department_Id
GROUP BY DEPARTMENT.Name;

---5. How many employees are working in the sales department?

select * from EMPLOYEE
select * from DEPARTMENT
----with SingleEmployee Table 
SELECT COUNT(*) AS NumberOfEmployees
FROM EMPLOYEE
WHERE Department_Id = (SELECT Department_Id FROM DEPARTMENT WHERE Name = 'Sales')

----With Join Employee & Department Table

SELECT D.Name, COUNT(*) AS NumberOfEmployeesInSales
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id
WHERE D.Name = 'Sales' group by D.Name


---6. Which is the department having greater than or equal to 5
---employees? Display the department names in ascending order.

--Note -----> No department in the employee table 

select * from EMPLOYEE
select * from DEPARTMENT




SELECT D.Department_Id, D.Name AS Department_Name, COUNT(E.Employee_Id) AS NumberOfEmployees
FROM DEPARTMENT D
full JOIN EMPLOYEE E ON D.Department_Id = E.Department_Id
GROUP BY D.Department_Id, D.Name
HAVING COUNT(E.Employee_Id) >= 5
ORDER BY D.Name ASC;

---Here Department Id is not equal 5 but Dapartname in Asc order with the use of order by


SELECT D.Department_Id, D.Name AS Department_Name, COUNT(E.Employee_Id) AS NumberOfEmployees
FROM DEPARTMENT D
LEFT JOIN EMPLOYEE E ON D.Department_Id = E.Department_Id
GROUP BY D.Department_Id, D.Name
ORDER BY D.Name ASC;

---7. How many jobs are there in the organization? Display with designations.

select * from DEPARTMENT
select * from JOB

SELECT J.Job_ID, J.Designation, D.Name AS Department_Name
FROM JOB J
full JOIN DEPARTMENT D ON J.Job_ID = D.Department_Id;


---8. How many employees are working in "New York"?

select * from EMPLOYEE
select * from LOCATION
select * from DEPARTMENT

SELECT COUNT(*) AS NumberOfEmployees
FROM EMPLOYEE
inner JOIN DEPARTMENT ON EMPLOYEE.Department_Id = DEPARTMENT.Department_Id
inner JOIN LOCATION ON DEPARTMENT.Location_Id = LOCATION.Location_ID
WHERE LOCATION.City = 'New York';

---9. Display the employee details with salary grades. Use conditional statement to
---create a grade column. 
select * from JOB
select * from EMPLOYEE


SELECT E.Employee_Id,J.Job_ID ,E.Last_Name, E.First_Name, E.Salary,
    CASE 
       WHEN Salary >= 2200 THEN 'A'
        WHEN Salary >= 1250 AND Salary < 2200 THEN 'B'
        WHEN Salary >= 800 AND Salary < 1250 THEN 'C'
        ELSE 'D'
    END AS Salary_Grade ,
    J.Designation
FROM EMPLOYEE E
JOIN JOB J ON E.Job_Id = J.Job_ID order by Salary_Grade Asc;


----Reference ---- > No Join

SELECT Employee_Id, Last_Name, First_Name, Salary,
    CASE 
        WHEN Salary >= 2750 THEN 'A'
        WHEN Salary >= 1600 AND Salary < 2750 THEN 'B'
        WHEN Salary >= 1250 AND Salary < 1600 THEN 'C'
        ELSE 'D'
    END AS Salary_Grade 
FROM EMPLOYEE order by Salary_Grade Asc;




--10. List out the number of employees grade wise. Use conditional statementto
--create a grade column. 
select * from DEPARTMENT
select * from job
select * from employee


 

SELECT 
    CASE 
       WHEN Salary >= 2200 THEN 'A'
        WHEN Salary >= 1250 AND Salary < 2200 THEN 'B'
        WHEN Salary >= 800 AND Salary < 1250 THEN 'C'
        ELSE 'D'
    END AS Salary_Grade,
    J.Designation,
    COUNT(*) AS NumberOfEmployees
FROM EMPLOYEE E
JOIN JOB J ON E.Job_Id = J.Job_ID
GROUP BY 
    CASE 
        WHEN Salary >= 2200 THEN 'A'
        WHEN Salary >= 1250 AND Salary < 2200 THEN 'B'
        WHEN Salary >= 800 AND Salary < 1250 THEN 'C'
        ELSE 'D'
    END,
    J.Designation ORDER BY Salary_Grade;


--11.Display the employee salary grades and the number of employees
--between 2000 to 5000 range of salary. 

SELECT 
    CASE 
        WHEN Salary >= 2750 THEN 'A'
        WHEN Salary >= 1600 AND Salary < 2750 THEN 'B'
        WHEN Salary >= 1250 AND Salary < 1600 THEN 'C'
        ELSE 'D' 
    END AS Salary_Grade,
    COUNT(*) AS NumberOfEmployeesInRange
FROM EMPLOYEE E
JOIN JOB J ON E.Job_Id = J.Job_ID
WHERE E.Salary >= 2000 AND E.Salary <= 5000
GROUP BY 
    CASE 
         WHEN Salary >= 2750 THEN 'A'
        WHEN Salary >= 1600 AND Salary < 2750 THEN 'B'
        WHEN Salary >= 1250 AND Salary < 1600 THEN 'C'
        ELSE 'D'
    END;


--12. Display all employees in sales or operation departments.

SELECT * FROM DEPARTMENT
SELECT * FROM EMPLOYEE

SELECT E.*
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id
WHERE D.Name IN ('Sales', 'Operations');

-----OR operator----Reference

SELECT E.*
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id
WHERE D.Name = 'Sales' OR D.Name = 'Operations'


------SET Operators:


---1. List out the distinct jobs in sales and accounting departments. 
---Using Union to Display distinct Sales & Accounting Deapartmaent

SELECT Designation AS Job
FROM EMPLOYEE E
JOIN JOB J ON E.Job_Id = J.Job_ID
JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id
WHERE D.Name = 'Sales'

UNION

SELECT Designation AS Job
FROM EMPLOYEE E
JOIN JOB J ON E.Job_Id = J.Job_ID
JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id
WHERE D.Name = 'Accounting';

---2. List out all the jobs in sales and accounting departments.

SELECT Designation AS Job
FROM EMPLOYEE E
JOIN JOB J ON E.Job_Id = J.Job_ID
JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id
WHERE D.Name = 'Sales'

UNION ALL

SELECT Designation AS Job
FROM EMPLOYEE E
JOIN JOB J ON E.Job_Id = J.Job_ID
JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id
WHERE D.Name = 'Accounting';


---3. List out the common jobs in research and accounting
---departments in ascending order. 

    select * from EMPLOYEE
	select * from DEPARTMENT
	select * from job



SELECT Designation AS Job
FROM JOB J
JOIN EMPLOYEE E ON J.Job_ID = E.Job_Id
JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id
WHERE D.Name = 'Research'

INTERSECT

-- Select common jobs in Accounting department
SELECT Designation AS Job
FROM JOB J
JOIN EMPLOYEE E ON J.Job_ID = E.Job_Id
JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id
WHERE D.Name = 'Accounting'
ORDER BY Job ASC;
------No  Common 


------Subqueries:

---1. Display the employees list who got the maximum salary.

SELECT *
FROM EMPLOYEE
WHERE Salary = (SELECT MAX(Salary) FROM EMPLOYEE);

---2. Display the employees who are working in the sales department. 

SELECT *
FROM EMPLOYEE
WHERE Department_Id IN (SELECT Department_Id FROM DEPARTMENT WHERE Name = 'Sales');

---3. Display the employees who are working as 'Clerk'. 

   select * from job
   select * from EMPLOYEE


SELECT E.*,J.*
FROM EMPLOYEE E join Job J on E.Job_Id=J.Job_ID 
WHERE J.Job_ID IN (SELECT Job_ID FROM JOB WHERE Designation = 'Clerk');

---4. Display the list of employees who are living in "New York". 

select * from LOCATION
select * from EMPLOYEE

SELECT *
FROM EMPLOYEE
WHERE Department_Id IN (SELECT Location_ID FROM LOCATION WHERE City = 'New York');

---Here No body from " New York"

---5. Find out the number of employees working in the sales department.

Select * from EMPLOYEE
Select * from DEPARTMENT

SELECT D5.Name AS Department_Name, 
       (SELECT COUNT(*) 
        FROM EMPLOYEE E5 
        WHERE E5.Department_Id = D5.Department_Id) AS Number_of_Emp_working
FROM DEPARTMENT D5
WHERE D5.Name = 'Sales';

---6. Update the salaries of employees who are working as clerks on the basis of 10%. 
Select * from EMPLOYEE
Select * from DEPARTMENT

-- Display the information before the update

SELECT E.Employee_Id, E.Last_Name, E.First_Name, E.Middle_Name, J.Designation, E.Salary
FROM EMPLOYEE E
JOIN JOB J ON E.Job_Id = J.Job_ID
WHERE J.Designation = 'Clerk';

-- Update the salaries of employees who are working as clerks on the basis of 10%

UPDATE EMPLOYEE
SET Salary = Salary * 1.10
WHERE Job_Id IN (SELECT Job_ID FROM JOB WHERE Designation = 'Clerk');

-- Display the updated information

SELECT E.Employee_Id, E.Last_Name, E.First_Name, E.Middle_Name, J.Designation, E.Salary
FROM EMPLOYEE E
JOIN JOB J ON E.Job_Id = J.Job_ID
WHERE J.Designation = 'Clerk';


---7. Delete the employees who are working in the accounting department.

Select * from EMPLOYEE
Select * from DEPARTMENT


-- Display the information before the deletion

SELECT E.Employee_Id, E.Last_Name, E.First_Name, E.Middle_Name, E.Salary, D.Name AS Department_Name
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id
WHERE D.Name = 'Accounting';

-- Delete the employees working in the accounting department using "SUBQUERY"

DELETE FROM EMPLOYEE
WHERE Department_Id IN (SELECT Department_Id FROM DEPARTMENT WHERE Name = 'Accounting');

-- Display the information after the deletion

SELECT E.Employee_Id, E.Last_Name, E.First_Name, E.Middle_Name, E.Salary, D.Name AS Department_Name
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id
WHERE D.Name = 'Accounting';

---Note---- > No body Associate with "Accounting" Deaprtment


---8. Display the second highest salary drawing employee details. 

SELECT *
FROM EMPLOYEE
WHERE Salary = (
    SELECT MAX(Salary)
    FROM EMPLOYEE
    WHERE Salary < (
        SELECT MAX(Salary)
        FROM EMPLOYEE
    ));


--9. Display the nth highest salary drawing employee details. 

DECLARE @N INT = 3; -- Set the value of N as needed

SELECT *
FROM EMPLOYEE
WHERE Salary = (
    SELECT DISTINCT TOP 1 Salary
    FROM (
        SELECT DISTINCT TOP (@N) Salary
        FROM EMPLOYEE
        ORDER BY Salary DESC
    ) AS SalarySubquery
    ORDER BY SalarySubquery.Salary ASC
);



---10. List out the employees who earn more than every employee in department 30. 

select * from employee

SELECT First_Name+' '+Middle_Name+' '+Last_Name As Employee_Name,* 
FROM EMPLOYEE
WHERE Salary =(
    SELECT Distinct MaX(Salary)
    FROM EMPLOYEE
    WHERE Department_Id=30
);

---11. List out the employees who earn more than the lowest salary in
---department.Find out whose department has no employees. 

select * from EMPLOYEE
select * from DEPARTMENT

-- List out employees who earn more than the lowest salary in their department

SELECT E1.*
FROM EMPLOYEE E1 
WHERE E1.Salary > (
    SELECT Distinct MIN(E2.Salary)
    FROM EMPLOYEE E2
    WHERE E2.Department_Id = E1.Department_Id 
) order by salary desc

-- Find out which departments have no employees

SELECT D3.Name AS Department_Name
FROM DEPARTMENT D3
WHERE NOT EXISTS (
    SELECT 1
    FROM EMPLOYEE E3
    WHERE E3.Department_Id = D3.Department_Id
);




---12. Find out which department has no employees. 


SELECT D3.Name AS Department_Name
FROM DEPARTMENT D3
WHERE NOT EXISTS (
    SELECT 1
    FROM EMPLOYEE E3
    WHERE E3.Department_Id = D3.Department_Id
);
---13. Find out the employees who earn greater than the average salary for their department.

SELECT E1.*
FROM EMPLOYEE E1
WHERE E1.Salary > (
    SELECT AVG(E2.Salary)
    FROM EMPLOYEE E2
    WHERE E2.Department_Id = E1.Department_Id
);


------------*----------

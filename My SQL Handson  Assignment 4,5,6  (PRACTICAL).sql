--My assignment 4,5,6


--------4th ASSIGNMENT

---you have successfully clered your third semestar,in the fourth semestar you will work with inbuilt function and user-defined functions.
--------Task to be performed:
--1.Use the inbuilt functions and find the minimum,maximum and average amount from the orders table.
--2.ceate a user-defined function which will multiply the given number with 10.
--3.use the case statement to check if 100 is less than 200 ,greater than 200 or equal to 200 and  print the corresponding values.
--4.using a case statement ,find the status of the amount .set the status of the amount as high amount,low amount
----or medium amount based upon the condition.
--5.create a user-defined function ,to fetch amount greater than the given input.

---Task to be performed

------------PRACTICAL (HANDSON)

CREATE DATABASE JAN6

USE january6

CREATE TABLE Customer(Customer_ID INT,First_name VARCHAR(20),Last_name varchar(25),
Email varchar(50),Address varchar(30),City varchar(30),State varchar(30),zip int)


-- Single Record

insert into Customer values (1,'Sana','B','sana@gmail.com','Jayanagar','Bangalore','Karnataka',5877)

-- Multiple Records


insert into Customer (customer_id, first_name, last_name, email, address, city, state,zip)
values (2, 'Apurva','Wankade','apurva@yahoo.com','5th Cross','Pune','Mumbai',6894),
		(3,'Gautham','Sinha','gautham@yahoo.com','New City','San Jose','CA',12868),
		(4,'Vishal','V','vishal@gmail.com','4th Cross','Chennai','TamilNadu',6958),
		(5,'Bob','Barly','bob@hotmail.com','3rd Street','Texas','CA',84985);

create table Orders (order_id int, order_date date, amount int, customer_id int)

--insert
insert into Orders (order_id, order_date, amount, customer_id)
values (101, '2021-07-04',2450, 1),
		(201, '2018-09-13',5670,3),
		(301,'2020-02-02',2000,5),
		(401,'2019-01-05',3500,6),
		(501,'2021-06-03',300,7)

-- Reference
alter table Orders
alter column order_date date


select * from Customer
select * from Orders

------1.Use the inbuilt functions and find the minimum,maximum and average amount from the orders table.


select MIN(AMOUNT) as Minimum_Amount,MAX(amount) as Maximum_Amount 
,AVG(AMOUNT) as Average_Amount from Orders

--OR

select * from Orders
select MAX(amount) as Maximum_Amount from Orders
select MIN(AMOUNT) as Minimum_Amount from Orders
select AVG(AMOUNT) as Average_Amount from Orders

--------2.ceate a user-defined function which will multiply the given number with 10.

 ---To Alter function use Alter instead of Create


create function Multiply(@Input Int)---Input declaration
returns int
as
Begin
Return(@Input*10)---Calculation
End

----To see function
----Database > Programmibility > Function > Scalar Valued Function

-----Calling Function

select dbo.multiply(5) as multiply_value

---Reference


create function Rectangle(@len float,@wid float)---Input declaration
returns float
as
Begin
Return(@len * @wid)---Calculation        
End

select dbo.Rectangle (14.5,27.3) As Area_of_Rectangle

----Reference


create function Triangle(@a float,@b  float,@c float)---Input declaration          
returns float
as
Begin
Return (1*(@a*@b*@c)/3)-----or ((@a*@b*@c)*(1.0/3.0))------Calculation   
End

select dbo.triangle (10,25,36) As Area_of_Triangle

--3.use the case statement to check if 100 is less than 200 ,greater than 200 or equal to 200 and  print the corresponding values.

select case
        when 100 < 200 then ' 100 is less than 200'
	    when 100 = 200 then ' 100 is equal to 200'
	    when 100 > 200 then ' 100 is greater than 200'
end as Result

---reference
_----Also can Add Else statement if any condition is not true

select case
        when 100 < 200 then ' 100 is less than 200'
	    when 100 = 200 then ' 100 is equal to 200'
	    when 100 > 200 then ' 100 is greater than 200'
		Else 'None of the condition is true'
end as Result

--4.using a case statement ,find the status of the amount .set the status of the amount as high amount,low amount
----or medium amount based upon the condition.

Select Amount from Orders
Select *,
case
     when Amount < 500 then 'Low Amount'
	 when Amount >= 500 and amount < 2500 then 'Medium Amunt'
	 when Amount >= 2500 then 'High Amount'
 End As Amount_Status 
 from orders

 ---Reference
----Use IIF condition

select Amount,IIF(Amount > 2500 , 'High Amount','Low Amount') as Amount_status from orders

---Reference
----Nested if statement

Declare @Max int
   set @Max = 5670
if
@Max = (select max(Amount) from orders)
    select * from Orders
Else 
    select * from Customer


-----Reference----If 1st condition is false
    
Declare @Max int
   set @Max = 5000
if
@Max = (select max(Amount) from orders)
    select * from Orders
Else 
    select * from Customer
    

-----How to create Table valued function
--5.create a user-defined function ,to fetch amount greater than the given input


create Function Amount (@Val int)
returns table
as
return select * from orders
     where Amount > @Val

---Calling Function

select * from   Dbo.Amount(2050)



----5th ASSIGNMENT


--Tasks To Be Performed:
---1. Arrange the ‘Orders’ dataset in decreasing order of amount
---2. Create a table with the name ‘Employee_details1’ consisting of these
----columns: ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. Create another table with
----the name ‘Employee_details2’ consisting of the same columns as the first
----table.
---3. Apply the UNION operator on these two tables
---4. Apply the INTERSECT operator on these two tables
---5. Apply the EXCEPT operator on these two tables


---------Task to be performed

--1.Arrange the 'Orders' dataset in decreasing order of amount
------Sorting amount column in desc order


select * from orders order by Amount desc

-----2. Create a table with the name ‘Employee_details1’ consisting of these
----columns: ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. Create another table with
----the name ‘Employee_details2’ consisting of the same columns as the first
----table

-----Employee_details1 & Employee_details2

create table Employee_details1 (Emp_id int , Emp_name varchar (20) , Emp_Salary int)
insert into Employee_details1 values (1,'Mary',25000),
(2,'Ramesh',45000),
(3,'Lily',35000)

create table Employee_details2 (Emp_id int , Emp_name varchar (20) , Emp_Salary int)

insert into Employee_details2 values (4,'Jack',75000),
(5,'Rose',47000),
(3,'Lily',35000)

---3. Apply the UNION operator on these two tables
---Union

select Emp_name from Employee_details1
union 
select Emp_name from Employee_details2

select Emp_id from Employee_details1
union 
select Emp_id from Employee_details2

select Emp_Salary from Employee_details1
union 
select Emp_Salary from Employee_details2

select * from Employee_details1
union 
select * from Employee_details2     

------Reference (with Duplicate)

select * from Employee_details1
union all
select * from Employee_details2


---4. Apply the INTERSECT operator on these two tables

select * from Employee_details1
INTERSECT
select * from Employee_details2



---5. Apply the EXCEPT operator on these two tables

select * from Employee_details1
except
select * from Employee_details2

select * from Employee_details2
except
select * from Employee_details1

----------6 TH ASSIGNMENT


---You have successfully cleared your fifth semester. In the final semester you will
---work with views, transactions and exception handling. Tasks To Be Performed:
---1. Create a view named ‘customer_san_jose’ which comprises of only those
---customers who are from San Jose
---2. Inside a transaction, update the first name of the customer to Francis
---where the last name is Jordan:
---a. Rollback the transaction
---b. Set the first name of customer to Alex, where the last name is
---Jordan
---3. Inside a TRY... CATCH block, divide 100 with 0, print the default error message .
---4. Create a transaction to insert a new record to Orders table and save it.

---------Task to be performed

---1. Create a view named ‘customer_san_jose’ which comprises of only those
---customers who are from San Jos

select * from Customer

---VIEW

Create view customer_San_Jose

As

select *  from  Customer
    where City = 'San Jose'

---For calling View

select * from customer_San_Jose 

---2. Inside a transaction, update the first name of the customer to Francis
---where the last name is Jordan:
---a. Rollback the transaction
---b. Set the first name of customer to Alex, where the last name is
---Jordan


---Rollback Transaction
---update firstname as Francis where the last name is jordan

select * from customer

---Considering last name Barly Instead of jordan

Begin transaction

 update  customer set first_name = 'Francis' where last_name = 'barly' 
 
 rollback

 ---b. Set the first name of customer to Alex, where the last name is
---Jordan

select * from customer


---Considering last name Barly Instead of jordan


Begin transaction

 update  customer set first_name = 'Alex' where last_name = 'barly' 

 commit

---3. Inside a TRY... CATCH block, divide 100 with 0, print the default error message .
----Try & Catch Block

begin try
   select  100/0 as result
end try
 begin catch
        print Error_message()
 end catch
 

 ---4. Create a transaction to insert a new record to Orders table and save it.
 ---inserting a record inside a transaction

 Begin Transaction
  Insert into Orders values (601,'2024-01-06',3456,5)
  commit

select * from orders

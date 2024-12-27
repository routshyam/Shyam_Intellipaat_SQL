-----My Asssignment 1 (SQL Handson)

---Task to be performed

---1. Insert a new record in your Orders table.
---2. Add Primary key constraint for SalesmanId column in Salesman table. Add default
---constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
---column in Customer table. Add not null constraint in Customer_name column for the
---Customer table.
---3. Fetch the data where the Customer’s name is ending with either ‘N’ also get the
---purchase amount value greater than 500.
---4. Using SET operators, retrieve the first result with unique SalesmanId values from two
---tables, and the other result containing SalesmanId without duplicates from two tables.
---5. Display the below columns which has the matching data.
---Orderdate, Salesman Name, Customer Name, Commission, and City which has the
---range of Purchase Amount between 1500 to 3000.
---6. Using right join fetch all the results from Salesman and Orders table.


Create Database Assignment
Use Assignment

------Create Salesman Table, Orders Table,Customer Table


----Salesman table creation

CREATE TABLE Salesman (
    SalesmanId INT,
    Name VARCHAR(255),
    Commission DECIMAL(10, 2),
    City VARCHAR(255),
    Age INT
);


------Salesman table record insertion 



INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
    (101, 'Joe', 50, 'California', 17),
    (102, 'Simon', 75, 'Texas', 25),
    (103, 'Jessie', 105, 'Florida', 35),
    (104, 'Danny', 100, 'Texas', 22),
    (105, 'Lia', 65, 'New Jersey', 30);

------Customer table creation
	
CREATE TABLE Customer (
    SalesmanId INT,
    CustomerId INT,
    CustomerName VARCHAR(255),
    PurchaseAmount INT,
    );

-------Customer table record insertion 


INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
    (101, 2345, 'Andrew', 550),
    (103, 1575, 'Lucky', 4500),
    (104, 2345, 'Andrew', 4000),
    (107, 3747, 'Remona', 2700),
    (110, 4004, 'Julia', 4545);

-----Orders table Creation


CREATE TABLE Orders (OrderId int, CustomerId int, SalesmanId int, Orderdate Date, Amount money)


-----Orders table record insertion 

INSERT INTO Orders Values 
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)


---1. Insert a new record in your Orders table.

Insert into Orders values (5002,2234,104,'2023-05-16',2800)
select * from Orders

---2. Add Primary key constraint for SalesmanId column in Salesman table. Add default
---constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
---column in Customer table. Add not null constraint in Customer_name column for the
---Customer table.



select * from Salesman


----Primary key is combine of not null & unique
----For 
Alter Table salesman alter column salesmanid int not null

Alter Table  salesman Add constraint pk_Saleid primary key (Salesmanid)

----Add default constraint for City column in Salesman table

Alter table salesman add constraint DF_City Default ' pune' for city ;

----Add Foreign key constraint for SalesmanId column in Customer table.

select * from Salesman
select * from Customer

----For  Establish relationship between Salesman & Customer Table Value Should be common
----update value in customer Table

update Customer set SalesmanId=105 where SalesmanId=110


---Foreign key constraint in Customer(Salaesmanid)

Alter table Customer add constraint FK_id foreign key (Salesmanid) references salesman(salesmanid)

----Add not null constraint in Customer_name column for the
---Customer table.

select * from Customer

---Not null constraint in Customer(Customer_name)

Alter table Customer Alter column CustomerName varchar(255) Not null

---3. Fetch the data where the Customer’s name is ending with either ‘N’ also get the
---purchase amount value greater than 500.

select * from Customer

---Here, And operator is used  for both conditon should be  match with table column value

Select * from customer where CustomerName like '%N' AND PurchaseAmount > 500


----There is no value in customer name column which is end with '%N'


---4. Using SET operators, retrieve the first result with unique SalesmanId values from two
---tables, and the other result containing SalesmanId without duplicates from two tables.

select * from Salesman
select * from orders

----unique Salesmanid value from orders & Salesman Table


select SalesmanId from Salesman
union
select SalesmanId from Orders

-----No duplicate value from  Orders & Salesman Table

Select distinct salesmanid from Salesman
union
Select distinct Salesmanid from Orders




---5. Display the below columns which has the matching data.
---Orderdate, Salesman Name, Customer Name, Commission, and City which has the
---range of Purchase Amount between 1500 to 3000.

Select * From Salesman
select * From Customer
select * from Orders

--- Here i am using fulljoin for display all these columns .

----Using Salesman.Name Instead of salesmanName 



select S.Name,C.CustomerName,O.Orderdate,S.Commission,S.City from Salesman S  full join Customer C on S.SalesmanId = C.SalesmanId 
 full join Orders O on C.SalesmanId = O.SalesmanId Where  C.PurchaseAmount Between 1500 And 3000

---Reference 
---Also Adding PurchaseAmount Column for Display

select S.Name,C.CustomerName,O.Orderdate,S.Commission,S.City,C.PurchaseAmount from Salesman S  left join Customer C on S.SalesmanId = C.SalesmanId 
 left join Orders O on C.SalesmanId = O.SalesmanId Where  C.PurchaseAmount Between 1500 And 3000
 Select * From Salesman
select * From Customer
select * from Orders






---6. Using right join fetch all the results from Salesman and Orders table.

select * from Salesman
select * from Orders

Select * from Salesman Right Join Orders on Salesman.SalesmanId = Orders.SalesmanId 


------*----------*------


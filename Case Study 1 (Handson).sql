﻿----Case Study 1 (Handson)

---CSV (Comma Separated value)


Create Database Jan7
Use Jan7

-----Fact,Product,Location

----Tasks to be performed:

---1. Display the number of states present in the LocationTable. 

select * from location

select count( state) from location

---Distinct

select count(Distinct state) As No_of_State from location

---2. How many products are of regular type?

select * from Product

select count(Product) No_of_Regular from Product where Type = 'Regular'

---3. How much spending has been done on marketing of product ID 1?

select * from Fact

select sum(marketing)  As Spending from fact
where productid = 1

---4. What is the minimum sales of a product?
----with the help of of join display the minimum sales of a product 
select * from Fact
select * from product

select Product,Sales from fact 
inner join product on
product.productid = fact.productid
where sales =(Select min(Sales) As min_sales from Fact)


---5. Display the max Cost of Good Sold (COGS). 



select max(COGS) Max_COGS from Fact


---6. Display the details of the product where product type is coffee.

select * from product where Product_Type = 'Coffee'

---7. Display the details where total expenses are greater than 40.

Select * from Fact 
where Total_Expenses >40
order by Total_Expenses



---8. What is the average sales in area code 719?

Select * from Fact 


select Avg(sales) Avg_sales from Fact
where Area_code = 719

---Reference

select Area_code,Avg(sales) Average_sales from Fact where area_code = 719  Group by Area_code 

----Even you can use ' having  Area_code = 719 ' After ' group by  Area_code ' Instead of 'Where are_code= 719'

---9. Find out the total profit generated by Colorado state.

  select * from location
  select * from Fact

 Select state , sum(f.profit) As Total_Profit from Fact F full join Location L on
 F.Area_code = L.Area_code Where state = 'Colorado'
 Group by state

---10. Display the average inventory for each product ID.

select productid,Avg(inventory) AS Avg_Inventory from Fact group by productid
order by productid

---11. Display state in a sequential order in a Location Table.
  
  select * from location
  select  State from location order by state

---12. Display the average budget of the Product where the average budget
---margin should be greater than 100.

select * from fact

SELECT AVG(Budget_Sales) AS AvgBudget
FROM fact
WHERE Budget_Margin > 100

--13.What is the total sales done on date 2010-01-01?

SELECT SUM(Sales) AS TotalSales
FROM fact
WHERE Date = '2010-01-01';

--14.Display the average total expense of each product ID on an individual date.

Select * from fact

SELECT ProductId, Date, AVG(Total_Expenses) AS Avg_Total_Expense
FROM Fact
GROUP BY ProductId, Date;

--15.Display the table with the following attributes such as date, productID, product_type, product, sales, profit, state, area_code.

Select * from Product
Select * from Fact
Select * from Location

SELECT F.Date, F.ProductId, P.Product_Type, P.Product, F.Sales, F.Profit, L.State, F.Area_Code
FROM Product P
JOIN Fact F ON P.ProductId = F.ProductId
JOIN Location L ON F.Area_Code = L.Area_Code;

---16.Display the rank without any gap to show the sales wise rank.

SELECT Distinct Date, ProductId, Sales ,DENSE_RANK() OVER (ORDER BY Sales DESC) AS   Sales_Rank
FROM Fact order by Sales_rank

--17.Find the state-wise profit and sales.

SELECT State, SUM(Profit) AS Total_Profit, SUM(Sales) AS Total_Sales
FROM Fact F
JOIN Location L ON F.Area_Code = L.Area_Code
GROUP BY State;

--18.Find the state-wise profit and sales along with the product name.

select * from Fact
Select * From Location
Select * From Product

SELECT State, P.Product As Product_Name, SUM(F.Profit) AS Total_Profit, SUM(F.Sales) AS Total_Sales
FROM Product P
JOIN Fact F ON P.Productid = F.Productid
JOIN Location L  ON F.Area_code = L.Area_code
GROUP BY  State, Product 

--19.IF there is an increase in sales of 5%, calculate the increased sales.

SELECT Date, ProductId, Sales, Sales * 1.05 AS Increased_Sales
FROM Fact;

--20.Find the maximum profit along with the product ID and product type.

Select * from Fact
Select * from Product

SELECT F.ProductId, P.Product_Type, MAX(F.Profit) AS Max_Profit
FROM Fact F
JOIN Product P ON F.ProductId = P.ProductId
GROUP BY F.ProductId, P.Product_Type;


--21.Create a stored procedure to fetch the result according to the product type from the Product Table. 

Select * From Product


CREATE PROCEDURE FetchProductByType(@P_Type varchar(50))
AS
  SELECT *
    FROM Product
    WHERE  @p_Type = Product_Type

---Calling Procudure

Exec FetchProductByType @p_Type = 'Coffee'

Exec FetchProductByType @p_Type = 'Espresso'

Exec FetchProductByType @p_Type = 'Herbal tea'

Exec FetchProductByType @p_Type = 'Tea'


-- 22. Write a query by creating a condition for profit or loss.

select * from fact

SELECT date,total_expenses, productID,CASE WHEN total_expenses < 60 THEN 'Profit' ELSE 'Loss' END AS Result
FROM Fact;

-- 23. Give the total weekly sales value with the date and product ID details. Use roll-up to pull the data in hierarchical order.
---Total_weekly_sales,date,productid (hierarchical order,rollup)
---Date hierarchy (year,quarter,month,week,day)
---rollup(( sub total,main total) can be used only with group by
---(SUM (Sales)--total,sum(Sales) with group by ---> Sub total

select * from fact

SELECT datepart(week,date)as weekly, productID, SUM(sales) AS total_weekly_sales
FROM fact
GROUP BY ROLLUP(date,productID);

---or


SELECT datepart(week,date)as weekly, productID, SUM(sales) AS total_weekly_sales
FROM fact
GROUP BY date, productID
with rollup


-- 24. Apply union and intersection operator on the tables which consist of attribute area code.
      select * from fact
	  select * from location

	  ---union
SELECT Area_code FROM fact 
UNION
SELECT Area_code FROM location 
    ---intersect
SELECT Area_code FROM fact 
UNION
SELECT Area_code FROM location


-- 25. Create a user-defined function for the product table to fetch a particular product type based upon the user’s preference.
  
  select * from product

Create function Product_type (@P_type varchar (25))
returns table
return
    select * from product where Product_type = @p_type

----Calling Function
	
	select * from dbo.product_type('Coffee')

-- 26. Change the product type from coffee to tea where product ID is 1 and undo it.

select * from product

Begin Tran
    update  product set product_type = 'Tea' where productid = 1

	select * from product
rollback

-- 27. Display the date, product ID, and sales where total expenses are between 100 to 200.

select * from Fact

SELECT Date, productID, sales,Total_Expenses
FROM fact
WHERE total_expenses  BETWEEN 100 AND 200  order by Total_Expenses

-- 28. Delete the records in the Product Table for the regular type.

Begin Tran
DELETE FROM Product WHERE type = 'regular';

select * from product

rollback


-- 29. Display the ASCII value of the fifth character from the columnProduct.
--ASCII value for fifth character
--reference (nvarchar,nchar)
---n unicode,different language

create table languages (id  int, lang nvarchar(50))
insert into languages values (0,'हिन्दी')
insert into languages values (1,N'हिन्दी'),(2,N'தமிழ்
'),(3,N'తెలుగు
')

select * from languages


select ASCII('A')

----ASCII value of the fifth character from the columnProduct.
select * from product


SELECT product,SUBSTRING(product, 5, 1) AS Fifth_character_of_product,
ASCII(SUBSTRING(product, 5, 1)) AS ascii_value_of_product
FROM Product;


------*-------
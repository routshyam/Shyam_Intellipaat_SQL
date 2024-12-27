-----My Asssignment 3 (SQL Handson)---

--------Tasks to be performed:
----1. Create a stored procedure to display the restaurant name, type and cuisine where the
--table booking is not zero.
----2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result
--and rollback it.
----3. Generate a row number column and find the top 5 areas with the highest rating of
--restaurants.
----4. Use the while loop to display the 1 to 50.
----5. Write a query to Create a Top rating view to store the generated top 5 highest rating of
--restaurants.
----6. Write a trigger that sends an email notification to the restaurant owner whenever a new
--record is inserted.

Create Database Feb6
Use  Feb6


----AS per Management Instruction imported Dbo.Jomato from Google Drive
--Then

select * From   Jomato

----1. Create a stored procedure to display the restaurant name, type and cuisine where the
--table booking is not zero.
---Also Adding TableBooking Column for Display 

CREATE PROCEDURE DisplayBookedRestaurants
AS
BEGIN
    SELECT RestaurantName, RestaurantType, CuisinesType,TableBooking
    FROM Jomato
    WHERE TableBooking <> 0;
END 

-- Call the stored procedure

Exec  Dbo.DisplayBookedRestaurants

--------2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result
--and rollback it.
----'Cafe' or 'Cafeteria' not belong from Cuisine_type insted of that i am using Restaurant_Type

BEGIN TRANSACTION

UPDATE Jomato
SET RestaurantType = 'Cafeteria'
WHERE RestaurantType = 'Cafe'

-- Check the result
SELECT * FROM Jomato


-- Rollback the transaction
ROLLBACK;

----3. Generate a row number column and find the top 5 areas with the highest rating of
--restaurants.

SELECT Area, Rating,
       Row_number() OVER (ORDER BY Rating DESC) AS Row_Num
FROM Jomato 



----4. Use the while loop to display the Table Value  1 to 50.
----Here i am using order id column as display 1 to 50 Record

DECLARE @counter INT = 1;

-- Use while loop to display numbers from 1 to 50
WHILE @counter <= 50
BEGIN
    SELECT * FROM Jomato WHERE OrderId = @counter
    SET @counter = @counter + 1;
END;

----Reference
---Scalar Value Display 1 to 50

DECLARE @counter INT = 1;

-- Use while loop to display numbers from 1 to 50
WHILE @counter <= 50
BEGIN
    PRINT @counter;
    SET @counter = @counter + 1;
END


---1 to 50 Record Display with the help of Where clause & And Operator 
---Reference 12


Select * from  Jomato where OrderId between 1 And 50

----Reference 2


SELECT Area, Rating,
       Row_number() OVER (ORDER BY Rating DESC) AS Row_Num
FROM Jomato where OrderId  between 1 and 50

----5. Write a query to Create a Top rating view to store the generated top 5 highest rating of
--restaurants.

select * from Jomato

CREATE VIEW TopRatingView 
        As
 select top 5 Restaurantname,rating from jomato order by rating desc ;

----calling View

Select * from  TopRatingView



----6. Write a trigger that sends an email notification to the restaurant owner whenever a new
--record is inserted.



select * from Jomato



CREATE TRIGGER NotifyOnInsert
ON Jomato
AFTER INSERT
AS
BEGIN
   
    -- The example below prints a message to the console
    PRINT 'Email sent to restaurant Owner' 

END;

---Insert New Value to See use of Trigger

---Here i am using Begin Transaction,Rollback & where clause 

--Reference

Begin transaction

insert into Jomato Values ( 1,'BBSR Park','Subway',3.6,85,350,1,0,'Fastfood','Whitefield','Whitefield',58)

------After Insert   check the Record with Where Clause Then Rollback

select *  from Jomato where RestaurantName = 'BBSR Park'

Rollback

-------*--------






--
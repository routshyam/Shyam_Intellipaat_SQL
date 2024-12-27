-----My Asssignment 2 (SQL Handson)


----Tasks to be performed:
---1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick
---Chicken Bites’.
---2. Use the function to display the restaurant name and cuisine type which has the
---maximum number of rating.
---3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
---start rating, ‘Good’ if it has above 3.5 and below 5 star rating, ‘Average’ if it is above 3
---and below 3.5 and ‘Bad’ if it is below 3 star rating.
---4. Find the Ceil, floor and absolute values of the rating column and display the current date
---and separately display the year, month_name and day.
---5. Display the restaurant type and total average cost using rollup.

Create Database Assignment
Use Assignment


------ Sample Restaurants Table
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(255),
    cuisine_type VARCHAR(255),
    rating DECIMAL(3, 2),
    total_cost DECIMAL(8, 2),
    restaurant_type VARCHAR(50)
);

-- Sample Data for the Restaurants Table
INSERT INTO restaurants 
VALUES
(1, 'Restaurant A', 'Chinese', 4.5, 30.00, 'Fine Dining'),
(2, 'Restaurant B', 'Italian Chicken', 3.8, 20.00, 'Quick Bites'),
(3, 'Restaurant C', 'Indian', 4.2, 25.00, 'Casual Dining'),
(4, 'Restaurant D', 'Russian', 3.2, 19.00, 'Buffet'),
(5, 'Restaurant E', 'Mexican', 2.9, 21.00, 'Food Trucks')


select * from restaurants



---1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick
---Chicken Bites’.
---------Displaying value ' Quick Chicken Bites' use of Scalar valued & Table Valued .

----- Used Scalar_valued function to  Display ' Quick Chicken Bites '

CREATE FUNCTION dbo.StuffChickenIntoQuickBites()
RETURNS VARCHAR(255)
AS
BEGIN
DECLARE @Val VARCHAR (255)
    SET @Val = 'Quick Chicken Bites '

RETURN @Val

END

-----Calling function

SELECT  dbo.StuffChickenIntoQuickBites() AS RESULT

----- Used Table_valued function to  Display ' Quick Chicken Bites '

select * from restaurants


CREATE FUNCTION Quick_Bites( @Val varchar(255))
RETURNS TABLE
AS
RETURN SELECT CONCAT(SUBSTRING(restaurant_type,1,5),SUBSTRING(cuisine_type,8,8),SUBSTRING(restaurant_type,6,6)) AS Result from restaurants
Where restaurant_id = 2

----calling  function

select * from dbo.Quick_Bites(0)

----References

CREATE FUNCTION Quick_Bite()
RETURNS varchar(255)
AS
BEGIN
DECLARE  @VAL varchar (255)
SET @VAL =( SELECT CONCAT(SUBSTRING(restaurant_type,1,5),SUBSTRING(cuisine_type,8,8),SUBSTRING(restaurant_type,6,6)) AS Result from restaurants
Where restaurant_id = 2)
RETURN @VAL
END
----calling function

SELECT  Dbo.Quick_Bite() AS Result



---2. Use the function to display the restaurant name and cuisine type which has the
---maximum number of rating.

select * from restaurants

select Restaurant_name,cuisine_type,rating As Max_rating from restaurants where Rating = (select max(rating) from restaurants)

---3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
---start rating, ‘Good’ if it has above 3.5 and below 5 star rating, ‘Average’ if it is above 3
---and below 3.5 and ‘Bad’ if it is below 3 star rating.
select *,
  Case
        WHEN rating > 4 THEN 'Excellent'
        WHEN rating > 3.5 AND rating <= 5 THEN 'Good'
        WHEN rating > 3 AND rating <= 3.5 THEN 'Average'
        ELSE 'Bad'
    END As Rating_status
	From restaurants



---4. Find the Ceil, floor and absolute values of the rating column and display the current date
---and separately display the year, month_name and day.

select * from restaurants

SELECT
    restaurant_name,
    rating,
    CEILING(rating) AS ceil_rating,
    FLOOR(rating) AS floor_rating,
    ABS(rating) AS absolute_rating,
    GETDATE() AS currentdate,
    YEAR(GETDATE()) AS current_year,
    DATENAME(MONTH, GETDATE()) AS current_month,
    DAY(GETDATE()) AS current_day
FROM restaurants;



---5. Display the restaurant type and total average cost using rollup.

SELECT restaurant_type, AVG(total_cost) AS avg_cost
FROM restaurants
GROUP BY restaurant_type WITH ROLLUP;


------**---
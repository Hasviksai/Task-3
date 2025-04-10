create database superstore_db;
use superstore_db;
select * from Superstore;
select * from Superstore where State = "Kentucky";
select * FROM Superstore ORDER BY Sales DESC;
select avg (Discount) from Superstore;
select sum(Sales) from Superstore;
Select count(Quantity) from Superstore;

select State, sum(Sales) from Superstore group by State; 

select * from Superstore where Sales >  (select avg(Sales) from Superstore );

create table Shipmode_price (
    ShipMode_ID INT PRIMARY KEY,
    Ship_Mode VARCHAR(50),
    Price_Category VARCHAR(50)
);
insert into Shipmode_price (ShipMode_ID, Ship_Mode, Price_Category)
 values
(1, 'Same Day', 'Special Price'),
(2, 'First Class', 'High Price'),
(3, 'Second Class', 'Medium Price'),
(4, 'Standard Class', 'Low Price');

Select * from ShipMode_price;


SELECT Superstore.`Order ID`,Superstore.`Customer Name` ,Superstore.`Ship Mode` ,shipmode_price.Price_Category
FROM Superstore
INNER JOIN shipmode_price
ON Superstore.`Ship Mode` = shipmode_price.Ship_Mode;

SELECT Superstore.`Order ID`,Superstore.`Customer Name` ,Superstore.`Ship Mode` ,shipmode_price.Price_Category
FROM Superstore
right JOIN shipmode_price
ON Superstore.`Ship Mode` = shipmode_price.Ship_Mode;

SELECT Superstore.`Order ID`,Superstore.`Customer Name` ,Superstore.`Ship Mode` ,shipmode_price.Price_Category
FROM Superstore
left JOIN shipmode_price
ON Superstore.`Ship Mode` = shipmode_price.Ship_Mode;

SELECT shipmode_price.Price_Category, count(*) as no_of_orders
FROM Superstore
INNER JOIN shipmode_price
ON Superstore.`Ship Mode` = shipmode_price.Ship_Mode
group by Price_Category;

 create view shipmode_sales_summary as
 select `Ship Mode` ,sum(Sales) as Total_Sales from Superstore group by `Ship Mode`;
 
 select * from shipmode_sales_summary;
 
 create index indx_shipmode on Superstore (`Ship Mode`(20));

		
 
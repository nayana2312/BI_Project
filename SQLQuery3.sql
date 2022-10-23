select * from [dbo].[StageListOfOrder]

----------------------------------------------
select distinct 
Region, Country, State, City
into DimDemography
from [dbo].[StageListOfOrder]

select * from [dbo].[DimDemography]
where city in ('Halle','Langen')

alter table DimDemography
add DemographyID int Identity

------------------------------------------------------

select distinct Customer_Name
into DimCustomer
from [dbo].[StageListOfOrder]


alter table DimCustomer
add CustomerID int Identity

select * from [dbo].[DimCustomer] 
----------------------------------------------------


select distinct Category, [Sub_Category]
into DimCategory
from [dbo].[StageOrderBreakdown]

alter table DimCategory
add CategoryID int identity

select * from [dbo].[DimCategory] 
-------------------------------------------

select distinct [Ship_Mode] 
into DimShipment 
from [dbo].[StageListOfOrder]

alter table DimShipment
add ShipmentID int identity

select * from [dbo].[DimShipment] 
---------------------------------------
select distinct [Product_Name] 
into DimProduct 
from [dbo].[StageOrderBreakdown]

alter table DimProduct
add ProductID int identity

select * from [dbo].[DimProduct] 
------------------------------------------

select distinct [Segment] 
into DimSegment 
from [dbo].[StageListOfOrder]

alter table DimSegment
add SegmentID int identity

select * from [dbo].[DimSegment] 
------------------------------------------------

select distinct Order_Date as Date
, year(Order_Date) as Year
, MONTH (Order_Date) as MonthNum
,DATENAME(month,Order_Date) 'MonthName'
, concat(left(DATENAME(month,Order_Date),3), year(Order_Date)) as MonthYear
,datepart(week, Order_Date) as WeekNum
, DATENAME(WEEKDAY, Order_Date) as WeekDay
into DimDate
from [dbo].[StageListOfOrder]
order by 1 asc


-----------------------------------------

select 
A.[Order_ID],
--D.Date,
--C.CustomerID,
--De.DemographyID,
--S.SegmentID,
--Sh.ShipmentID,
--P.ProductID,
--Ca.CategoryID,
[Discount],
[Sales],
[Profit],
[Quantity]
FROM [dbo].[StageListOfOrder] A INNER JOIN [dbo].[StageOrderBreakdown] B ON A.[Order_ID] = B.[Order_ID]
--inner join DimDate D on A.[Order_Date] = D.Date
--inner join DimCustomer C on A.Customer_Name = C.Customer_Name
--inner join DimDemography De on A.[City] = De.City
--inner join DimSegment S on A.[Segment] = S.Segment
--inner join DimShipment Sh on A.[Ship_Mode] = Sh.Ship_Mode
--inner join DimProduct P on B.Product_Name = P.Product_Name
--inner join DimCategory Ca on B.Category = Ca.Category
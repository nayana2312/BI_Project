select 
Q.[Order_ID],
D.Date,
C.CustomerID,
De.DemographyID,
S.SegmentID,
Sh.ShipmentID,
P.ProductID,
Ca.CategoryID,
[Discount],
[Sales],
[Profit],
[Quantity]
into FactOrders
FROM 
(select A.*,
[Product_Name],[Discount],[Sales],[Profit],[Quantity],[Category],[Sub_Category]
from [dbo].[StageListOfOrder] A INNER JOIN [dbo].[StageOrderBreakdown] B ON A.[Order_ID] = B.[Order_ID]) Q
inner join DimDate D on Q.[Order_Date] = D.Date
inner join DimCustomer C on Q.Customer_Name = C.Customer_Name
inner join DimDemography De on Q.[City] = De.City
inner join DimSegment S on Q.[Segment] = S.Segment
inner join DimShipment Sh on Q.[Ship_Mode] = Sh.Ship_Mode
inner join DimProduct P on Q.Product_Name = P.Product_Name
inner join DimCategory Ca on Q.Sub_Category = Ca.Sub_Category




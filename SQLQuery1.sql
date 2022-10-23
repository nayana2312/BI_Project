SELECT TOP 100 * FROM [dbo].[StageListOfOrder];

SELECT TOP 100 * FROM[dbo].[StageOrderBreakdown];

SELECT TOP 100 * FROM[dbo].[StageOrderBreakdown] WHERE [Order ID]='BN-2011-7407039';

SELECT [Customer Name], COUNT([Order ID]) 
FROM [dbo].[StageListOfOrder] 
GROUP BY [Customer Name] 
HAVING COUNT([Order ID])>2 
ORDER BY 2 DESC;


SELECT [Customer Name],A.[Order ID],[Product Name], 
SUM([Sales]) AS SALES, sum(Profit) as Profit
FROM [dbo].[StageListOfOrder] A
INNER JOIN [dbo].[StageOrderBreakdown] B ON A.[Order ID] = B.[Order ID]
GROUP BY [Customer Name],A.[Order ID],[Product Name]
ORDER BY 5 desc,4 desc


select * from
(
select Region, [Country], sum([Sales]) sales
, rank () over (partition by Region order by sum(sales) desc) As CountryRank
FROM [dbo].[StageListOfOrder] A
INNER JOIN [dbo].[StageOrderBreakdown] B ON A.[Order ID] = B.[Order ID]
group by region, Country 
) Q
where CountryRank = 2
order by 1,4 asc


------------------------

select [Product Name], sum([Quantity]) from [dbo].[StageOrderBreakdown]
group by [Product Name]
order by 2 desc

drop table [dbo].[StageListOfOrder]

----------------------------------







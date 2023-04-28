select  * from [Sales].[SalesOrderHeader]
select sh.SalesOrderId , sum(TaxAmt)
from [Sales].[SalesOrderHeader] as sh 
group by sh.SalesOrderId
order by sh.SalesOrderId
--------------------------------------
select *  from [Sales].[SalesOrderDetail]
-------------------------------------- 
select sh.SalesOrderId ,avg(taxamt) 
from [Sales].[SalesOrderHeader] as sh , [Sales].[SalesOrderDetail] as so
where sh.SalesOrderId = so.SalesOrderId
group by  sh.SalesOrderId
order by sh.SalesOrderId
--------------------------------------
create view  [dbo].[measures] 
as
select  s.SalesOrderID,min(TotalDue) as TotalDue,
min(SubTotal)as SubTotal , min(Freight) as Freight,min(TaxAmt ) as TaxAmt
from [Sales].[SalesOrderHeader] s ,[Sales].[SalesOrderDetail] s2
where s.SalesOrderID =s2.SalesOrderID
group by s.SalesOrderID
GO

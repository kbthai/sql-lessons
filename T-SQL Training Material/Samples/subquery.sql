--alt sorgular

--�rn 1 
select p1.ProductName, sum(p1.UnitPrice) toplam from Products p1 
where p1.CategoryID in (
select c1.CategoryID from Categories c1 where c1.CategoryName ='Beverages'
)
group by p1.ProductName


--�rn 2
select urun_birim_top.ProductName from (
select p1.ProductName, sum(p1.UnitPrice) toplam from Products p1 
where p1.CategoryID in (
select c1.CategoryID from Categories c1 where c1.CategoryName ='Beverages'
)
group by p1.ProductName) as urun_birim_top


--�rn3
select p2.ProductID from Products P2 where ProductName in (
select urun_birim_top.ProductName from (
select p1.ProductName, sum(p1.UnitPrice) toplam from Products p1 
where p1.CategoryID in (
select c1.CategoryID from Categories c1 where c1.CategoryName ='Beverages'
)
group by p1.ProductName) as urun_birim_top)

--4
select o1.ProductID, xx.CategoryID,
count(*)
 from [Order Details] o1 inner join 
(
select * from (
select p2.ProductID, p2.CategoryID from Products P2 where ProductName in (
select urun_birim_top.ProductName from (
select p1.ProductName, sum(p1.UnitPrice) toplam from Products p1 
where p1.CategoryID in (
select c1.CategoryID from Categories c1 where c1.CategoryName ='Beverages'
)
group by p1.ProductName) as urun_birim_top)) cat_product) xx
on xx.ProductID = o1.ProductID
group by o1.ProductID, xx.CategoryID


--sipari�i 100 den b�y�k olan �r�nler
SELECT ProductName
  FROM Products s
 WHERE ProductID IN (SELECT ProductID 
                FROM [Order Details]
               WHERE Quantity > 100)

--
SELECT c.ContactName, 
TOPLAM_SIP = (SELECT COUNT(O.OrderID) FROM Orders O WHERE O.CustomerId = C.CustomerID),
C.ContactTitle
  FROM Customers C 

--subquery ile T tablosu yap�ld�.
SELECT T.ORDERID, T.CUSTOMERID 
FROM (
SELECT ORDERID, CUSTOMERID FROM orders) AS T



SELECT ProductName AS '�R�N ADI',
UnitPrice AS 'B�R�M F�YATI', 
UnitsInStock AS 'STOK',
(SELECT AVG(UnitPrice) FROM Products) AS ORTALAMA,
UnitPrice-(SELECT AVG(UnitPrice) FROM Products) AS FARK 

FROM Products  



SELECT OrderID, CustomerID 
FROM orders AS or1
WHERE 30<(SELECT quantity FROM [order details] AS od
WHERE or1.OrderID=od.OrderID AND od.ProductID=30)
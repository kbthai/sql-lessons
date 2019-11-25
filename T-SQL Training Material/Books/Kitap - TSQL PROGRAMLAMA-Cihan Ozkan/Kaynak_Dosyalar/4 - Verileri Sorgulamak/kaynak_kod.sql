

--	Aritmetik Operat�rleri


SELECT 5 + 3;


SELECT ((5 + 3) * 6) * 2;	-- Bu i�lem sonucu 96 olacakt�r.


--	Atama Operat�r�


DECLARE @Degisken VARCHAR(10);				
SET @Degisken = 7;
PRINT @Degisken;


--	Metin Birle�tirme Operat�r�


SELECT 'DIJIBIL.com' + ' & ' + 'KodLab.com';


--	SELECT ile Kay�tlar� Se�mek


SELECT * FROM Production.Product;


SELECT ProductID, Name FROM Production.Product;


SELECT 						
	Production.Product.Name, 
	Production.Product.* 
FROM 
	Production.Product;



--	DISTINCT ile Tekile �ndirgemek


SELECT DISTINCT FirstName FROM Person.Person;


--	UNION ve UNION ALL �le Sorgu Sonu�lar�n� Birle�tirmek


SELECT BusinessEntityID, ModifiedDate, SalesQuota
	FROM Sales.SalesPerson
	WHERE SalesQuota > 0
UNION
SELECT BusinessEntityID, QuotaDate, SalesQuota
	FROM Sales.SalesPersonQuotaHistory
	WHERE SalesQuota > 0
	ORDER BY BusinessEntityID DESC, ModifiedDate DESC;



--	Mant�ksal Operat�rler


--	AND


SELECT ProductID, Name FROM Production.Product 		
WHERE ProductID = 2 AND Name = 'Bearing Ball';



WHERE ProductID = 2 AND Name = 'Bearing Ball' AND ProductNumber = 'BA-8327'


--	OR


SELECT ProductID, Name FROM Production.Product 	
WHERE Name = 'Blade' OR Name = 'Bearing Ball';


WHERE Name = 'Blade' OR Name = 'Bearing Ball' OR Name = 'Chain'


SELECT 
	ProductID, Name, ProductNumber 
FROM 
	Production.Product
WHERE 
	ProductID < 0 OR 1=1;


--	Kar��la�t�rma Operat�rleri


SELECT ProductID, Name FROM Production.Product WHERE ProductID < 5;


SELECT ProductID, Name FROM Production.Product WHERE ProductID = 4;


SELECT ProductID, Name FROM Production.Product WHERE ProductID <= 316;


SELECT ProductID, Name FROM Production.Product WHERE ProductID <> 316;


--	LIKE

--	Joker Karakterler


SELECT ProductID, Name FROM Production.Product WHERE Name LIKE '%ad%'


SELECT 
	ProductID, Name, ProductNumber 
FROM 
	Production.Product
WHERE
	Name LIKE 'C%';


SELECT 
	ProductID, Name, ProductNumber 
FROM 
	Production.Product
WHERE
	Name LIKE 'Be%';


SELECT 
	ProductID, Name, ProductNumber 
FROM 
	Production.Product
WHERE
	Name LIKE '%karm';


SELECT 
	ProductID, Name, ProductNumber 
FROM 
	Production.Product
WHERE
	Name LIKE '%hai%';


SELECT 
	ProductID, Name, ProductNumber 
FROM 
	Production.Product
WHERE
	Name LIKE '_eflector';


SELECT 
	ProductID, Name, ProductNumber 
FROM 
	Production.Product
WHERE
	Name LIKE '__flector';


SELECT 
	ProductID, Name, ProductNumber 
FROM 
	Production.Product
WHERE
	Name LIKE '[AC]%';



SELECT 
	ProductID, Name, ProductNumber 
FROM 
	Production.Product
WHERE
	Name LIKE '[A-C]lade';



SELECT 
	ProductID, Name, ProductNumber 
FROM 
	Production.Product
WHERE
	Name LIKE 'A[^c]%';



SELECT 
	ProductID, Name, ProductNumber 
FROM 
	Production.Product
WHERE
	Name LIKE 'A%' OR 
	Name LIKE 'B%' OR 
	Name LIKE 'C%';



SELECT 
	ProductID, Name, ProductNumber 
	FROM 
	Production.Product
	WHERE
	Name LIKE '%[%]%';



SELECT 
	ProductID, Name, ProductNumber 
	FROM 
	Production.Product
	WHERE
	Name LIKE '%/%';



SELECT 
	ProductID, Name, ProductNumber 
	FROM 
	Production.Product
	WHERE
	Name NOT LIKE 'Be%';


--	BETWEEN .. AND ..


SELECT ProductID, Name FROM Production.Product WHERE ProductID BETWEEN 1 AND 4;


SELECT 
	ProductID, Name 
FROM 
	Production.Product
WHERE 
	ProductID BETWEEN 320 AND 400;



SELECT 
	ProductID, Name 
FROM 
	Production.Product
WHERE 
	ProductID >= 320 AND ProductID <= 400;


ProductID NOT BETWEEN 320 AND 400;



--	IN ve NOT IN


SELECT 
	ProductID, Name
FROM 
	Production.Product
WHERE 
	ProductID IN(1, 2, 3, 316);


SELECT 
	ProductID, Name
FROM 
	Production.Product
WHERE 
	ProductID = 1 OR 
	ProductID = 2;


SELECT 
	ProductID, Name
FROM 
	Production.Product
WHERE 
	Name IN('Chain', 'Chainring');



SELECT 
	ProductID, Name
FROM 
	Production.Product
WHERE 
	ProductID NOT IN(1, 2, 3, 316);



SELECT 
	ProductID, Name
FROM 
	Production.Product
WHERE 
	'Chainring' IN(Color, Name);



SELECT 
	ProductID, Name
FROM 
	Production.Product
WHERE 
	'2008-03-11 10:01:36.827' IN(SellStartDate, ModifiedDate);



--	SQL Server'da NULL ve Bo�luk Kavram�


SELECT 'Cihan' + NULL + '�zhan';


SET CONCAT_NULL_YIELDS_NULL OFF;


SELECT 'Cihan' + NULL + '�zhan';


SET CONCAT_NULL_YIELDS_NULL ON;


--	SPACE Fonksiyonu


SELECT 'Cihan' + SPACE(1) + '�zhan';


SELECT 1 + SPACE(1) + 4;


SELECT 'DIJIBIL' + SPACE(5) + 2013;		-- Hata


--	IS NULL Operat�r�


SELECT 
	ProductID, Name, Size 
FROM 
	Production.Product
WHERE 
	Size IS NULL;


--	ISNULL Fonksiyonu


SELECT 
	ProductID, Name, Color, 
	ISNULL(Color, 'Renk Yok') AS Renk
FROM 
	Production.Product;



SELECT 						
	Weight,
	ISNULL(Weight, 10)
FROM 
	Production.Product;



SELECT 					
	Weight,
	AVG(ISNULL(Weight, 10))
FROM 
	Production.Product
GROUP BY Weight;



SELECT 					
	Description, DiscountPct, MinQty, 
	ISNULL(MaxQty, 0.00) AS 'Max Miktar'
FROM 
	Sales.SpecialOffer;


--	COALESCE Fonksiyonu


SELECT 						
	ProductID, Name, 
	COALESCE(Color,'Renk Yok') AS Renk
FROM 
	Production.Product;



SELECT 								
	COALESCE(Title,'Kay�t Yok'), 
	FirstName, 
	COALESCE(MiddleName,'Kay�t Yok'),
	LastName 
FROM 
	Person.Person;



SELECT 						
	Name, Class, Color, ProductNumber,
	COALESCE(Class, 
		   Color, 
		   ProductNumber) AS FirstNotNull
FROM 	Production.Product; 



SELECT 							
	Name, Class, Color, ProductNumber,
	COALESCE('Class : ' + Class, 
		   'Color : ' + Color, 
		   'ProductNumber : ' + ProductNumber) AS FirstNotNull
FROM 	Production.Product; 


--	NULLIF Fonksiyonu


SELECT 
	MakeFlag, FinishedGoodsFlag, 
    	NULLIF(MakeFlag, FinishedGoodsFlag) AS 'E�itse Null'
FROM 
	Production.Product
WHERE 
	ProductID < 10;


--	SELECT ile Verileri S�ralamak


SELECT 							
	ProductID, Name 
FROM 
	Production.Product
ORDER BY Name;



SELECT 							
	ProductID, Name 
FROM 
	Production.Product
ORDER BY 
	ProductID ASC;



SELECT 					
	ProductID, Name 
FROM 
	Production.Product
ORDER BY 
	ProductID DESC;



SELECT 							
	ReorderPoint, Name, 
	ProductID
FROM 
	Production.Product
ORDER BY 
	ReorderPoint, Name ASC;



SELECT							
	ReorderPoint, Name, 
	ProductID
FROM 
	Production.Product
ORDER BY 
	3 ASC;



SELECT 							
	ProductID, Name 
FROM 
	Production.Product
ORDER BY 
	NEWID();



--	TOP Operat�r�


SELECT TOP 5 * FROM Production.Product;


SELECT TOP 1 PERCENT * FROM Production.Product;


SELECT TOP 5 * FROM Production.Product WHERE Name LIKE 'C%';


--	TOP Fonksiyonu


SELECT 
	TOP(5) WITH TIES * 
FROM 
	Production.Product
ORDER BY 
	ProductID;



SELECT 
	TOP(5) PERCENT WITH TIES * 
FROM 
	Production.Product
ORDER BY 
	ProductID;


--	Tablolar� Birle�tirmek


--	Klasik JOIN


SELECT SOD.ProductID, P.Name 
FROM Sales.SalesOrderDetail AS SOD, Production.Product AS P
WHERE SOD.ProductID = P.ProductID;



SELECT * FROM Sales.SalesOrderDetail
SELECT * FROM Production.Product


--	SQL Server'da JOIN Mimarisi


--	OPTION (MERGE JOIN)


SELECT S.CountryRegionCode, S.StateProvinceCode, 
	   T.TaxType, T.TaxRate
FROM Person.StateProvince AS S
LEFT OUTER JOIN Sales.SalesTaxRate AS T
ON S.StateProvinceID = T.StateProvinceID
OPTION (MERGE JOIN)


--	INNER JOIN


SELECT P.FirstName, P.LastName, P.PersonType, PP.PhoneNumber 
FROM Person.Person AS P
INNER JOIN Person.PersonPhone AS PP
ON P.BusinessEntityID = PP.BusinessEntityID;



--	OUTER JOIN


--	LEFT OUTER JOIN


SELECT S.CountryRegionCode, S.StateProvinceCode, 
	 T.TaxType, T.TaxRate
FROM Person.StateProvince AS S
LEFT OUTER JOIN Sales.SalesTaxRate AS T
ON S.StateProvinceID = T.StateProvinceID;



SELECT S.CountryRegionCode, S.StateProvinceCode, 
	 T.TaxType, T.TaxRate
FROM Person.StateProvince AS S
INNER JOIN Sales.SalesTaxRate AS T
ON S.StateProvinceID = T.StateProvinceID;


--	RIGHT OUTER JOIN


SELECT S.CountryRegionCode, S.StateProvinceCode, 
	 T.TaxType, T.TaxRate
FROM Person.StateProvince AS S
RIGHT OUTER JOIN Sales.SalesTaxRate AS T
ON S.StateProvinceID = T.StateProvinceID;


--	FULL OUTER JOIN


SELECT S.CountryRegionCode, S.StateProvinceCode, 
	 T.TaxType, T.TaxRate
FROM Person.StateProvince AS S
FULL OUTER JOIN Sales.SalesTaxRate AS T
ON S.StateProvinceID = T.StateProvinceID;


--	CROSS JOIN


SELECT p.BusinessEntityID, t.Name AS Territory
FROM Sales.SalesPerson p
CROSS JOIN Sales.SalesTerritory t
ORDER BY p.BusinessEntityID;


SELECT COUNT(BusinessEntityID) FROM Sales.SalesPerson;


SELECT COUNT(TerritoryID) FROM Sales.SalesTerritory;



















































--	�ndeksler Hakk�nda Bilgi Edinmek


EXEC sp_helpindex 'Production.Product';


SELECT * FROM sys.indexes;


--	�ndex Olu�turmak


CREATE CLUSTERED INDEX CL_PersonelID
ON Personeller(PersonelID);


CREATE INDEX NC_PersonelID
ON Personeller(PersonelID);


CREATE INDEX NC_PersonelID
ON Personeller(PersonelID ASC);


--	Unique �ndeks Olu�turmak


CREATE UNIQUE NONCLUSTERED INDEX UI_Email
ON dbo.Personeller(Email) 
ON [PRIMARY];


--	Kapsam(Covering) �ndeks Olu�turmak


SELECT Name, ProductNumber, ListPrice FROM Production.Product;


CREATE INDEX CV_Product
ON Production.Product(Name, ProductNumber, ListPrice);



--	Eklenti S�tunlu �ndeks Olu�turmak


CREATE INDEX CV_SalesDetail
ON Sales.SalesOrderDetail(SalesOrderID)
INCLUDE(OrderQty, ProductID, UnitPrice)


--	Filtreli �ndeks Olu�turmak


SELECT ProductID, Name, Color FROM Production.Product 
WHERE Color IS NOT NULL


CREATE INDEX FI_Product
ON Production.Product(ProductID, Name)
WHERE Color IS NOT NULL;


--	�ndeks Y�netimi

--	REBUILD : �ndeksleri Yeniden Derlemek


ALTER INDEX ALL ON Production.Product
REBUILD WITH(FILLFACTOR = 90)


REBUILD WITH(FILLFACTOR = 90, SORT_IN_TEMPDB = ON)


--	REORGANIZE : �ndeksleri Yeniden D�zenlemek


ALTER INDEX UI_Email
ON dbo.Personeller
REORGANIZE WITH (LOB_COMPACTION = ON);


--	�ndeksleri Kapatmak


ALTER INDEX CL_PersonelID		
ON Personeller
DISABLE


SELECT * FROM Personeller;


ALTER INDEX FI_Product		
ON Production.Product
DISABLE


SELECT * FROM Production.Product;


ALTER INDEX CL_PersonelID
ON dbo.Personeller
REBUILD

ALTER INDEX FI_Product
ON Production.Product
REBUILD



--	�ndeks Se�eneklerini De�i�tirmek


SELECT Object_ID, Name, Index_ID, Type, type_desc, Allow_Row_Locks FROM sys.indexes WHERE Name = 'FI_Product';


ALTER INDEX FI_Product
ON Production.Product
SET(ALLOW_ROW_LOCKS = ON);


--	�statistikler

--	�statistik Olu�turmak


CREATE STATISTICS Statistic_ProductID
ON Production.Product(ProductID);


--	�statistikleri Silmek


DROP STATISTICS Production.Product.Statistic_ProductID;



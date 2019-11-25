

--	Extended Stored Procedure'ler


EXEC sp_configure 'show advanced options',1
GO
RECONFIGURE
GO
EXEC sp_configure 'xp_cmdshell',1
GO
RECONFIGURE
GO


master.dbo.xp_cmdshell 'dir';


EXEC master.dbo.xp_cmdshell 'dir C:\sql_files\*.sql';


EXEC master.dbo.xp_cmdshell 'copy D:\copy1.txt D:\copy2.txt';


--	Stored Procedure Olu�turmak


USE AdventureWorks
GO
CREATE PROC pr_UrunleriGetir
AS
SELECT ProductID, Name, ProductNumber, ListPrice FROM Production.Product;



BEGIN
	SELECT ProductID, Name, 
	ProductNumber, ListPrice 
	FROM 	Production.Product;
END;



sp_helptext 'pr_UrunleriGetir';	



--	NOCOUNT Oturum Parametresinin Kullan�m�


CREATE PROC sp_procName
AS
	SET NOCOUNT ON
	-- Stored Procedure'de i�lemi ger�ekle�tirecek sorgu.
GO



SET NOCOUNT ON
SELECT * FROM Production.Product;


SET NOCOUNT OFF



--	Stored Procedure'lerde De�i�iklik Yapmak


sp_helptext 'pr_UrunleriGetir';



ALTER PROC pr_UrunleriGetir
AS
SET NOCOUNT ON
	SELECT ProductID, Name, 
	ProductNumber, ListPrice 
	FROM 	Production.Product;
SET NOCOUNT OFF



--	Stored Procedure'leri Yeniden Derlemek


ALTER PROC pr_UrunleriGetir
WITH RECOMPILE
AS
SET NOCOUNT ON
	SELECT ProductID, Name, 
	ProductNumber, ListPrice 
	FROM 	Production.Product;
SET NOCOUNT OFF
GO


--	Stored Procedure'ler ��in �zinleri Y�netmek



DENY ON prosedur_ismi TO public


--	Girdi Parametreler(Input Parameters)


CREATE PROCEDURE pr_UrunAra(@ProductNumber NVARCHAR(25))
AS
SET NOCOUNT ON
IF @ProductNumber IS NOT NULL
	SELECT 
		ProductID, ProductNumber, 
		Name, ListPrice 
	FROM 
		Production.Product 
	WHERE 
		ProductNumber = @ProductNumber;
SET NOCOUNT OFF


--	Girdi Parametreler �le Stored Procedure �a��rmak


EXEC pr_UrunAra @ProductNumber = 'SA-T872';


EXEC pr_UrunAra 'SA-T872';


--	Tablo Tipi Parametre Alan Stored Procedure'ler



CREATE TYPE dbo.ProductType AS TABLE
(
	ProductCategoryID INT,
	Name	VARCHAR(40)
);



CREATE PROCEDURE pr_AllCateogries
(
	@productCategory AS dbo.ProductType READONLY
)
AS
BEGIN
SET NOCOUNT ON
	SELECT 
	PC.Name AS Category, 
	PS.Name AS SubCategory
	FROM Production.ProductSubcategory AS PS
	JOIN @productCategory AS PC ON 
	PC.ProductCategoryID = PS.ProductCategoryID;
SET NOCOUNT OFF
END;



DECLARE @category AS dbo.ProductType;
INSERT INTO @category (ProductCategoryID, Name)
SELECT TOP(4) ProductCategoryID, Name FROM Production.ProductCategory;
EXEC pr_AllCateogries @category;


--	��k�� Parametrelerle �al��mak(Output Parameters)



CREATE PROC pr_HesapMakinesi
(
	@sayi1 INT, 
	@sayi2 INT,
	@islem SMALLINT,
	@sonuc INT	OUTPUT
)
AS
SET NOCOUNT ON
IF @islem IS NOT NULL
	IF(@islem = 0)
		SELECT @sonuc = (@sayi1 + @sayi2);
	ELSE IF(@islem = 1)
		SELECT @sonuc = (@sayi1 - @sayi2);
	ELSE IF(@islem = 2)
		SELECT @sonuc = (@sayi1 * @sayi2);
	ELSE IF(@islem = 3)
		SELECT @sonuc = (@sayi1 / @sayi2);
	ELSE
		SELECT @sonuc = (0);
SET NOCOUNT OFF



--	��k�� Parametrelerini Almak


-- ��k�� parametresinden al�nan de�erin tutulaca�� de�i�ken.
DECLARE @sonuc INT;

-- Prosed�r� �al��t�rmak i�in g�nderilen parametreler.
EXEC pr_HesapMakinesi 7,6,2,@sonuc OUT;

-- ��k�� parametresinden al�nan de�erin g�sterilmesi.
SELECT @sonuc;



DECLARE @sonucOut INT;
EXEC pr_HesapMakinesi @sayi1=7, @sayi2=6, @islem = 2, @sonuc = @sonucOut OUT;
SELECT '�arp�m', @sonucOut;
GO


--	RETURN Deyimi


ALTER PROC pr_HesapMakinesi
(
	@sayi1 INT, 
	@sayi2 INT,
	@islem SMALLINT,
	@sonuc INT	OUTPUT
)
AS
SET NOCOUNT ON
IF @islem IS NOT NULL
	IF(@islem = 0)
		SELECT @sonuc = (@sayi1 + @sayi2);
	ELSE IF(@islem = 1)
		SELECT @sonuc = (@sayi1 - @sayi2);
	ELSE IF(@islem = 2)
		SELECT @sonuc = (@sayi1 * @sayi2);
	ELSE IF(@islem = 3)
		SELECT @sonuc = (@sayi1 / @sayi2);
	ELSE
		SELECT @sonuc = (0);
	RETURN(@sayi1 + @sayi2);		-- Eklenen RETURN deyimi
SET NOCOUNT OFF

A�a��daki �ekilde �a��rabiliriz.
DECLARE @sonucOut INT, 
	  @toplam INT;
EXEC @toplam = pr_HesapMakinesi @sayi1=7, 
					   @sayi2=6, 
					   @islem = 2, 
					   @sonuc = @sonucOut OUT;
SELECT '�arp�m', @sonucOut, 
	 'Return ile Toplam : ', @toplam;



--	EXECUTE AS CALLER



CREATE PROC pr_UrunGetir
(
	@ProductID	INT
)
WITH EXECUTE AS CALLER
AS
SELECT 
	ProductID, Name, ProductNumber 
FROM 
	Production.Product 
WHERE 
	ProductID = @ProductID;



WITH EXECUTE AS CALLER


--	EXECUTE AS 'kullan�c�'


CREATE PROC pr_UrunGetir
(
	@ProductID	INT
)
WITH EXECUTE AS kullanici_ismi
AS
SELECT 
	ProductID, Name, ProductNumber 
FROM 
	Production.Product 
WHERE 
	ProductID = @ProductID;


--	WITH RESULT SETS ile Stored Procedure �a��rmak


CREATE PROC pr_UrunGetir
(
	@ProductID	INT
)
AS
SELECT ProductID, Name, ProductNumber 
FROM Production.Product 
WHERE ProductID = @ProductID;

WITH RESULT SETS ile prosed�r� �a��ral�m.

EXEC pr_UrunGetir 4		
WITH RESULT SETS(
	(
		KOD	VARCHAR(20),
		[�r�n Ad�] VARCHAR(20),
		[�r�n Numaras�] VARCHAR(7)
	)
);



--	Stored Procedure'lerin �ifrelenmesi



sp_helptext 'pr_UrunGetir';



ALTER PROC pr_UrunGetir
(
	@ProductID	INT
)
WITH ENCRYPTION
AS
SELECT ProductID, Name, ProductNumber 
FROM Production.Product 
WHERE ProductID = @ProductID;



sp_helptext 'pr_UrunGetir';



--	Stored Procedure'ler Hakk�nda Bilgi Almak



SELECT 
	Name, Type, Type_Desc, 
	Create_Date, Modify_Date 
FROM 
	Sys.Procedures;



SELECT 
	Name, Type, Type_Desc, 
	Create_Date, Modify_Date 
FROM 
	Sys.Procedures
WHERE
	Name LIKE 'pr_%';




SELECT * FROM Sys.Sql_Modules;




SELECT  Definition, O.Object_ID, Create_Date,
	  OBJECT_NAME(O.Object_ID) Prosedur_Ismi
	  FROM Sys.Sql_Modules M
	  INNER JOIN Sys.Objects O ON
	  M.Object_ID = O.Object_ID
	  WHERE O.type = 'P';



























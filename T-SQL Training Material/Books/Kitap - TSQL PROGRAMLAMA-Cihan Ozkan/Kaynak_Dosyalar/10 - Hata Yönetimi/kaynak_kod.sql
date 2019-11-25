

--	Hata Mesajlar�


INSERT INTO Production.Product(Name, ProductNumber)
VALUES('Test �r�n','AR-5388');


SELECT * FROM sys.messages;


SELECT * FROM sys.messages WHERE message_id = 515;


SELECT * FROM sys.messages WHERE message_id = 515 AND language_id = 1033;


SELECT * FROM sys.messages WHERE message_id = 515 AND language_id = 1055;


--	Mesajlar� G�r�nt�lemek


SELECT * FROM sys.messages;


SELECT * FROM SYS.Messages ORDER BY Message_ID DESC;


sp_addmessage @msgnum = 'mesaj_kod',
	        @severity = 'seviye',
	        @msgtext = 'mesaj',
	        @with_log = 'true'|'false',
	        @lang = 'dil_kod',
		  @replace = ''


sp_addmessage @msgnum = '50006',
		  @severity = 10,
		  @msgtext = 'Ge�erli bir �r�n numaras� giriniz',
		  @with_log = 'true';


SELECT * FROM SYS.Messages WHERE Message_ID = 50006;


--	Parametreli Hata Mesaj� Tan�mlamak



sp_addmessage @msgnum = 50002, 
    	        @severity = 11, 
		  @msgtext = '%d adet �r�n %s kullan�c�s� taraf�ndan silindi.',
		  @with_log = 'true'


--	Mesaj Silmek


sp_dropmessage 50001


--	Olu�an Son Hatan�n Kodunu Yakalamak : @@ERROR


DECLARE @deadline INT, @hataKod INT;

SET @deadline = 0

SELECT DaysToManufacture / @deadline 
FROM Production.Product 
WHERE ProductID = 921

SET @hataKod = @@ERROR

IF @@ERROR <> 8134
BEGIN
PRINT CAST(@hataKod AS VARCHAR) + ' No''lu s�f�ra b�l�nme hatas�.';
END
ELSE IF @@ERROR <> 0
BEGIN
PRINT CAST(@hataKod AS VARCHAR) + ' No''lu bilinmeyen bir hata olu�tu.';
END;



CREATE PROC pr_HataGoster(
	@hataKod	INT,
	@dilKod	INT
)
AS
BEGIN
	DECLARE @text VARCHAR(100);
	SELECT @text = Text FROM sys.messages 
	WHERE message_id = @hataKod AND language_id = @dilKod;
	PRINT @text;
END;




EXEC pr_HataGoster 8134, 1055;




DECLARE @deadline INT, @hataKod INT, @dilKod INT

SET @deadline = 0

SELECT DaysToManufacture / @deadline FROM Production.Product 
WHERE ProductID = 921

SET @hataKod = @@ERROR;
SET @dilKod	= 1055;	-- T�rk�e dil kodu

IF @@ERROR <> 8134
BEGIN
  -- S�f�ra b�l�nme hatas�n�n T�rk�e a��klamas�n� getirir.
  EXEC pr_HataGoster @hataKod, @dilKod
END
ELSE IF @@ERROR <> 0
BEGIN
  -- Hangi hata ger�ekle�irse o hatan�n T�rk�e a��klamas�n� getirir.
  EXEC pr_HataGoster @hataKod, @dilKod	
END;



--	Stored Procedure ��erisinde @@ERROR Kullan�m�



CREATE PROCEDURE HumanResources.pr_DeleteCandidate(
    @CanID INT
)
AS
DELETE FROM HumanResources.JobCandidate WHERE JobCandidateID = @CanID;
IF @@ERROR <> 0 
    BEGIN
	  -- Ba�ar�s�z oldu�unu g�stermek i�in 99 d�nd�r�r.
        PRINT N'Aday silme i�leminde bir hata olu�tu.';
        RETURN 99;
    END
ELSE
    BEGIN
        -- Ba�ar�l� oldu�unu g�stermek i�in 0 d�nd�r�r.
        PRINT N'�� aday� silindi.';
        RETURN 0;
    END;


--	RAISERROR �fadesi


RAISERROR('Mevcut bir �r�n� eklemeye �al���yorsunuz.', 10, 1);



RAISERROR('Mevcut bir �r�n� eklemeye �al���yorsunuz.', 16, 1);



DECLARE @DBID INT;
DECLARE @DBNAME NVARCHAR(128);

SET @DBID = DB_ID();
SET @DBNAME = DB_NAME();

RAISERROR
    (N'�u anki veritaban� ID de�eri: %d ve veritaban� ad�: %s.',
    10, -- �iddet.
    1, -- Durum.
    @DBID, -- �lk arg�man.
    @DBNAME); -- �kinci arg�man.



DECLARE @DBID INT;
DECLARE @DBNAME NVARCHAR(128);

SET @DBID = DB_ID();
SET @DBNAME = DB_NAME();

RAISERROR
   (N'�u anki veritaban� ID de�eri: %d ve veritaban� ad�: %s. Coder : %s',
    10, -- �iddet.
    1, -- Durum.
    @DBID, -- �lk arg�man.
    @DBNAME, -- �kinci arg�man.
    'Cihan �zhan'); -- ���nc� arg�man.




EXECUTE sp_addmessage 
	  50007, 
	  10,
    	  N'�u anki veritaban� ID de�eri: %d ve veritaban� ad�: %s.';

DECLARE @DBID INT;
SET @DBID = DB_ID();

DECLARE @DBNAME NVARCHAR(128);
SET @DBNAME = DB_NAME();

RAISERROR (50007, 10, 1, @DBID, @DBNAME);



--	THROW  �fadesi


THROW 50001, '�r�n ekleme s�ras�nda bir hata meydana geldi.', 5;



USE tempdb;
GO
CREATE TABLE dbo.Deneme_Tablo
(
  sutun_1 int NOT NULL PRIMARY KEY,
  sutun_2 int NULL
);




BEGIN TRY
  TRUNCATE TABLE dbo.Deneme_Tablo;
  INSERT dbo.Deneme_Tablo VALUES(1, 1);
  PRINT '�lk Ekleme Sonras�';
  -- Msg 2627, Level 14, State 1 - PRIMARY KEY k�s�tlama ihlali
  INSERT dbo.Deneme_Tablo VALUES(1, 1);
  PRINT '�kinci Ekleme Sonras�';
END TRY
BEGIN CATCH
  PRINT 'Gerekirse burada istisna i�lenebilir ve f�rlat�labilir.';
  THROW;
END CATCH;




SELECT * FROM Deneme_Tablo;



--	Hata Kontrol� ve TRY-CATCH


DECLARE @sayi1 INT = 5
DECLARE @sayi2 INT = 0
DECLARE @sonuc INT

BEGIN TRY
	SET @sonuc = @sayi1 / @sayi2
END TRY
BEGIN CATCH
	PRINT CAST(@@ERROR AS VARCHAR) + ' no lu hata olu�tu'
END CATCH;



SELECT * FROM sys.messages WHERE message_id = 8134 AND language_id = 1055;




CREATE PROCEDURE pr_HataBilgisiGetir
AS
SELECT
     ERROR_NUMBER() AS ErrorNumber,
     ERROR_SEVERITY() AS ErrorSeverity,
     ERROR_STATE() AS ErrorState,
     ERROR_PROCEDURE() AS ErrorProcedure,
     ERROR_LINE() AS ErrorLine,
     ERROR_MESSAGE() AS ErrorMessage;




DECLARE @sayi1 INT = 5
DECLARE @sayi2 INT = 0
DECLARE @sonuc INT

BEGIN TRY
	SET @sonuc = @sayi1 / @sayi2
END TRY
BEGIN CATCH
	EXECUTE pr_HataBilgisiGetir;
END CATCH;












































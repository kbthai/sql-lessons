--FONKS�YONLAR
use Northwind
select ASCII('*') -- Girilen tekbir de�erin n�merik ascii karakter kar��l���n� d�ner
select p.ProductID, ASCII(p.ProductID) from Products p

SELECT ASCII('h')
select CHAR(104)--YUKARIDA K� ASCII F harfinin ascii kar��l���n� char i�erisine verdi�imizde bize F bulur. 
select NCHAR(104)

select CHARINDEX('d','abcd',2)
SELECT CHARINDEX('t', 'Customer') AS MatchPosition; -- 
select p.ProductName, CHARINDEX('A', P.ProductName) from Products p --alfan�merik karakter dizisi i�erisinde ki de�erin ka��nc� index oldu�unu verir

select CONCAT('AAA', 'BBBB')
SELECT CONCAT('W3Schools', '.com'); --birle�irtirir
select 'Yunus'+' '+'Halil'+' '+'Ahmet'

select p.ProductName+' '+cast(p.CategoryID as varchar) from Products p --birle�tir, cast covert eder. 

--SELECT CONCAT_WS('-', 'www', 'W3Schools', 'com'), p.* from Products p -- b�yle bir fonksiyon bu versiyon da yok.

select DATALENGTH('adsffsodakpodaspokdkopasdkpaspdokaso�pdjaso�jdo�asa') --data veri boyutunu verir
select p1.ProductName, LEN(p1.ProductName) [karakter say�s�], DATALENGTH(p1.ProductName)[byte boyutu] from Products p1

SELECT DIFFERENCE('b', 'b'); -- arada fark olup olmad���n�n anla��ld��� fonksiyondur. e�er fark yoksa 4 d�nd�r�r.

SELECT FORMAT(123456789, '##-##-#####'); --formatlar
SELECT FORMAT(123456789, '##/##/#####')


select FORMAT(e1.BirthDate, '##-##-####') from Employees e1

DECLARE @d DATETIME = '12/01/2018'; 
SELECT FORMAT (@d, 'd', 'en-US') AS 'US English Result',
               FORMAT (@d, 'd', 'no') AS 'Norwegian Result',
               FORMAT (@d, 'd', 'zu') AS 'Zulu Result'; 


select LEFT('Yunus',2), LEFT('Dilan', 3) -- soldan belirtilen say� kadar karakteri k�s�tlar
select RIGHT('Yunus', 2), RIGHT('H�sna', 3) --sa�dan belitilen say� kadar karakterleri k�s�tlar
select right(p1.ProductName, 5), left(p1.ProductName, 5), p1.ProductName from Products p1

select len('i�l') -- karakter boyutu. 
select ProductName, len(ProductName) from Products where len(ProductName)>15
order by 2 desc

select LOWER('A'), UPPER('a')  -- k���k harfe, b�y�k harfe d�n��t�rme
select LOWER(ProductName), UPPER(ProductName), ProductName from Products
update Products
set ProductName = LOWER(ProductName)
where LEN(ProductName)>30
select * from Products where len(ProductName)>30 --�r�n ad� 30 karakteri ge�en �r�nlerin isimlerini k���k harfe d�n��t�rd�k

SELECT QUOTENAME('abcdef'); -- alfa n�merik de�erleirn ba��na ve sonuna [] koyar
select QUOTENAME(ProductName) from Products p1 


SELECT REPLACE('SQL Tutorial', 'T', 'M');--d�n��t�rme
select replace(FirstName, 'a', 'xxxxx'), firstname, * from Employees
select replace(TitleOfCourtesy,'.',''),TitleOfCourtesy from Employees


select DATALENGTH(LTRIM('       ABC')),DATALENGTH('ABC')
select RTRIM('ABC                ') -- BO�LUKLARI TEM�ZLER

SELECT REPLICATE('AAA',2) -- VER�LEN �NDEX KADAR KARAKTER� EKLER

SELECT REVERSE('SQL Tutorial'); --Terse �evirir
SELECT REVERSE('ABC');
SELECT SPACE(10), SPACE(23424); -- Rakamsal de�erleri bo� b�rak�r. harf ald���nda hata verir. 

select STR(12133,2,2)
SELECT STR(185);
SELECT STR(185.5);
SELECT STR(185.466, 6, 2); --str yuvarlama format� ilk de�er rakam, ka�tan sonra yuvarlayaca�� ve noktan sonraki karakter say�s�.
-- ROUND
SELECT STUFF('SQL Tutorial', 1, 2, 'HTML'); --2 de�erden ba�lad� 2. de�ere kadar ��kard� eklenecek olan� ekledi dilan tarif etti.

select SUBSTRING('Yunus',1,2) --2. karakterden ba�la 2. karaktere kadar ilerle ve de�eri getir. 
select UNICODE('�') --UNICODE CODE d�ner. 

----------sql matematik fonksiyonlar�

SELECT Abs(-243.5) AS AbsNum; --MUTLAK DE�ER. 
select abs(-99)

SELECT ACOS(0.25);
SELECT ACOS(0.50); 
select ASIN(0.25); 
select ATAN(0.60);
SELECT CEILING(25.75) AS CeilValue; --yuvarlama
SELECT CEILING(45.40) AS CeilValue; --yukar� yuvarla

select cos(45.20)
select cot(45.20)

select DEGREES(10) --radyan de�eri  
select EXP(10.20) -- e taban�nda logaritmik de�er. 
select FLOOR(10.60) --a�a�� yuvarlar

select LOG(10.10) -- Do�al logaritmas�n� d�nd�r�r. 
select LOG10(10.10) -- normalde 1 olmas� ama ��km�yor h�sna... 

select PI() --pi say�s� 

select POWER(5,5) -- �SS� say�

select RAND()* 10 --random say�

SELECT ROUND(235.415, 3) AS RoundValue; --yuvarla


-- tarih formatlar�

select CURRENT_TIMESTAMP; -- sistem tarihi
SELECT SYSDATETIME(); -- sistem tarihi mili saniye
select GETDATE();

SELECT DATEADD(DAY, 1, '2017/08/25') AS tarih; -- ekleme yapar

SELECT DATEDIFF(year, '2017/08/25', '2018/08/25') AS y�lfarki;
SELECT DATEDIFF(MONTH, '2011/08/25', '2011/12/25') AS ayfark�;
SELECT DATEDIFF(DAY, '2011/08/25', '2011/08/30') AS g�nfark�;


---
declare
@sayi1 varchar(10)
begin
	set @sayi1 = '10,25'
	set @sayi1 = cast(REPLACE(@sayi1, ',','.') as float);
	set @sayi1 = CONVERT(float, REPLACE(@sayi1, ',','.'))
	select cos(@sayi1)
end ---convert �nemli tekrar edelim. 


select CURRENT_USER; --sistem k�k kullan�c�

SELECT ISNUMERIC('asdsa')  -- rakamsa 1 de�ilse 0 d�ner

select SESSION_USER; -- k�k kullan�c�


SELECT SESSIONPROPERTY('Dasdas') -- karaktere null d�ner


select SYSTEM_USER -- sistem kullan�c�s�n� d�ner

select USER_NAME(6)
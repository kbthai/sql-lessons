--case when

--1 case when then else end ezberle
select distinct emp.TitleOfCourtesy,(
case 
when emp.TitleOfCourtesy = 'Dr.'
then 'Di�er' 
when emp.TitleOfCourtesy = 'Mrs.'
then 'Evli Kad�n' 
when emp.TitleOfCourtesy = 'Mr.'
then 'Erkek' 
when emp.TitleOfCourtesy = 'Ms.'
then 'Bekar Kad�n' 
else 
'TANIMSIZ'
end) AS CinsiyetDurumu
 from Employees emp


-- internet �rne�i 
SELECT ct.Region, 
(CASE  
 WHEN Region is null  THEN 'BO� KAYIT' 
 WHEN Region = 'BC' THEN 'Bilecik' 
 WHEN Region = 'AK' THEN 'AK zihin' 
 ELSE 'Bilinmiyor' 
 END)
FROM Customers ct

select distinct Region from  dbo.Customers





SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'OTUZDAN B�Y�K'
    WHEN Quantity = 30 THEN 'OTUZA E��T'
	 WHEN Quantity < 30 THEN 'OTUZDAN K���K'
    ELSE 'The quantity is under 30'
END AS M�KTOR_KONTROL
FROM [Order Details];















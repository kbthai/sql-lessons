use test_db
--distinct
--where 
--=
--or
--and
--<
-->
--<=
-->=
--<>
--between
--in 
-- exists

select * from dbo.personel -- her �eyi listeler

select p1.adi, p1.sehir from Personel  p1 -- tabloya isim ver ve istelen alanlar� liste

select top 2 p1.adi, p1.sehir from  Personel p1 --kay�t say�s� s�n�r�

select top(25) percent * from Personel --y�zdelik kay�t getir

select distinct sehir from Personel --distinct kolonu yada kolar� birle�tirir

select distinct adi, soy_adi from Personel --kolonlar� fazla ise ayn� kolonlar oldu�u s�rece birle�tirir.

select * from Personel where sehir = '�stanbul' -- e�ittir oparat�r�
select * from Personel where sehir = '�stanbul' and maas = 220; -- 2 adet and ko�ulu var.
select * from Personel where adi = 'Ahmet' or adi =  'Serdar' --veya

select * from Personel where sehir = '�stanbul'
AND dogum_tar = '1980-01-01'
AND maas = 100
OR (sehir = 'Erzurum' or sehir = '�zmir' or sehir = 'K�r�ehir') -- OR VE AND KULLANIMI



SELECT p1.adi, p1.adres, p1.sehir, p1.maas FROM Personel as p1
where p1.maas < 200 --200 den k���k olanlar

select p1.adi,p1.adres,p1.sehir,p1.maas from Personel as p1 where p1.maas>150  --150 den b�y�kler


select * from Personel p1 where maas = 100
or (maas>=140) -- => b�y�k e�it 

select * from Personel p1 where maas = 100
or (maas<=200) -- <= k���k e�it

select * from Personel where sehir !='�stanbul'
select * from Personel where sehir <> '�stanbul'
select * from Personel where sehir <> '�stanbul' and sehir!='Erzurum'  -- olumsuzluk ifade eder getirmez

select * from Personel where maas between 10 and 140 -- aras�nda oparat�r� 10 ile 140
select * from Personel where dogum_tar between '1930-01-01' and '1980-01-01'
select * from Personel where p_id between 1 and 3
select * from Personel where p_id between 1 and 3
and sehir != 'Erzurum'

select * from Personel where adi like 'Y%' -- ilk harfi y olan
select * from Personel where adi like '%r' -- son harf r olan kay�tlar
select * from Personel where adi like '%S%'--i�inde s harfi ge�enler
select * from Personel where adi like '%A%' --k���k b�y�k fark etmez i�inde a harfi olanlar


select * from Personel where sehir = 'Erzurum' or sehir = '�zmir' or sehir = 'Erzurum'
or sehir = 'Ankara' -- gereksiz

select * from Personel where sehir in ('Erzurum','�zmir', '�stanbul') -- i�ersinde var olanlar
select * from Personel where p_id in (7,2,4); -- i�erisinde 7 2 ve 4 olanlar� getir

select * from Personel where sehir in ('Erzurum','�zmir', '�stanbul') 
select * from Personel where p_id in (7,2,4); 


--where 
--=
--or
--and
--<
-->
--<=
-->=
--<>
--between
--in 
-- exists
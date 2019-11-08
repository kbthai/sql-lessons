--order by  s�ralama

select p1.adi from Personel p1
order by p1.adi  -- ada g�re s�ralar

select p1.adi, p1.maas from Personel p1 
order by p1.adi desc -- tersten s�ralar

select distinct p1.adi from Personel p1
order by 1 desc --ayn� olan isimleri birle�tirdik ve tersten s�ralad�k

select p1.adi,p1.maas,p1.adres from Personel p1
order by 1,2 desc  -- �nce ada sonra maa�a g�re s�lad�k

--group by gruplma


select p1.sehir from Personel p1
group by p1.sehir

select p1.adi from Personel p1
group by adi
order by 1 desc


select p1.sehir, count(*) toplam_personel from Personel p1 
group by  p1.sehir  
having count(*) < 3 -- having gruplamada ki sonuca kriter vermek i�in kullan�l�r.

select p1.dept_id, count(*) from Personel p1
group by p1.dept_id
having count(*)>1 -- hangi departmanda ka� ki�i �al���yor

SELECT SS.DEPARTMAN_ADI, COUNT(*) CALISAN_TOPLAM FROM (
select 
(select d1.departman_adi from departman d1 
where d1.departman_id = p1.dept_id) AS DEPARTMAN_ADI, p1.adi
 from Personel p1 
 ) AS SS
 GROUP BY SS.DEPARTMAN_ADI
 HAVING COUNT(*)>1 -- �� SORGU

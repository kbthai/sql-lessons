--union all /union
--intersect
--union 
--Except
	 


create table personel(
ad varchar (50),
soyad varchar(50),
numara int
)

create table musteri(
ad varchar (50),
soyad varchar(50),
numara int,
must_no varchar(50)
)


select p.ad from personel p
union--gelen data her iki tablonun da �oklayan verilerini tekler. her tablodan data sa�lar
--veri tipleri kesinlikle ayn� olmald�r. 
select m.ad from musteri m


select p1.numara from personel p1
union 
select m1.must_no from musteri m1
--e�er data tipleri farkl� ise int ve varchar veri tipinde bir ististani durum vard�r.
--e�er verinin i�inde alfan�merik de�er yoksa s�k�nt� olmaz. varchar tan�mlanan bir tipi 
--n�merik alan ile union yap�yorsak varchar alanda harf veya asci karakter olmamal�d�r. 



select p1.ad from personel p1
union all --her iki tablonunda ististas�z veri tipleri ayn�ysa her �eyi getirir. 
select m1.ad from musteri m1


select p1.ad  from personel p1
intersect --her iki tabloda ki kesi�enler
select m1.ad from musteri m1


select p1.ad  from personel p1
Except --yukar�da olup a�a��daki tabloda olmayanlar
select m1.ad from musteri m1

select m1.ad from musteri m1
Except --yukar�da olup a�a��daki tabloda olmayanlar
select p1.ad  from personel p1

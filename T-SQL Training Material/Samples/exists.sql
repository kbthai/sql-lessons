--exists
create table departman(
 departman_id int identity(1,1),
 departman_adi varchar(50),
 departman_no int

)

select * from departman
select * from Personel


select * from Personel where exists (
select * from departman
) -- departman tablosuna bakt� de�er varsa true dedi ve personel tablosunda ki her �eyi listeledi


select * from Personel where exists (
select * from departman where departman_id = 99 --departman 99 yok bu y�zden false de�er d�ner
)


select * from Personel p1 where p1.dept_id = 88
and not exists (
 select * from departman  d1 where d1.departman_id = p1.dept_id
)


select * from Personel p1 where p1.dept_id = 88
and exists (
 select * from departman  d1 where d1.departman_id = p1.dept_id
)


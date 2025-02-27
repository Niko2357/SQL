create database restaurace;
use restaurace;

--1)
create table profese( 
id int primary key identity(1,1), 
nazev varchar(10) not null);

create table osoba( 
id int primary key identity(1,1),
prijmeni varchar(20) not null, 
jmeno varchar(20) not null, 
plat int, 
profese_id int not null foreign key references profese(id) );
--2)
insert into profese values ('Kuchaø');
insert into profese values ('Èíšník');
insert into profese values ('Skladník');

--3)
--a)
go
create proc pridani_osoby @prijmeni varchar(20), @jmeno varchar(20), @plat int, @profese_id int
as 
begin 
	insert into osoba(prijmeni, jmeno, plat, profese_id) values(@prijmeni, @jmeno, @plat, @profese_id);
end
go

exec pridani_osoby 'noris', 'lando', '78050', 1;
exec pridani_osoby 'hulkenberg', 'nico', '27056', 3;
exec pridani_osoby 'bottas', 'valtteri', '54653', 2;


select * from osoba;

--b)
go 
create proc zmena_platu @prijmeni varchar(20), @jmeno varchar(20), @procenta_plat decimal
as
begin
	update osoba set plat= plat*@procenta_plat where prijmeni =@prijmeni AND jmeno=@jmeno;
end
go

exec zmena_platu 'noris', 'lando', 0.05;
select * from osoba;

--4)
exec pridani_osoby 'alonso', 'fernando', '37056', 2;
exec pridani_osoby 'verstappen', 'max', '24565', 3;
exec pridani_osoby 'hadjar', 'isack', '97566', 1;
exec pridani_osoby 'piastri', 'oscar', '104685', 1;
exec pridani_osoby 'colapinto', 'franco', '47568', 2;
exec pridani_osoby 'stanek', 'roman', '18945', 3;
exec pridani_osoby 'leclerc', 'charles', '78433', 2;

select * from osoba;

--5)
--a)
go
create view seznam_zam as 
select prijmeni, jmeno, prof.nazev 
from osoba inner join profese as prof on profese_id = prof.id
group by prof.nazev, prijmeni, jmeno;
go

--b)
go
create view obsazeni_profesi as
select nazev, count(*) 
from profese;
go

--6
--a)
select * from seznam_zam;

--b)
select * from obsazeni_profesi where count(*) =5;

--c)
select prijmeni, jmeno from osoba where plat>AVG(plat);




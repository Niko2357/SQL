create database TriggeRestaurace;
use TriggeRestaurace;

--1)
create table profese( 
id int primary key identity(1,1), 
nazev varchar(10) not null);

create table osoba( 
id int primary key identity(1,1),
prijmeni varchar(20) not null, 
jmeno varchar(20) not null, 
plat int, 
profese_id int not null foreign key references profese(id)
);

--2)
insert into profese values ('Kuchaø');
insert into profese values ('Èíšník');
insert into profese values ('Skladník');

--3)
--a)
create table Zaloha(
id int primary key identity(1,1),
osoba_id int,
prijmeni varchar(20) not null, 
jmeno varchar(20) not null, 
plat int, 
profese_id int 
);

delete from Osoba where prijmeni='Ascari' AND jmeno='Alberto';

go
create trigger trg_zaloha
on Osoba instead of delete
as
begin
	select * from inserted;
	select * from deleted;
	select * from Osoba;
	select * from Zaloha;
	insert into Zaloha(osoba_id, prijmeni, jmeno, plat, profese_id) 
	select id, prijmeni, jmeno, plat, profese_id from deleted;
	delete from Osoba where osoba.id = (select id from deleted);
	select * from Zaloha;
	select * from Osoba;
end;
go

--b)
insert into Osoba(prijmeni, jmeno, profese_id) values('Roseberg', 'Keke', 2);

go
create trigger trg_plat
on Osoba after insert
as
begin
	select * from inserted;
	select * from deleted;
	select * from Osoba;
	update Osoba set plat = (select AVG(plat) from Osoba) where osoba.id = (select id from inserted);
	select * from Osoba;
end;
go

--c)
alter table Zaloha add text varchar(20), datum datetime;

go
alter trigger trg_zaloha
on Osoba instead of delete
as
begin
	select * from inserted;
	select * from deleted;
	select * from Osoba;
	select * from Zaloha;
	insert into Zaloha(osoba_id, prijmeni, jmeno, plat, profese_id, text, datum)
	select id, prijmeni, jmeno, plat, profese_id, 'smazano', CURRENT_TIMESTAMP from deleted;
	delete from Osoba where osoba.id = (select id from deleted);
	select * from Zaloha;
	select * from Osoba;
end;
go
--

update Osoba set plat =70000 where prijmeni = 'Hunt' and jmeno = 'James';

go 
create trigger trg_zmenaPlatu
on Osoba after update
as
begin
	select * from inserted;
	select * from deleted;
	select * from Osoba;
	select * from Zaloha;
	insert into Zaloha(osoba_id, prijmeni, jmeno, plat, profese_id, text, datum)
	select id, prijmeni, jmeno, plat, profese_id, 'zmeneno', CURRENT_TIMESTAMP from inserted;
	select * from Zaloha;
	select * from Osoba;
end;
go
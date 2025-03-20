create database Urad_Prace;
use Urad_Prace;

create table Firma(
id int primary key identity(1,1),
nazev varchar(20)
);

create table Pozice(
id int primary key identity(1,1),
nazev varchar(20)
);

create table Zamestnanec(
id int primary key identity(1,1),
prijmeni varchar(20),
jmeno varchar(20),
vek int check(vek > 17),
firma_id int foreign key references Firma(id),
pozice_id int foreign key references Pozice(id)
);

create table Zmeny_zam(
id int primary key identity(1,1),
firma_nazev varchar(20),
pozice_nazev varchar(20),
prijmeni varchar(20),
jmeno varchar(20),
vek int,
cas datetime,
typ_zmeny varchar(20)
);

--1) Triggery
--a)
delete from Zamestnanec where Zamestnanec.id = 3;

go
create trigger propusteni on Zamestnanec
instead of delete
as
begin
	select * from deleted;
	select * from Zamestnanec;
	declare @nazevFirmy varchar(20) = (select nazev from Firma where id = (select firma_id from deleted));
	declare @nazevPozice varchar(20) = (select nazev from Pozice where id = (select pozice_id from deleted));
	insert into Zmeny_zam(firma_nazev,pozice_nazev,prijmeni,jmeno,vek, cas, typ_zmeny)
	values(@nazevFirmy, @nazevPozice, (select prijmeni from deleted), (select jmeno from deleted), (select vek from deleted), getDate(), 'propusteni');
	delete from Zamestnanec where Zamestnanec.id = (select id from deleted);
	select * from Zamestnanec;
end;
go

select * from Zmeny_zam;
--b)
go
alter trigger prijeti on Zamestnanec
after insert 
as
begin
	select * from inserted;
	select * from Zmeny_zam;
	declare @nazevFirmy varchar(20) = (select nazev from Firma where id = (select firma_id from inserted));
	declare @nazevPozice varchar(20) = (select nazev from Pozice where id = (select pozice_id from inserted));
	insert into Zmeny_zam(firma_nazev,pozice_nazev,prijmeni,jmeno,vek, cas, typ_zmeny)
	values(@nazevFirmy, @nazevPozice,(select prijmeni from inserted), (select jmeno from inserted), (select vek from inserted), getDate(), 'prijeti');
	select * from Zmeny_zam;
end;
go

insert into Zamestnanec(prijmeni, jmeno, vek, firma_id, pozice_id) values('halel', 'grafikus', 46, 2, 1);
insert into Zamestnanec(prijmeni, jmeno, vek, firma_id, pozice_id) values('pavlik', 'pavel', 32, 1, 2);

--2) Procedury
--a)
go
alter proc pridani_zam  @prijmeni varchar(20), @jmeno varchar(20), @vek int, @firma_nazev varchar(20), @pozice_nazev varchar(20)
as
begin
declare @firma_id int= (select id from Firma where nazev = @firma_nazev);
declare @pozice_id int= (select id from Pozice where nazev = @pozice_nazev);
	insert into Zamestnanec(prijmeni , jmeno, vek, firma_id, pozice_id)
	values (@prijmeni, @jmeno, @vek, @firma_id, @pozice_id);
end;
go

exec pridani_zam 'sokol','jan',30,'Pirelli', 'programator';

--b)
go
create proc zmena_pozice @prijmeni varchar(20), @jmeno varchar(20), @pozice_nazev varchar(20)
as
begin
	declare @pozice_id int= (select id from Pozice where nazev = @pozice_nazev);
	update Zamestnanec set pozice_id = @pozice_id  where prijmeni = @prijmeni and jmeno = @jmeno;
end;
go

--c)
go
create proc zmena_firmy @prijmeni varchar(20), @jmeno varchar(20), @firma_nazev varchar(20)
as
begin
	declare @firma_id int= (select id from Firma where nazev = @firma_nazev);
	update Zamestnanec set firma_id = @firma_id  where prijmeni = @prijmeni and jmeno = @jmeno;
end;
go

--3)
--a)Umožní vypsat firmy, zamìstnance a jejich pozice setøídìné podle firmy, pozic a zamìstnancù abecednì.


--b)Umožní výpis poètu zamìstnancù na jednotlivých pozicích v jednotlivých firmách.

--c) Umožní výpis všech zmìn v zamìstnancích z tabulky "zmeny_zamestnancu".
go
create view seznam_zam as 
select * from Zmeny_zam;
go

--d)Umožní výpis všech, kteøí nejsou k dnešnímu datu zamìstnaní

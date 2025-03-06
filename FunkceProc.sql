create database lepsiFirma;
use lepsiFirma;

create table dodavatel(
id int primary key identity(1,1),
nazev varchar(50)
);

create table zbozi(
id int primary key identity(1,1),
nazev varchar(30),
cena_ks decimal check(cena_ks > 0),
dan_procenta decimal
);

create table dodavka(
id int primary key identity(1,1),
dodavatel_id int foreign key references dodavatel(id),
zbozi_id int foreign key references zbozi(id),
pocet int,
cena_celk decimal
);

--1.
go
create function spocti_dan(
	@cena_ks decimal,
	@dan_procenta decimal
)
returns decimal as
begin
	declare @dan decimal;
	set @dan = (@cena_ks/100)*@dan_procenta;

	return @dan;
end;
go
go
create function spocti_danFloat(
	@cena_ks decimal,
	@dan_procenta decimal
)
returns float as
begin
	declare @dan float;
	set @dan = (@cena_ks/100)*@dan_procenta;

	return @dan;
end;
go

select cena_ks, dan_procenta, dbo.spocti_dan(cena_ks, dan_procenta) as dan from zbozi; 
select cena_ks, dan_procenta, dbo.spocti_danFloat(cena_ks, dan_procenta) as dan from zbozi;

--2.
go
create proc pridej_dodavku @zbozi_nazev varchar(30), @pocet int, @dodavatel_nazev varchar(50)
as
begin
	declare @id_zbozi int;
	set @id_zbozi = (select zbozi.id from zbozi where zbozi.nazev = @zbozi_nazev);
	declare @id_dodavatel int;
	set @id_dodavatel = (select dodavatel.id from dodavatel where dodavatel.nazev = @dodavatel_nazev);
	declare @celkCena decimal;
	declare @cena_ks int;
	set @cena_ks = (select zbozi.cena_ks from zbozi where zbozi.nazev = @zbozi_nazev);
	set @celkCena = @pocet*@cena_ks;
	insert into dodavka(zbozi_id, dodavatel_id, pocet, cena_celk) values(@id_zbozi,@id_dodavatel, @pocet, @celkCena);
end;
go

exec pridej_dodavku 'jablko', 40, 'bohumil';

select * from dodavka;
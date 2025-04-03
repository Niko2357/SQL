create database Zoo2;
use Zoo2;

create table Stanoviste(
id int primary key identity(1,1),
typ varchar(30) check(typ in('ptaci','savci','ryby', 'obojzivelnici')),
kapacita int
);

create table Zvire(
id int primary key identity(1,1),
nazev varchar(30),
vek int,
stanoviste_id int foreign key references Stanoviste(id)
);

create table Veterinar(
id int primary key identity(1,1),
prijmeni varchar(30),
jmeno varchar(30)
);

create table Zdravotni_zaznam(
id int primary key identity(1,1),
zvire_id int foreign key references Zvire(id),
veterinar_id int foreign key references Veterinar(id),
diagnoza varchar(50),
datum_od date,
datum_do date
);


--1. 
go 
create proc novy_zaznam @zvire varchar(30), @veterinar varchar(30), @diagnoza varchar(50)
as
begin 
	declare @zvire_id int = (select id from Zvire where nazev = @zvire);
	declare @veterinar_id int = (select id from Veterinar where prijmeni = @veterinar);
	insert into Zdravotni_zaznam(zvire_id, veterinar_id, diagnoza, datum_od) values(@zvire_id, @veterinar_id, @diagnoza, getDate());
end;
go

exec novy_zaznam 'mahimahi','novak','plave spatnou stranou, narazi do skla';
select * from Zdravotni_zaznam;
--2.
go 
alter proc konec_lecby @zvire varchar(30), @veterinar varchar(30)
as
begin 
	declare @zvire_id int = (select id from Zvire where nazev = @zvire);
	declare @veterinar_id int = (select id from Veterinar where prijmeni = @veterinar);
	update Zdravotni_zaznam set datum_do = getDate() where zvire_id=@zvire_id and veterinar_id=@veterinar_id;
end;
go

exec konec_lecby 'ara', 'novak';

--3.
go
create proc nemocni @veterinar varchar(30)
as
begin
	declare @vet_id int = (select id from Veterinar where prijmeni=@veterinar);
	select * from Zdravotni_zaznam where veterinar_id=@vet_id and datum_do is null;
end;
go

exec nemocni 'novak';

--4. 
go
create proc prerazeni @zvire varchar(30), @nove_stan varchar(30)
as
begin
	declare @zvire_id int = (select id from Zvire where nazev=@zvire);
	declare @stan int = (select id from Stanoviste where typ=@nove_stan);
	declare @stare_id int = (select stanoviste_id from Zvire where nazev=@zvire);
	update Zvire set stanoviste_id = @stan where id =@zvire_id;
end
go

go
create trigger zmena_kapacity
on Stanoviste after update
as
begin
	declare @stare_id int = (select id from deleted);
	declare @stan int = (select id from inserted);
	update Stanoviste set kapacita+=1 where id=@stare_id;
	update Stanoviste set kapacita-=1 where id=@stan;
end;
go

exec prerazeni 'koala','ryby';

--5.
go
create view zviratka as
select * from Zdravotni_zaznam;
go
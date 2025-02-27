create database adresar;
use adresar;

create table email(
id int primary key identity(1,1),
adresa varchar(50) not null,
datum datetime not null
);

--procedura pro pridani adresy do emailu
go 
create proc pridat_email @adresa varchar(50)
as
begin
	set @adresa=lower(@adresa);          --ulozeni vse jako mala pismena
	if not exists(select * from email where adresa=@adresa)   --zde neni strednik
	begin
		insert into email(adresa, datum) values(@adresa, getDate());
	end
end
go
-- spusteni procedury
exec pridat_email 'emil@mail.cz';
exec pridat_email 'adresa@adresa.com';

select * from email;

--uprava procedury tak, aby vypisovala zpravu o uspesnem zapisu do tabulky nebo jesli neuspesne
go 
create proc pridani_mail @adresa varchar(50), @vysledek varchar(100) out
as
begin
	set @adresa=lower(@adresa);
	if exists(select * from email where adresa=@adresa)
	begin
		set @vysledek= 'adresa je jiz nachazi v adresari';	
	end else
	begin 
		insert into email(adresa, datum) values(@adresa, getDate());
		set @vysledek='adresa byla uspesne vlozena do adresare';
	end
end
go
--spusteni procedury s vystupnim parametrem (vsechny tri prikazy je nutne spustit najednou)
declare @vysledek varchar(100);  --ulozeni vystupu z procedury
exec pridani_mail 'emil@mail.cz', @vysledek out;
select @vysledek as 'zprava';

declare @vysledek2 varchar(100);
exec pridani_mail 'hanka@email.sl', @vysledek2 out;
select @vysledek2 as 'zprava';

select * from email;

select adresa, convert(varchar, datum, 104) as datum, convert(varchar, datum, 108) as cas
from email;

--pomocnou promenou lze deklarovat i v procedure
declare @pomocna_promena int;
--o teto pomocne promene lze nacist napr. i z jine tabulky
select @pomocna_promena = id from kategorie where nazev=@nazev_kategorie;    --predpokladame unique kategorie
--potom pri vkladani napr. noveho zbozi vkladame id kategorie, danneho zbozi

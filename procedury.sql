create database Procedury;
use Procedury;

create table Osoba(
id int primary key identity(1,1),
prijmeni varchar(20),
jmeno varchar(20),
mesto varchar(30),
ulice varchar(30)
);

GO 

Create procedure seznam     --výpis všech osob z tabulky osoba 

As 

Begin  

Select * from Osoba; 

End;     

Execute seznam; 

GO 

GO
Create proc seznam_mesto @mesto varchar(20)  --seznam osob pouze z daného mìsta 

As 

Begin 

	Select * from Osoba where Osoba.mesto = @mesto; 

End; 

Exec seznam_mesto 'Praha'; 
GO
Create proc seznam_mestoUl @mesto varchar(20), @ulice varchar(20)  

As 

Begin 

	Select * from Osoba where Osoba.mesto = @mesto AND Osoba.ulice = @ulice; 

End; 

 

Exec seznam_mestoUl 'Praha', 'Jecna';     
-- pøi zmìnì poøadí Exec seznam_mestoUl  @ulice = 'Jecna', @mesto='Praha'; 
GO

Create proc seznam_mesto_pocet @mesto varchar(20), @pocet int OuT  

As 

Begin 

	Select @pocet=count(*) from Osoba where Osoba.mesto=@mesto; 

End; 
GO
Declare @pocet_osob int; 

Exec seznam_mesto_pocet 'Brno', @pocet_osob OUT; 

Select @pocet_osob; 
GO

drop procedure seznam;

go
create proc vlozosobu @prijmeni varchar(20), @jmeno varchar(20), @mesto varchar(30), @ulice varchar(30)
as
begin
insert into Osoba (prijmeni, jmeno, mesto, ulice) Values('@prijmeni', '@jmeno', '@mesto', '@ulice');
end;
go
exec vlozosobu 'piastri','oscar','zlin','smilova';
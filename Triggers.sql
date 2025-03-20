create database triggers;
use triggers;

create table Film(
id int primary key identity(1,1),
nazev varchar(20),
delka int,
hodnoceni int check(hodnoceni between 1 and 5) --pocet hvezdicek
);
-- pri vlozeni(insert typu after) noveho filmu se mu automaticky(trigger) 
-- nastavi hodnoceni 3 (update vlozeneho insertu)

--spousteci prikaz
insert into Film(nazev, delka) values('', 160);
--trigger
go 
create trigger trg_hodnoceni 
on Film after insert
as
begin
-- vypis obsahu tabulek inserted a deleted
	select * from inserted;
	select * from deleted;
	select * from Film;
-- update hodnoceni
	update Film set hodnoceni = 3 where Film.id = (select id from inserted);
	select * from Film;
end;
go

--pred smazanim(before == instead of) filmu preradi(insert) vsechny jeho hodnoty
--do zalozni tabulky zaloha(id, film_id, nazev, delka, hodnoceni)
--a pak ho smaze z tabulky film

--zalozni tabulka
create table Zaloha(
id int primary key identity(1,1),
film_id int,
nazev varchar(20),
delka int,
hodnoceni int check(hodnoceni between 1 and 5) --pocet hvezdicek
);

--spousteci prikaz
delete from Film where nazev = 'Harry Potter';

--trigger
go
alter trigger trg_zaloha 
on Film instead of delete 
as
begin
--vypis obsahu
	select * from inserted;
	select * from deleted;
	select * from Film;
	select * from Zaloha;
--prepsani do zalohy
	insert into Zaloha(film_id, nazev, delka, hodnoceni) 
	select id, nazev, delka, hodnoceni from deleted;
--pro smazani zaznamu musi but delete i zde
	delete from Film where film.id = (select id from deleted);
	select * from Film;
	select * from Zaloha;
end;
go

create database testovani;
use testovani;
create table zanr(
id int primary key auto_increment,
nazev varchar(20) not null
);
create table film(
id int primary key auto_increment,
nazev varchar(20) not null unique,
delka int check(delka>0),
zanr_id int not null,            -- cizi klic na 2 radcich
foreign key(zanr_id) references zanr(id)  
);

-- dml prikazy
insert into zanr(nazev) values('fantasy');
insert into zanr(nazev) values('komedie');
select * from zanr;

-- delete a update mohou mit nastaveny safe mode -> nelze jej pak pouzit
-- povoleno
set SQL_SAFE_UPDATES = 0;
-- zakazano
set SQL_SAFE_UPDATES = 1;
update zanr set nazev = 'dokument' where nazev = 'fantasy';
delete from zanr where nazev = 'komedie' and id = 3;

select * from film;

-- view
create view seznam
as
select zanr.nazev as zanr, film.nazev as film, film.delka 
from zanr inner join film on zanr.id = film.zanr_id;
-- spusteni view
select * from seznam;

-- procedura
delimiter //
create procedure novy_zanr(promena_zanr varchar(20))
begin
	insert into zanr(nazev) values(promena_zanr);
end//
delimiter ;
-- spusteni procedury
call novy_zanr('drama');

-- trigger.. zmeny: vnitrni promene bez @, misto inserted a deleted tabulek new a old
-- type pouze before a after (neni instead of)
-- jinak je stejny, spousti se prikazy insert, update, delete


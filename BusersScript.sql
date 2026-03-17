create  database kino;
use kino;
create  table film(
id int primary key auto_increment,
nazev varchar(20),
zanr varchar(50),
delka int check(delka > 0),
hodnoceni int check(hodnoceni > 0 & hodnoceni < 11)
);
insert into film(nazev, zanr, delka, hodnoceni) values('To', 'horor', 135, 8);
insert into film(nazev, zanr, delka, hodnoceni) values('To 2', 'horor', 165, 4);
insert into film(nazev, zanr, delka, hodnoceni) values('Na skok do  divociny', 'animak', 130, 10);
insert into film(nazev, zanr, delka, hodnoceni) values('GOAT', 'animak', 147, 7);
insert into film(nazev, zanr, delka, hodnoceni) values('Ironlung', 'horor', 127, 7);

select * from film;

create database sklad;
use sklad;
create table zbozi(
id int primary key auto_increment,
nazev varchar(20), 
cena int check(cena > 0)
); 
insert into  zbozi(nazev, cena) values('zidle',  450);
insert into  zbozi(nazev, cena) values('stul',  700);
insert into  zbozi(nazev, cena) values('koberec',  807);
insert into  zbozi(nazev, cena) values('police',  240);
insert into  zbozi(nazev, cena) values('stolek',  560);

create user "logger1"@"%" identified by "123";
create user 'logger2'@'%' identified by '123';
create user "logger3"@"%" identified by "123";

grant select on kino.* to "logger1"@"%";
grant select on sklad.* to "logger1"@"%";

grant select on kino.* to "logger2"@"%";
grant insert on kino.* to "logger2"@"%";
grant delete on kino.* to "logger2"@"%";

grant select on kino.* to "logger3"@"%";
grant insert on kino.* to "logger3"@"%";

show grants for 'logger2'@'%';

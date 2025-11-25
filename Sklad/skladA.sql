create database skladA;
use skladA;

create table Barva(
id int primary key auto_increment,
nazev varchar(20) not null
);

create table Kategorie(
id int primary key auto_increment,
nazev varchar(20) 
);

create table Vyrobek(
id int primary key auto_increment,
nazev varchar(20) not null,
cena decimal(10, 2) check(cena > 0),
jednotka varchar(20),
popis varchar(50),
dan decimal(10, 2) check(dan > 0),
barva_id int,
foreign key (barva_id) references Barva(id),
kategorie_id int,
foreign key (kategorie_id) references Kategorie(id)
);

create table Sklad(
id int primary key auto_increment,
vyrobek_id int,
foreign key (vyrobek_id) references Vyrobek(id),
mnozstvi int
);

create table Prodej(
id int primary key auto_increment,
datum date,
vyrobek_id int, 
foreign key (vyrobek_id) references Vyrobek(id),
mnozstvi int check(mnozstvi > 0),
vydelano int check(vydelano > 0)
);

create table Nakup(
id int primary key auto_increment,
datum date,
vyrobek_id int, 
foreign key (vyrobek_id) references Vyrobek(id),
mnozstvi int check(mnozstvi > 0),
zaplaceno int check(zaplaceno > 0)
);

delimiter //
create trigger nakup after insert on Nakup
for each row
begin
	insert into Sklad values(new.vyrobek_id, new.mnozstvi);
end; 
 delimiter ;

delimiter //
alter trigger prodej after insert on Prodej
for each row
begin
	update Sklad set mnozstvi = new.mnozstvi where vyrobek_id = new.vyrobek_id;
end; 
delimiter ;

delimiter //
create procedure obraty (in od date, in do date, in id_vyrobku int, out obrat decimal(10, 2))
begin 
	select count(vydelano) as obrat from Prodej where datum < od and datum > do;
    select vyr.nazev, Sklad.mnozstvi from Sklad inner join Vyrobek as vyr on
    Sklad.vyrobek_id = vyr.id order by mnozstvi;
end;
delimiter ;

call obraty;

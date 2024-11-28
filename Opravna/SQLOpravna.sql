create database opravna;
use opravna;
--vytvoreni tabulky zakaznik
create table zakaznik(
id int primary key identity(1,1),
jmeno varchar(20) not null,
prijmeni varchar(20) not null,
telefon varchar(20) unique
);
--vytvoreni tabulky spotrebic
create table spotrebic(
id int primary key identity(1,1),
nazev varchar(20),
cena decimal check(cena > 0),
vyrobce varchar(20)
);
--vytvoreni tabulky oprava
create table oprava(
id int primary key identity(1,1),
datum_prijmu date,
datum_vydani date,
zakaznik_id int foreign key references zakaznik(id),
spotrebic_id int foreign key references spotrebic(id)
);
--pridani hodnot do tabulek
insert into zakaznik(jmeno, prijmeni, telefon) values('Vlasta', 'Redl', '489 653 124');
insert into zakaznik(jmeno, prijmeni, telefon) values('Valentino', 'Rossi', '146 464 646');
insert into zakaznik(jmeno, prijmeni, telefon) values('Oscar', 'Piastri', '978 452 164');
insert into zakaznik(jmeno, prijmeni, telefon) values('Charles', 'Leclerc', '324 761 248');

insert into spotrebic(nazev, cena, vyrobce) values('pracka', 8560, 'Bosch');
insert into spotrebic(nazev, cena, vyrobce) values('mycka', 9700, 'Samsung');
insert into spotrebic(nazev, cena, vyrobce) values('mixer', 3500, 'Eta');
insert into spotrebic(nazev, cena, vyrobce) values('vysavac', 5400, 'Robo');
insert into spotrebic(nazev, cena, vyrobce) values('lednice', 7300, 'Samsung');

insert into oprava(datum_prijmu, datum_vydani, zakaznik_id, spotrebic_id) values('2024-11-10', '2024-11-13',1,1);
insert into oprava(datum_prijmu, datum_vydani, zakaznik_id, spotrebic_id) values('2024-11-12', null, 2, 2);
insert into oprava(datum_prijmu, datum_vydani, zakaznik_id, spotrebic_id) values('2024-11-13', '2024-11-14', 3, 3);
insert into oprava(datum_prijmu, datum_vydani, zakaznik_id, spotrebic_id) values('2024-11-14', null, 4, 4);
insert into oprava(datum_prijmu, datum_vydani, zakaznik_id, spotrebic_id) values('2024-11-12', null, 4, 5);

delete from oprava where datum_prijmu='2024-11-10';
update zakaznik set telefon='444 444 666' where prijmeni='Redl';
alter table zakaznik add email varchar(20);
update zakaznik set email='email@seznam.cz' where id=3;
update zakaznik set email='emal@seznam.cz' where id=2;
update zakaznik set email='ema@seznam.cz' where id=4;

select * from zakaznik;





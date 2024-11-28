--vytvoøení nové databáze
create database zoo;
--pøepnutí do databáze
use zoo; --dùležité!!!
-- pøíkazy DDL (create, alter, drop)...pracují s objekty
--vytvoøení tabulky na stranì 1 druh (id, nazev)
create table druh(
id int primary key identity(1, 1), --vytvoøení primárního klíèe, automatické èíslování od 1 do 1
nazev varchar(20) not null unique --doménové omezení atributu
);
-- vytvoøení tabulky na stranì N zvíøe (id, název, váha, druh_id)
create table zvire(
id int primary key identity(1, 1),
nazev varchar(20) not null unique,
vaha int check(vaha > 0), --doménové omezení atributu
dat_nar date,
druh_id int not null foreign key references druh(id) --referenèní omezení
);
--zmìna struktury tabulky zvíøe, pøidání atributu dat_nar date
--alter table zvire add dat_nar date;
--zmìna struktury tabulky zvíøe, odebrání atributu dat_nar 
--alter table zvire drop column dat_nar;
--zmìna tabulky na stranì N 
--drop table zvire;
--smazání tabulky na stranì 1, není možné, protože je nastavená referenèní integrita (nedovolí sirotky - zvire bez druhu)
--drop table druh;
-- tabulka zamìstnanec (id, jmeno)
create table zamestnanec(
id int primary key identity(1, 1),
jmeno varchar(20)
);
--tabulka krmi (id, datum, zamestnanec_id, zvire_id)
create table krmi(
id int primary key identity(1, 1),
datum date,
zamestnanec_id int not null foreign key references zamestnanec(id),
zvire_id int not null foreign key references zvire(id)
);

--DML pøíkazy .. insert into, delete from, update, select - prace s daty
--vložení dat do tabulky
insert into druh(nazev) values('slon'), ('zirafa'), ('tygr');
--výpis všech dat z tabulky
select * from druh;
select * from zvire;
insert into zvire(nazev, vaha, druh_id, dat_nar) values('honza', 300, 3, '2012-08-08');
--výpis dat z více tabulek => inner join mezi tabulkami pomocí klíèù
select druh.nazev as druh,zvire.nazev as zvire, zvire.dat_nar
from druh inner join zvire on druh.id = zvire.druh_id;
--výpis všech dat z levé tabulky a spoleèných dadt z obou tabulek
select druh.nazev as druh, zvire.nazev as zvire, zvire.dat_nar
from druh left join zvire on druh.id = zvire.druh_id;
--výpis ze všech tabulek pomocí inner join
select zamestnanec.jmeno as zamestnanec, zvire.nazev as zvire, druh.nazev as druh, krmi.datum as krmi
from zamestnanec inner join krmi on zamestnanec.id = krmi.zamestnanec_id
inner join zvire on krmi.zvire_id = zvire.id
inner join druh on zvire.druh_id = druh.id;
--zmìna hodnoty atributu .. zmìna jména zam 'kos' na 'novak'
update zamestnanec set jmeno = 'novak' where jmeno ='kos';
select * from zamestnanec;

--delete from .. z tabulky na stranì 1, není možné pokud již na ní zavisí záznamy z tabulky na stranì N
delete from zamestnanec where jmeno='novak';
--smazání záznamu z tabulky na stranì N je bez problémù
--smazání krmení id=1
delete from krmi where id=2;
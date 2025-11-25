create database firma;
use firma;

create table profese(
id int primary key auto_increment,
nazev varchar(20) not null
);
-- cizi klic na dvou radcich 1.atribut, 2.omezeni ciziho klice
create table zam(
id int primary key auto_increment,
prijmeni varchar(20) check(length(prijmeni) >= 3),
plat int check(plat > 0),
profese_id int not null,
foreign key(profese_id) references profese(id)
);
-- vytvoreni modelu diagramu: database/reverse engineer...vybrat databazi
-- vlozeni dat
insert into profese(nazev) values('hasic'),('policista');
-- rucne, select rows na tabulce
select * from profese;
select * from zam;
-- uprava dat
update zam set plat = 35000 where prijmeni = 'novak';
-- !!! zabezpeceni update a delete mysqlkem, nastaven safe mode => vypnuti safe mode
set sql_safe_updates = 0;
-- smazani zaznamu z tabulky
delete from zam where id=1;
-- select s joins je stejne na vsech serverech
select profese.nazev, zam.prijmeni, zam.plat 
from profese left join zam on profese.id = zam.profese_id;
-- pocet zam v profesich, pri left, right a full join se prochazi count(*) 
-- pocitaji i radky s null hodnotami 
select profese.nazev, count(zam.profese_id) as pocet_zam
from profese left join zam on profese.id = zam.profese_id
group by profese.nazev;
-- vypis profesi, ktere nemaji zamestnance
select profese.nazev from profese where profese.id
not in (select zam.profese_id from zam);
-- nebo s having
select profese.nazev from profese left join zam on profese.id = zam.profese_id
group by profese.nazev 
having count(zam.profese_id) = 0;
 
-- zmena struktury tabulky
alter table zam add column datum_nar date;
-- smazani tabulky
drop table profese;
-- smazani databaze
drop database firma;


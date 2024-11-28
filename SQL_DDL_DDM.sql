--vytvo�en� nov� datab�ze
create database zoo;
--p�epnut� do datab�ze
use zoo; --d�le�it�!!!
-- p��kazy DDL (create, alter, drop)...pracuj� s objekty
--vytvo�en� tabulky na stran� 1 druh (id, nazev)
create table druh(
id int primary key identity(1, 1), --vytvo�en� prim�rn�ho kl��e, automatick� ��slov�n� od 1 do 1
nazev varchar(20) not null unique --dom�nov� omezen� atributu
);
-- vytvo�en� tabulky na stran� N zv��e (id, n�zev, v�ha, druh_id)
create table zvire(
id int primary key identity(1, 1),
nazev varchar(20) not null unique,
vaha int check(vaha > 0), --dom�nov� omezen� atributu
dat_nar date,
druh_id int not null foreign key references druh(id) --referen�n� omezen�
);
--zm�na struktury tabulky zv��e, p�id�n� atributu dat_nar date
--alter table zvire add dat_nar date;
--zm�na struktury tabulky zv��e, odebr�n� atributu dat_nar 
--alter table zvire drop column dat_nar;
--zm�na tabulky na stran� N 
--drop table zvire;
--smaz�n� tabulky na stran� 1, nen� mo�n�, proto�e je nastaven� referen�n� integrita (nedovol� sirotky - zvire bez druhu)
--drop table druh;
-- tabulka zam�stnanec (id, jmeno)
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

--DML p��kazy .. insert into, delete from, update, select - prace s daty
--vlo�en� dat do tabulky
insert into druh(nazev) values('slon'), ('zirafa'), ('tygr');
--v�pis v�ech dat z tabulky
select * from druh;
select * from zvire;
insert into zvire(nazev, vaha, druh_id, dat_nar) values('honza', 300, 3, '2012-08-08');
--v�pis dat z v�ce tabulek => inner join mezi tabulkami pomoc� kl���
select druh.nazev as druh,zvire.nazev as zvire, zvire.dat_nar
from druh inner join zvire on druh.id = zvire.druh_id;
--v�pis v�ech dat z lev� tabulky a spole�n�ch dadt z obou tabulek
select druh.nazev as druh, zvire.nazev as zvire, zvire.dat_nar
from druh left join zvire on druh.id = zvire.druh_id;
--v�pis ze v�ech tabulek pomoc� inner join
select zamestnanec.jmeno as zamestnanec, zvire.nazev as zvire, druh.nazev as druh, krmi.datum as krmi
from zamestnanec inner join krmi on zamestnanec.id = krmi.zamestnanec_id
inner join zvire on krmi.zvire_id = zvire.id
inner join druh on zvire.druh_id = druh.id;
--zm�na hodnoty atributu .. zm�na jm�na zam 'kos' na 'novak'
update zamestnanec set jmeno = 'novak' where jmeno ='kos';
select * from zamestnanec;

--delete from .. z tabulky na stran� 1, nen� mo�n� pokud ji� na n� zavis� z�znamy z tabulky na stran� N
delete from zamestnanec where jmeno='novak';
--smaz�n� z�znamu z tabulky na stran� N je bez probl�m�
--smaz�n� krmen� id=1
delete from krmi where id=2;
create database joins;
use joins;
--left join, right join, full outer join
create table zakaznik(
id int primary key identity(1,1),
jmeno varchar(20) 
);

create table vyrobek(
id int primary key identity(1,1),
nazev varchar(20)
);

create table objednavka(
id int primary key identity(1,1),
zak_id int foreign key references zakaznik(id),   -- v tomto pøíkladu mùže být null
vyr_id int foreign key references vyrobek(id),    -- mohl by vzniknout záznam, který nikomu nepatøí,  nebo nemá žádný výrobek => tím vznikne
datum date,                                    -- databázový sirotek
pocet_ks int                                 -- mùže dojít k nekonzistenci databáze
); 

select * from zakaznik;
select * from vyrobek;
select * from objednavka;

-- left join , vsechny zaznamy z tabulky vlevo => i ti zakaznici. kteri maji objednavku
select zakaznik.jmeno, objednavka.datum
from zakaznik left join objednavka on zakaznik.id = objednavka.zak_id;

--right join 
select zakaznik.jmeno, objednavka.datum 
from zakaznik right join objednavka on zakaznik.id = objednavka.zak_id; --tomto select zobrazi vsechny objednavky, i ty
                                                                 -- u kterych chybi zakaznik, ktery si je objednal = nekonzistence
																 -- chyba v databazi ... dadtabazovy sirotek (zaznam, ktery nikomu nepatri)
-- full join (full outer join)
select zakaznik.jmeno, objednavka.datum
from zakaznik full join objednavka on zakaznik.id = objednavka.zak_id;

--spojeni tri tabulek pomoci joins
--inner join.. zobrazi pouze "platne" objednavky
--! nezobrazi ani zakazniky, kteri si nic neobjednali, ani vyrobky, ktere si nikdo nevybral
--! ani sirotky ... chyby databaze
select zakaznik.jmeno, objednavka.datum
from zakaznik inner join objednavka on zakaznik.id = objednavka.zak_id
inner join vyrobek on vyrobek.id = objednavka.vyr_id;

--vypis vsech zakazniku i vsech vyrobku ...tj i tech co nejsou v objednavce
select zakaznik.jmeno, objednavka.datum 
from zakaznik full join objednavka on zakaznik.id = objednavka.zak_id
full join vyrobek on vyrobek.id = objednavka.vyr_id;

--jen zakaznici, co nic neobjednali u joinu vsech tri tabulek
select zakaznik.jmeno, objednavka.datum 
from zakaznik left join objednavka on zakaznik.id = objednavka.zak_id
left join vyrobek on vyrobek.id = objednavka.vyr_id;

--selfreference
--1:N , hierarchie
create table zam(
id int primary key identity(1,1),
nad_zam_id int foreign key references zam(id),
jmeno varchar(20)
);

select * from zam;

--vypsani nadrizenych a jejich podrizenych
select nadrizeny.jmeno as nadrizeny,podrizeny.jmeno as podrizeny 
from zam as nadrizeny inner join zam as podrizeny on nadrizeny.id = podrizeny.nad_zam_id;


--selfreference M:N
create table misto(
id int primary key identity(1,1),
nazev varchar(20)
);

create table let(
id int primary key identity(1,1),
odkud_id int not null foreign key references misto(id),
kam_id int not null foreign key references misto(id),
datum date,
check(odkud_id != kam_id)   -- dva a vice atributu porovnavam na konci tabulky
);

select * from misto;
select * from let;

select odlet.nazev as odlet, prilet.nazev as prilet  
from misto as odlet inner join let on odlet.id = let.odkud_id
inner join misto as prilet on prilet.id = let.kam_id;

select odlet.nazev as odlet, prilet.nazev as prilet  
from misto as odlet full join let on odlet.id = let.odkud_id
full join misto as prilet on prilet.id = let.kam_id;


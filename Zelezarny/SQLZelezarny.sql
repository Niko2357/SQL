create database zavod;
use zavod;
--Vypi�te kdy a kolik hodin odpracovali zam�stnanci za jednotliv� �innosti v ur�it�m m�s�ci, set�i�te podle data a �innosti. 
create table zam(
id int primary key identity(1,1),
jmeno varchar(20) not null,
prijmeni varchar(20) not null,
mzda int
);
create table oddeleni(
id int primary key identity(1,1),
nazev varchar(20) not null check(nazev in('kancelare', 'vedeni', 'dilna')),
zam_id int foreign key references zam(id)
);
create table cinnost(
id int primary key identity(1,1),
nazev varchar(20) check(nazev in('kovani', 'svareni', 'ucetnictvi', 'cnc stroj', 'vededni')),
pocet_hodin int check(pocet_hodin > 0),
datum date not null,
zam_id int foreign key references zam(id)
);

select cinnost.datum, cinnost.pocet_hodin from cinnost; 



create database letiste;
use letiste;
create table pilot(
id int primary key identity(1,1),
jmeno varchar(20) not null,
prijmeni varchar(20) not null
);

create table let(
id int primary key identity(1,1),
datum date,
porucha bit,
delka_letu int check(delka_letu > 0),
pilot_id int not null foreign key references pilot(id)
);

--1. celkový poèet letù
select count(*) pocet_letu from let;
--2. datum nejstaršího a nejnovìjšího letu
select min(datum) nejstarsi from let;
select max(datum) nejnovejsi from let;
--3. poèet letù pro jednotlivé piloty, u pilotù uveïte pøíjmení a jméno, setøiïte je od nejvìtšího poètu letù

--4. pøíjmení pilotù, kteøí nemìli žádné let

--5. který pilot mìl poruchu "motoru" a  kdy ... (poruchy: motor, podvozek, palivo)
select pilot.prijmeni, pilot.jmeno
from pilot inner join let on pilot_id = let.pilot_id
having count(pilot_id) = 0;
--6. který let byl nejkratší (délka_letu) a jakému pilotovi patøil

--7. prùmìrnou délku letu
select avg(delka_letu) from let;
--8. datumy letù, které trvaly více než prùmìrná doba letu
select datum from let where(datum > avg(delka_letu));


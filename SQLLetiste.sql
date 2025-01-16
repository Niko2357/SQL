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

--1. celkov� po�et let�
select count(*) pocet_letu from let;
--2. datum nejstar��ho a nejnov�j��ho letu
select min(datum) nejstarsi from let;
select max(datum) nejnovejsi from let;
--3. po�et let� pro jednotliv� piloty, u pilot� uve�te p��jmen� a jm�no, set�i�te je od nejv�t��ho po�tu let�

--4. p��jmen� pilot�, kte�� nem�li ��dn� let

--5. kter� pilot m�l poruchu "motoru" a  kdy ... (poruchy: motor, podvozek, palivo)
select pilot.prijmeni, pilot.jmeno
from pilot inner join let on pilot_id = let.pilot_id
having count(pilot_id) = 0;
--6. kter� let byl nejkrat�� (d�lka_letu) a jak�mu pilotovi pat�il

--7. pr�m�rnou d�lku letu
select avg(delka_letu) from let;
--8. datumy let�, kter� trvaly v�ce ne� pr�m�rn� doba letu
select datum from let where(datum > avg(delka_letu));


create database skola;
use skola;

create table student(
id int primary key identity(1, 1),  --entitni integrita
prijmeni varchar(20) not null check(len(prijmeni) >= 3), --domenova integrita
jmeno varchar(20) not null,
datumNar date not null check((year(getDate())-year(datumNar))>=15),-- starsi 15 let
ang_Uroven char(2) not null check(ang_Uroven in('A2', 'B1', 'B2', 'C1')),
znamka int check(znamka between 1 and 5),
email varchar(20) not null unique check(email like '%@%.%') 
);

select year(getDate())-15;

create table trida(
id int primary key identity(1,1),
nazev char(3) not null unique
);
--1. pridadni ciziho klice 'trida_id' do tabulky 'student'
alter table student add trida_id int;
--2. pridani omezeni ciziho klice
alter table student add constraint fk_trida foreign key (trida_id) references trida(id);


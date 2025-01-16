create database obchod;
use obchod;

create table zakaznik(
id int primary key identity(1,1),
prijmeni varchar(20) not null,
email varchar(20) check(email like('%@%.%'))
);

create table dodavatel(
id int primary key identity(1,1),
nazev varchar(20) not null,
email varchar(20) check(email like('%@%.%'))
);

create table zbozi(
id int primary key identity(1,1),
dodavatel_id int foreign key references dodavatel(id),
typ varchar check(typ in('obchodni', 'reklamni', 'provozni')),
nazev varchar(20) not null,
cena_ks int check(cena_ks > 0)
);

create table objednavka(
id int primary key identity(1,1),
zbozi_id int foreign key references zbozi(id),
zakaznik_id int foreign key references zakaznik(id),
datum date,
pocet_ks int check(pocet_ks > 0),
cena_obj int not null
);

-- 1. 
update zbozi set cena_ks= cena_ks+(cena_ks*0.2) where nazev='bosh';
-- 2.
delete objednavka where zbozi_id=(select id from zbozi where typ='reklamni');
-- 3.
select zakaznik_id from objednavka where cena_obj=(select cena_obj from objednavka where cena_obj > 1000);
-- 4.
select * into premiovy_zakaznik from zakaznik where 1 = 0;
-- 5.
insert into premiovy_zakaznik(id, prijmeni, email) select zakaznik_id from objednavka where cena_obj > 5000; 


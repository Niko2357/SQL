create database obchod;
use obchod;

create table zakaznik(
id int primary key auto_increment,
email varchar(20) check(email like '%@%.%')
);

create table zbozi(
id int primary key auto_increment,
nazev varchar(20),
cena_ks decimal(10,2) check(cena_ks > 0),
dan_procenta int
);

create table objednavka(
id int primary key auto_increment,
klient_id int,
foreign key (klient_id) references zakaznik(id),
zbozi_id int, 
foreign key (zbozi_id) references zbozi(id),
pocet int check(pocet > 0),
cena_celkem decimal(10,2)
);

select * from zakaznik;
select * from zbozi;
select * from objednavka;

delimiter //
create function cena_s_dani (cena_zbozi decimal(10,2), dan_procenta int)
returns decimal(10,2) deterministic
begin
	declare cena_s_dani decimal(10,2) ;
    set cena_s_dani = cena_zbozi + cena_zbozi*(dan_procenta/100);
	return cena_s_dani;
end //
delimiter ;

delimiter //
create procedure pridej_objednavku (in zbozi_nazev varchar(20), in pocet int, in zakaznik_mail varchar(20))
begin 
	declare zaka_id int;
    declare zboz_id int;
	declare cena_zboz decimal(10,2);
    declare dan_proc int; 
    declare cena_celk decimal(10,2); 
    set cena_celk = cena_s_dani(cena_zboz, dan_proc) * pocet;
    set zaka_id = (select id from zakaznik where email = zakaznik_mail);
    set zboz_id = (select id from zbozi where nazev = zbozi_nazev);
    set cena_zboz = (select cena_ks from zbozi where nazev = zbozi_nazev);
    set dan_proc = (select dan_proc from zbozi where nazev = zbozi_nazev);
	insert into objednavka(klient_id, zbozi_id, pocet, cena_celkem) values(zaka_id, zbozi_id, pocet, cena_celk);
end //
delimiter ;

call pridej_objednavku('kniha', 2, 'novak@seznam.cz');

create table zaloha(
id int primary key auto_increment,
klient_id int,
foreign key (klient_id) references zakaznik(id),
zbozi_id int, 
foreign key (zbozi_id) references zbozi(id),
pocet int check(pocet > 0),
cena_celkem decimal(10,2)
);

delimiter //
create trigger storno_objednavky before delete on objednavka
for each row
begin 
	insert into zaloha(kliend_id, zbozi_id, pocet, cena_celkem) values(old.klient_id, old.zbozi_id, old.pocet, old.cena_celkem);
end //
delimiter ;

delete from objednavka where id = 4;

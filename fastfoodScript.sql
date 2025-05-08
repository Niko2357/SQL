create database fastfood;
use fastfood;
-- 1.
-- nelibi se mi foreign key na dvou radcich
create table automat(
id int primary key auto_increment,
oznaceni varchar(20)
);
create table objednavka(
id int primary key auto_increment,
automat_id int,
foreign key(automat_id) references automat(id),
datum date,
cena_celkem int not null
);
create table jidlo_napoj(
id int primary key auto_increment,
nazev varchar(20),
cena_ks int check(cena_ks>0)
);
create table polozka(
id int primary key auto_increment,
obj_id int,
foreign key(obj_id) references objednavka(id),
jidlo_napoj_id int,
foreign key(jidlo_napoj_id) references jidlo_napoj(id),
pocet int,
cena_polozka int
);
-- 2.
select * from polozka;
-- 3.
-- current_date misto getDate a delimiter
delimiter //
create procedure vlozeni_objednavky(automat int)
begin 
	insert into objednavka(automat_id, datum, cena_celkem) values(automat, current_date(), 0);
end//
delimiter ;
-- call misto execute
call vlozeni_objednavky(1);

-- nemuzu napsat declare cena int = select ... 
delimiter //
create procedure vlozeni_polozky(objednavka int, jidlo_napoj_nazev varchar(20), pocet int)
begin
	declare cena_polozka int;
    declare jidlo_napoj_id int; 
    set jidlo_napoj_id = (select id from jidlo_napoj where nazev = jidlo_napoj_nazev);
    set cena_polozka = (select cena_ks from jidlo_napoj where id = jidlo_napoj_id);
	insert into polozka(obj_id, jidlo_napoj_id, pocet, cena_polozka) values(objednavka, jidlo_napoj_id, pocet, cena_polozka);
end//
delimiter ;
call vlozeni_polozky(1, 'hranolky', 1);
-- 4. 
delimiter //
create trigger zmena_ceny_insert after insert on polozka
for each row
begin
	declare cena_celk decimal(10, 2);
	select cena_celkem into cena_celk from objednavka where id = new.obj_id;
	set cena_celk = cena_celk + new.cena_polozka;
    update objednavka set cena_celkem = cena_celk where id = new.obj_id;
end//
delimiter ;

delimiter //
create trigger zmena_ceny_upadate after update on polozka
for each row
begin
	declare cena_celk decimal(10, 2);
    declare puvodni_cena decimal(10, 2);
    select cena_celkem into cena_celk from objednavka where id = new.obj_id;
	select cena_polozka into puvodni_cena from polozka where id = old.id;
	set cena_celk = cena_celk - puvodni_cena + new.cena_polozka;
    update objednavka set cena_celkem = cena_celk where id = new.obj_id;
end//
delimiter ;

delimiter //
create trigger zmena_ceny_delete after delete on polozka
for each row
begin
	declare cena_celk decimal(10, 2);
	select cena_celkem into cena_celk from objednavka where id = old.obj_id;
	set cena_celk = cena_celk - old.cena_polozka;
	update objednavka set cena_celkem = cena_celk where id = old.obj_id;
end//
delimiter ;
select * from objednavka;
-- 5.
create view statistika as select jidlo_napoj.nazev, sum(polozka.pocet) as celkem_kus, 
sum(polozka.cena_polozka) as celkem_prodano from polozka inner join jidlo_napoj 
on polozka.jidlo_napoj_id = jidlo_napoj.id group by jidlo_napoj.nazev;

select * from statistika;
-- 6.
DELIMITER //

CREATE PROCEDURE generuj_data()
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE obj_id INT;

    WHILE i < 10 DO
        CALL vlozeni_objednavky(FLOOR(1 + RAND() * 2));  -- generuje objednavku, předpoklad: automat_id 1 nebo 2
        SET obj_id = LAST_INSERT_ID();
        CALL vlozeni_polozky(obj_id, FLOOR(1 + RAND() * 2), FLOOR(1 + RAND() * 5));
        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

call generuj_data();
select * from objednavka;
select * from polozka;
select * from statistika;

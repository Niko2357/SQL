use podnik;

create table profese( 
id int primary key auto_increment, 
nazev varchar(30) not null
);

create table zam( 
id int primary key auto_increment,
prijmeni varchar(30) not null, 
jmeno varchar(20) not null, 
plat int, 
profese_id int not null,
foreign key (profese_id) references profese(id) 
);

insert into profese(nazev) values ('web_frontend');
insert into profese(nazev) values ('web_developer');
insert into profese(nazev) values ('security_specialist');
insert into profese(nazev) values ('programmer');

select * from profese;
-- 3a) procedura Novy_zam, pridani uzivatele
delimiter //
create procedure Novy_zam(in prijmeni varchar(30), in jmeno varchar(20), in plat int, in nazev_profese varchar(30))
begin 
	insert into zam(prijmeni, jmeno, plat, profese_id) values(prijmeni, jmeno, plat, (select id from profese where nazev = nazev_profese));
end //
delimiter ;

call Novy_zam('hus', 'david', '57000', 'web_developer');

-- 3b) procedura Zmena_platu
delimiter //
create procedure Zmena_platu(in  prijmeni varchar(30), jmeno varchar(20), in procentualni_pridani decimal(10,2))
begin 
	update zam set plat = plat + plat*(procentualni_pridani/100) where prijmeni = prijmeni and jmeno = jmeno;
end //
delimiter ;

call Zmena_platu('hus', 'david', '10');

-- 4) pridani 10 zamestnancu
call Novy_zam('leclerc', 'charles', '35000', 'web_developer');
call Novy_zam('alonso', 'fernando', '47000', 'programmer');
call Novy_zam('albon', 'alex', '57000', 'web_frontend');
call Novy_zam('tsunoda', 'yuki', '50000', 'security_specialist');
call Novy_zam('hamilton', 'louis', '68000', 'web_developer');
call Novy_zam('raikonnen', 'miki', '31000', 'programmer');
call Novy_zam('schumacher', 'michael', '49000', 'web_frontend');
call Novy_zam('prost', 'alan', '78000', 'security_specialist');
call Novy_zam('lauda', 'niki', '67000', 'programmer');
call Novy_zam('senna', 'aerton', '39000', 'security_specialist');

-- 5a)
create view seznam_zam as 
select prijmeni, jmeno, profese.nazev from zam join profese on profese_id = profese.id order by profese.nazev, prijmeni, jmeno;

-- 5b)
create view obsazeni_profesi as
select profese.nazev, count(profese_id) as pocet from zam join profese on profese.id = profese_id group by profese.nazev;
-- 6a)
select seznam_zam where profese.nazev = 'programmer';
-- 6b)
select obsazeni_profesi where pocet > 5;
-- 6c) 
select seznam_zam where plat > avg(plat);


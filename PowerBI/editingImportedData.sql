create database olap;
use olap;


-- 1. sjednoceni jmen ridicu
select ridic, count(*) as pocet_jizd from jizdy group by ridic;

-- prespis ridice na Ridic_5
-- odstraneni prazdnych znaku ze stran, ltrim(), rtrim(), trim()
update jizdy set ridic = trim(ridic);
update jizdy set ridic = 'Ridic_5' where ridic in('Ridic 5', 'ridic_5');

-- 2. oprava formatu datumu
select datum, count(*) as pocet_dat from jizdy group by datum;

--prevedeme data do formatu %/%/% ma defaultni yyyy-mm-dd (format 103)
update jizdy set datum = TRY_CONVERT(date, datum, 103) where datum like '%/%/%';
update jizdy set datum = TRY_CONVERT(date, datum, 103) where datum like '%.%.%';

-- 3. sjednoceni spz vse na velka pismena
select auto_spz, count(*) as pocet_aut from jizdy group by auto_spz;

update jizdy set auto_spz = upper(auto_spz);

-- 4. vytvoreni noveho sloupce s ciselnym datovym typem decimal(10, 2) a prevod hodnot
alter table jizdy add vzdalenost_km_num decimal(10, 2);
-- prenos hodnot
update jizdy set vzdalenost_km_num = cast(vzdalenost_km as decimal(10, 2));

-- stejny prenost i se spotrebou, jen pohlidat  jestli to neni null pomoci nullif
alter table jizdy add spotreba_l_num decimal(10, 2);
update jizdy set spotreba_l_num = cast(nullif(spotreba_l, '') as decimal(10, 2));
-- 5. uprava ceny paliva
update jizdy set cena_paliva_celkem_czk  = trim(cena_paliva_celkem_czk);

-- 6. sjednoceni poruch
select porucha, count(*) as pocet_dat from jizdy group by porucha;
update jizdy set porucha = '0' where porucha in ('', ' ', 'False', 'Ne', 'NULL');
update jizdy set porucha = '1' where porucha in ('ANO');

-- 7. prevod doby na minuty z formatu h:mm
select doba_jizdy, count(*) as pocet_dob from jizdy group by doba_jizdy;
update jizdy set doba_jizdy = '2:30' where doba_jizdy like ('2h 30m'); 
update jizdy set doba_jizdy = '0:45' where doba_jizdy like ('45 min'); 
-- vse na minuty 
update jizdy set doba_jizdy = cast(left(doba_jizdy, charindex(':', doba_jizdy)-1) as int)* 60 + cast(substring(doba_jizdy, charindex(':', doba_jizdy)+1, 2)as int) where doba_jizdy like '%:%';
-- uprava null na 0
update jizdy set doba_jizdy = '0' where doba_jizdy like ('NULL'); 

-- 8. vytvoreni dim tabulek
-- DimAuto(sid, spz,  model) + vlozeni distinct dat 
-- DimRicdic(sid, jmeno) + vlozeni distinct dat
-- misto ridice, auto_spz vlozime sid do tabulky jizdy 
-- misto tabulky faktu jen vytvorime pohled z puvodni tabulky jizdy
create table DimAuto(
sid int primary key identity(1,1),
spz char(8) not null,
model varchar(20) not null
);

insert into  DimAuto(spz, model) select distinct auto_spz, auto_model from jizdy;
select * from DimAuto;

create table  DimRidic(
sid int primary key identity(1,1),
jmeno varchar(20) not null
);

insert into  DimRidic(jmeno) select distinct ridic from jizdy;
select * from DimRidic;

-- 9. vlozeni sid  z  dim tabulek 
-- ridic
update jizdy set ridic = (select DimRidic.sid from DimRidic where DimRidic.jmeno = jizdy.ridic) where ridic in(select jmeno from DimRidic);

-- auto
update jizdy set auto_spz = (select DimAuto.sid from DimAuto where DimAuto.spz = jizdy.auto_spz) where auto_spz in(select spz from DimAuto);
update jizdy set auto_model = 'Hyundai i30' where auto_model like 'Hyndai i30';

-- view jako  FactJizdy
go
create view FactJizdy
as select id_jizdy as sid,   datum, ridic as DimRidic_sid, auto_spz as DimAuto_sid, vzdalenost_km_num, spotreba_l_num, cena_paliva_celkem_czk as cena_paliva, doba_jizdy, porucha, poznamka from  jizdy;
go

select * from jizdy;


use zoo1;

select * from druh;
-- view
create view seznam as
select druh.nazev, zvire.jmeno, zvire.vaha
from druh inner join zvire on druh.id = zvire.druh_id;
-- spusteni pohledu
select * from seznam;
-- nebo
select seznam.nazev, seznam.jmeno from seznam;
-- procedura nove_zvire, ktera vlozi nove zvire
-- se vstupnimi parametry: druh_nazev, zvire_jmeno, zvire_vaha
-- zmena ukonceni radku 
delimiter //
create procedure nove_zvire(druh_nazev varchar(20), zvire_jmeno varchar(20), zvire_vaha int)
begin
	insert into zvire(jmeno, vaha, druh_id) 
    values(zvire_jmeno, zvire_vaha, (select id from druh where nazev = druh_nazev));
end //
-- zmena zpet
delimiter ; 

call nove_zvire('savec', 'zirafa', 320);
select * from zvire;


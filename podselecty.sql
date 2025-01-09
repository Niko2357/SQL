-- podselect je select vnoreny do jineho prikazu DML(insert, delete, update, select)
-- insert s hodnotami
insert into zam(..,..,..) values(..,..,..);
-- insert s podselectem
insert into zam(..,..,..) select ..,..,.. from novi_zam;
--profese(id, nazev), zam(id, profese_id, prijmeni, plat)
-- update 
update zam set plat=plat+10000;
-- pokud znam id profese programatora id = 1 <- kdyz potrebuju pridat plat jen jedne profesy
update zam set plat=plat+10000 where profese_id=1;
-- zjisteni id dane profese musi byt pomoci podselectu
-- v update nelze pouzit join mezi tabulkami
-- podselect
select id from profese where nazev='programator';  --vrati id=1, 
-- pouziti podselectu pro pridani platu jedne profesy
update zam set plat=plat+10000 
where profese_id = (select id from profese where nazev='programator');

-- delete, ktery smaze vse
delete from zam;
-- pokud vim, ze web_developer ma id=2, a chci je smazat
delete from zam where profese_id = 2;
-- ! u delete nelze pouzit join s jinou tabulkou => nutne pouzit podselect !
-- podselect
select id from profese where nazev='web-developer';  --vrati id=2,
-- delete s podselectem na smazani
delete from zam where profese_id=(select id from profese where nazev='web-developer');

-- v selectu lze pouzit joiny i podselecty
-- podselect v select muze byt klauzuli where, select, from, having

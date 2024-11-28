create database fastfood;
use fastfood;
--vytvoreni tabulky zamestnanec
create table zam(
id int primary key identity(1,1),
jmeno varchar(20) NOT NULL,
prijmeni varchar(20) NOT NULL,
vek int,
CHECK(vek >= 18),
email varchar(20)
);
--vytvoreni tabulky objednavka
create table objednavka(
id int primary key identity(1,1),
datum date NOT NULL,
zam_id int foreign key REFERENCES zam(id),
cena_celk decimal(20, 2),
CHECK(cena_celk >0),
);
--vytvoreni tabulky potravina
create table potravina(
id int primary key identity(1,1),
nazev varchar(20) NOT NULL,
cena_ks int
);
--vytvoreni tabulky polozka
create table polozka(
id int primary key identity(1,1),
pocet_ks int,
obj_id int foreign key REFERENCES objednavka(id),
potravina_id int foreign key REFERENCES potravina(id)
);
--odstraneni sloupce email
ALTER TABLE zam
DROP COLUMN email;

insert into zam(jmeno, prijmeni, vek) values('Viktor', 'Vektor', 46);
create database fastfood;
use fastfood;
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

select * from jidlo_napoj;

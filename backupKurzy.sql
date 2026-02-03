create database kurzy;
use kurzy;

create table kurz(
id int auto_increment primary key,
name varchar(50)
);

create table student(
id int auto_increment primary key,
name varchar(50),
surname varchar(50),
age int
);

create table zapis(
id int auto_increment primary key,
kurz_id int,
foreign key (kurz_id) references kurz(id),
student_id int,
foreign key (student_id) references student(id)
);

insert into kurz(name)  values('programovani');
insert into kurz(name)  values('malba');
insert into kurz(name)  values('kresba');
insert into kurz(name)  values('korejstina');
insert into kurz(name)  values('keramika');

insert into student(name, surname, age) values('David', 'Pospisil', 20);
insert into student(name, surname, age) values('Baltazar', 'Hrabal', 15);
insert into student(name, surname, age) values('Otakar', 'Novak', 16);

insert into zapis(kurz_id, student_id) values(1, 1);
insert into zapis(kurz_id, student_id) values(1, 2);
select * from student;
create database f1;

use f1;

create table team(
id int primary key  identity(1,1),
name varchar(200)
);

create table racer(
id int primary key identity(1,1),
name varchar(50),
surname varchar(200),
age int check(age > 14),
team_id int foreign key references team(id)
);

insert into team(name) values('Mercedes Petronas');
insert into team(name) values('Ferrari Scuderra');
insert  into team(name) values('McLaren');
select  * from team;

insert into racer(name, surname, age, team_id) values('Louise', 'Hamilton', 42, 1);
insert into racer(name, surname, age, team_id) values('Kimi', 'Antonielli', 18, 1);
insert into racer(name, surname, age, team_id) values('Oscar', 'Piastri', 23, 3);
insert into racer(name, surname, age, team_id) values('Lando', 'Norris', 24, 3);

select  * from racer;

insert  into team(name) values('Visa Cash App Racing Bulls');

insert into racer(name, surname, age, team_id) values('Liam', 'Lawson', 20, 4);
insert into racer(name, surname, age, team_id) values('Arvid', 'Lindbald', 18, 4);

update racer set team_id = 2 where surname = 'Hamilton';

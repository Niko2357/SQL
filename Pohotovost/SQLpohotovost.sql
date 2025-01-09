create database pohotovost;
use pohotovost;

create table pacient(
id int primary key identity(1,1),
jmeno char(20) not null,
prijmeni char(20) not null, 
dat_nar date not null,
mesto char(20) not null, 
email varchar(20) check(email like('%@%.%'))
);

create table lekar(
id int primary key identity(1,1),
jmeno char(20) not null, 
prijmeni char(20) not null check(len(prijmeni) >= 3), 
licence int unique, 
obor_id int foreign key references pacient(id)
);

create table obor(
id int primary key identity(1,1),
nazev char(20) unique, 
atestace char check(atestace in('AI', 'AII', 'AIII', 'AIV', 'AV'))
);

create table zakrok(
id int primary key identity(1,1), 
datum date not null, 
diagnoza char(20) not null, 
delka_min int check(delka_min > 0), 
pacient_id int not null foreign key references pacient(id), 
lekar_id int not null foreign key references lekar(id)
);

drop table obor;
create table obor(
id int primary key identity(1,1),
nazev char(20) unique
);
alter table lekar add atestace char check(atestace in('AI', 'AII', 'AIII', 'AIV', 'AV'));

create table lekar(
id int primary key identity(1,1),
jmeno char(20) not null, 
prijmeni char(20) not null check(len(prijmeni) >= 3), 
licence int unique, 
obor_id int not null foreign key references obor(id),
atestace char check(atestace in('AI', 'AII', 'AIII', 'AIV', 'AV'))
);

create table zakrok(
id int primary key identity(1,1), 
datum date not null, 
diagnoza char(20) not null, 
delka_min int check(delka_min > 0), 
pacient_id int not null foreign key references pacient(id), 
lekar_id int not null foreign key references lekar(id)
);

select prijmeni from lekar where obor_id = 4 and atestace = 'AII';
select year(getDate());
select prijmeni from pacient where mesto='Praha';
 







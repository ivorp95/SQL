CREATE table registracija(
clan_id int primary key auto_increment not null,
ime varchar(30) not null,
prezime varchar(50) not null,
brojMob varchar(20) not null unique,
lozinka varchar(70) not null
);


select * from registracija ;

SELECT * from registracija WHERE brojMob=2 OR ime='Pero';


create table registracijaVjezba(
id int(5) auto_increment primary key not null,
korisnikIme varchar(50) not null unique,
email varchar(100) not null unique,
lozinka varchar(50) not null
);

alter table registracijaVjezba add inicijali varchar(5);
alter table registracijaVjezba add JMBG int(50);

select * from registracijaVjezba;


create table registracijaKolokvij(
id int(5) auto_increment primary key not null,
ime varchar(50) not null,
prezime varchar(100) not null,
grad varchar(50) not null,
Zslova varchar(10) not null
);

select * from registracijaKolokvij;
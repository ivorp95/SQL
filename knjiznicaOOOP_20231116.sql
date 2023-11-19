CREATE table registracija(
clan_id int primary key auto_increment not null,
ime varchar(30) not null,
prezime varchar(50) not null,
brojMob varchar(20) not null unique,
lozinka varchar(70) not null
);


select * from registracija;

SELECT * from registracija WHERE brojMob=0912016999;


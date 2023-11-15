CREATE TABLE student (
JMBAG BIGINT(13) NOT NULL,
IME VARCHAR(30) NOT NULL,
PREZIME VARCHAR(30) NOT NULL,
DAT_ROD DATE NOT NULL
);

SELECT  * FROM student;
SELECT  * FROM ooop_pangos;

ALTER table student add GODINA tinyint(1);
ALTER table student modify GODINA tinyint(2) not null;
ALTER table student change JMBAG OIB bigint(11);
ALTER table student modify OIB bigint(11) not null;
ALTER table student drop GODINA;

CREATE TABLE Grad (
PostBr INT(5),
Grad VARCHAR(32)
);

CREATE table Artikli(
NazivArtikla varchar(32),
JedinicaMjere varchar(3)
);

CREATE table Kupci(
NazivKupca varchar(32),
AdresaKupca varchar(32),
PostBr int(5),
MatBr bigint(13)
);

CREATE table ArtiklRacun(
BrojRac int(4),
NazivArtikla varchar(32),
Kolicina decimal(5,2),
Cijena decimal(6,2),
Iznos decimal(6,2)
);

CREATE table Racuni(
BrojRac int(4),
NazivKupca varchar(32),
DatumRac date,
IspNaTemelj varchar(24),
DatumIsp date,
VrstaPlac varchar(24),
Ukiznos decimal(6,2)
);

ALTER table Grad add primary key(PostBr);
ALTER table Artikli add primary key(NazivArtikla);
ALTER table Kupci add primary key(NazivKupca);
ALTER table Racuni add primary key(BrojRac);
ALTER table ArtiklRacun  add primary key(BrojRac,NazivArtikla);

CREATE index KupciGradovi on Kupci(PostBr);
CREATE index RacuniKupci on Racuni(NazivKupca);
CREATE index ArtikliRac_Artikli on ArtiklRacun(NazivArtikla);
CREATE index ArtikliRac_Racuni on ArtiklRacun(BrojRac);

rename table AritiklRacun to ArtiklRacun;



CREATE TABLE mobiteli_pzi (
ID BIGINT(13) Primary key NOT NULL auto_increment,
NAZIV VARCHAR(200) NOT NULL,
PROIZVODAC VARCHAR(30) NOT NULL,
CIJENA INT(20) NOT NULL
);

INSERT INTO mobiteli_pzi(NAZIV,PROIZVODAC,CIJENA) VALUES ('Galaxy S23 5G','Samsung',1300);
INSERT INTO mobiteli_pzi(NAZIV,PROIZVODAC,CIJENA) VALUES ('Galaxy A54 5G','Samsung',100);
INSERT INTO mobiteli_pzi(NAZIV,PROIZVODAC,CIJENA) VALUES ('Iphone 15','Apple',15000);




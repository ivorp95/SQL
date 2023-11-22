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

#dodavanje primarnih kljuceva

ALTER table Grad add primary key(PostBr);
ALTER table Artikli add primary key(NazivArtikla);
ALTER table Kupci add primary key(NazivKupca);
ALTER table Racuni add primary key(BrojRac);
ALTER table ArtiklRacun  add primary key(BrojRac,NazivArtikla);


#dodavanje indexa

CREATE index KupciGradovi on Kupci(PostBr);
CREATE index RacuniKupci on Racuni(NazivKupca);
CREATE index ArtikliRac_Artikli on ArtiklRacun(NazivArtikla);
CREATE index ArtikliRac_Racuni on ArtiklRacun(BrojRac);

rename table AritiklRacun to ArtiklRacun;



#dodavanje vanjskih kljuceva i referencijalnog integriteta

ALTER table Kupci add constraint VK_grad
foreign key VK_grad(PostBr) references Grad(PostBr)
on DELETE restrict on UPDATE cascade;


ALTER table Racuni add constraint VK_kupci
foreign key VK_kupci(NazivKupca) references Kupci(NazivKupca)
on DELETE restrict on UPDATE cascade;

ALTER table ArtiklRacun  add constraint VK_artikli
foreign key VK_artikli(NazivArtikla) references Artikli(NazivArtikla)
on DELETE restrict on UPDATE cascade;

ALTER table ArtiklRacun  add constraint VK_racuni
foreign key VK_racuni(BrojRac) references Racuni(BrojRac)
on DELETE cascade on UPDATE cascade;



#Brisanje vanjskog ključa:

ALTER TABLE ime tablice DROP FOREIGN KEY ime ključa;


#punjenje podatcima

INSERT INTO Grad (PostBr, Grad) values 
(51000, 'Rijeka'),
(52000, 'Pula'), 
(10000, 'Zagreb'), 
(21000, 'Dubrovnik');

INSERT INTO Kupci (NazivKupca, AdresaKupca, PostBr, MatBr) VALUES
('Telekom', 'Jadranski trg 5', 51000, '11223344'), 
('Veleuciliste', 'Vukovarska 11', 10000, '3322115'), 
('3. Maj', 'Pulska 5', 51000, '987654');

INSERT INTO Artikli (NazivArtikla, JedinicaMjere) VALUES 
('Banane', 'Kg'),
('Televizija', 'Kom'), ('Zvakace', 'Pak'),
('Jabuke', 'Kg'), ('Fanta', 'Lit'),
('Kosulja', 'Kom');

INSERT INTO Racuni (BrojRac, NazivKupca, DatumRac, IspNaTemelj, DatumIsp, VrstaPlac) VALUES
(1, 'Veleuciliste', '20200315', 'Narudzbe', '20200320', 'Virmanom u roku'), 
(2, '3. Maj', '20200403', 'Upita', '20200403', 'Gotovinom');

INSERT INTO ArtiklRacun (BrojRac, NazivArtikla, Kolicina, Cijena) VALUES
(1, 'Banane', 15.5, 10), 
(1, 'Kosulja', 3, 150.2), 
(1, 'Jabuke', 7, 5.65),
(2, 'Televizija', 1, 1000), 
(2, 'Fanta', 3, 15.2), 
(2, 'Zvakace', 7, 5.65);


INSERT INTO Kupci (NazivKupca, AdresaKupca, PostBr, MatBr) VALUES
('INA', 'Naftna ulica', 21000, '11223344');

SELECT  * FROM Kupci;
SELECT * FROM Racuni;
SELECT * FROM Grad;
SELECT * FROM ArtiklRacun;

UPDATE Kupci SET MatBr='111111' WHERE NazivKupca='Telekom';

UPDATE Racuni SET DatumRac='20181124', VrstaPlac='American'
WHERE BrojRac=1;


#RI nad Upd:
UPDATE Grad SET PostBr=51500 WHERE PostBr=51000;
UPDATE Grad SET PostBr=51000 WHERE PostBr=51500;


#Racunanje sa postojecim podatcima i upis u nove stupce

UPDATE ArtiklRacun SET Iznos=Kolicina*Cijena WHERE BrojRac=1;
UPDATE ArtiklRacun SET Iznos=Kolicina*Cijena;

#brisanje nekog podatka koji se koristi kao FK nemoze se izvrsiti jer je postavljena ristrikcija
DELETE FROM Grad where Grad='Rijeka';


#mogucnost zadavanja i/ili logickih uvjeta u querry
DELETE FROM ArtiklRacun  WHERE BrojRac=1 AND NazivArtikla='Jabuka';

----------------------------------------------------------------------
#sve ovo spada u 2.kolokvi  




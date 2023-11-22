select NazivKupca, AdresaKupca from Kupci;
select * from Kupci;
SELECT MatBr from Kupci ;

SELECT DISTINCT PostBr from Kupci;

SELECT * from Kupci order by MatBr  desc ;

select * from ArtiklRacun order by cijena desc;
select * from ArtiklRacun order by cijena asc;
#sortianje po nekom atributu uzlazno ili silazno, sortiranje uvijek ide na kraj upita

select * from Kupci where PostBr=51000;
select * from Kupci where not PostBr!=51000;
select * from Kupci where not PostBr=51000;
#pretraga sa uijetom ili not uvijetom

select * from Kupci where PostBr=21000;

select * from ArtiklRacun where NazivArtikla='banane' or BrojRac=1;
select * from ArtiklRacun where NazivArtikla='banane' and BrojRac=1;
#moguce je dodavati dodatne logicke uvijete tipa and or

#count() sum() avg() min() max()   funkcije za racunaje sa podatcima

SELECT SUM(iznos) from ArtiklRacun where BrojRac =1;

#promjena naziva u prikazu sa - as naziv
SELECT SUM(iznos) as UkupanIznos from ArtiklRacun where BrojRac =1;

SELECT SUM(Kolicina*Cijena) from ArtiklRacun where BrojRac =1;

SELECT SUM(iznos) from ArtiklRacun where BrojRac =2;
SELECT SUM(iznos) from ArtiklRacun;

select MIN(cijena) from ArtiklRacun; 
select MAX(cijena) from ArtiklRacun; 

SELECT AVG(cijena) as prosjecnaCijena from ArtiklRacun; 
SELECT AVG(cijena*kolicina) as ProsjecnaCijenaUkupno from ArtiklRacun; 


select BrojRac, SUM(cijena*kolicina) as ukupno from ArtiklRacun group by BrojRac ; 
#grupiranje po nekom stupcu sa group by

SELECT count(NazivArtikla) from Artikli;
SELECT count(*) from Artikli;
#count probrojava redke u tablici


SELECT COUNT(*) FROM Artikli where JedinicaMjere ='kom'; 
SELECT COUNT(*) FROM Artikli where JedinicaMjere ='lit'; 
SELECT COUNT(*) FROM Artikli where JedinicaMjere ='pak'; 

select JedinicaMjere, COUNT(*) as BrojArtikla from Artikli group by JedinicaMjere; 
#grupiranje po jedinici mjere i broju komada sa tom jedinicom mjere

SELECT COUNT(DISTINCT JedinicaMjere) from Artikli ; 
#koliko je razlicitih jedinica mjere


SELECT BrojRac , MAX(iznos) as najveci,
MIN(iznos) as najmanji, SUM(iznos) as ukupno,
AVG(iznos) as prosjek from ArtiklRacun group by BrojRac;

SELECT * FROM Racuni where DatumRac='20200403';

INSERT into Artikli (NazivArtikla) values ('Lopta');

SELECT NazivArtikla from Artikli WHERE JedinicaMjere  is not null;
SELECT NazivArtikla from Artikli WHERE JedinicaMjere  is null;


SELECT *, Kolicina+10 from ArtiklRacun where BrojRac =2 order by Kolicina asc;


#po tome sto pise u zadatku treba zakljuciti koja je to tablica




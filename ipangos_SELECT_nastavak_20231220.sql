#naredba JOIN - spajanje podataka iz vise tablica i njihova pretraga - dohvacanje podataka iz dvije ili vise tablica
# left outer join, right outer join, inner join
# lijevi spoj, prvo uzima sve iz ljeve tablice potom dodaje podatke iz vanjske tablice
# spajaju se samo tablice koje imaju zajednicke atribiute (PK-FK)

select NazivKupca, Grad from Kupci left outer join Grad on Kupci.PostBr = Grad.PostBr order by NazivKupca asc;
#lijevo kupci, desno gradovi LOJ. kupci LOJ gradovi / gradovi ROJ kupci

select Grad, NazivKupca from Kupci right outer join Grad on Kupci.PostBr = Grad.PostBr order by NazivKupca desc;
#prvo iz desne tablice, pa iz ljeve. kod ispisa sada - lijevo gradovi, desno kupci ROJ. gradovi ROJ kupci / kupci LOJ gradovi

#ispisati NazivKupca:Veleuciliste i izracunati prosjecan iznos artikala koji su prodani veleucilistu
select NazivKupca, AVG(iznos) as ProsjecanIznos from Racuni 
left outer join ArtiklRacun on Racuni.BrojRac = ArtiklRacun.BrojRac  
where NazivKupca='Veleuciliste'; 

select NazivKupca, SUM(iznos) as SUMA from Racuni 
left outer join ArtiklRacun on Racuni.BrojRac = ArtiklRacun.BrojRac  
where NazivKupca='Veleuciliste'; 

#prikazati sve o artiklima koji nisu nikad prodani
select * from Artikli where NazivArtikla not in (select NazivArtikla from ArtiklRacun);
#ili
select Artikli.* from Artikli left outer join ArtiklRacun 
on ArtiklRacun.NazivArtikla = Artikli.NazivArtikla
where BrojRac is null;

#ovako je krivo jer ispisuje sve atribute iz obje spojene tablice, a trazi se samo iz jedne
select * from Artikli left outer join ArtiklRacun 
on ArtiklRacun.NazivArtikla = Artikli.NazivArtikla
where BrojRac is null; #ili is not null


#prikazati nazivkupca i koliko je zaradjeno po svakom kupcu i sortirati od najveceg prema najmanjem iznosu
select NazivKupca, sum(iznos) as UkupanIznos from Racuni 
left outer join ArtiklRacun on Racuni.BrojRac = ArtiklRacun.BrojRac  
group by NazivKupca order by UkupanIznos desc; 
#grupiranje ide nakon upita i funkcije, zadnje je sortiranje




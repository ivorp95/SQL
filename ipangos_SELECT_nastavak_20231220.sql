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



#prikazati broj racuna i ukupan iznos u razdoblju izmedju 01.11.2010 i 25.03.2023
select Racuni.BrojRac, sum(iznos) as UkupanIznos from ArtiklRacun 
left outer join Racuni on ArtiklRacun.BrojRac=Racuni.BrojRac
where DatumRac BETWEEN '20101101' and '20230325'
group by Racuni.BrojRac ;

#prikazati sve prodane artikle i njihovu jedinicu mjere sa racuna broj 1
select Artikli.*, BrojRac from ArtiklRacun left outer join Artikli
on ArtiklRacun.NazivArtikla=Artikli.NazivArtikla where BrojRac=1; 


############################################################################################################

#20240110 nastavak

#VIEW - pogled, tablica sastavljena od vise vanjskih (uvijek prikazuje azurirane podatke)

create view KupciRi as select NazivKupca, AdresaKupca from Kupci where PostBr=51000;
select * from KupciRi;

#izmjena podataka u view-u
create or replace view KupciRi as select NazivKupca, AdresaKupca, MatBr from Kupci where PostBr=51000;

#brisanje pogleda 
drop view KupciRi;


create view PopisKupaca as select NazivKupca, AdresaKupca, PostBr from Kupci;
select * from PopisKupaca ;
drop view PopisKupaca ;

create view PopisKupaca as select NazivKupca, AdresaKupca, Grad 
from Kupci left outer join Grad on Kupci.PostBr = Grad.PostBr;

#pogled koji prikazuje nazive artikala koji su prodani veleucilistu - ArtikliRacun, Racuni -- tablice
create view PopisArtikala as select NazivArtikla from ArtiklRacun 
left outer join Racuni on ArtiklRacun.BrojRac = Racuni.BrojRac where NazivKupca='Veleuciliste';

select * from PopisArtikala;


#pokazatii sve artikle s jedinicma mjere koji su prodani veleucilistu

select Artikli.* from Racuni left outer join ArtiklRacun on Racuni.BrojRac = ArtiklRacun.BrojRac 
left outer join Artikli on Artikli.NazivArtikla = ArtiklRacun.NazivArtikla where NazivKupca='Veleuciliste' 
order by Artikli.NazivArtikla asc;

#svi artikli koji nisu prodani veleucilistu !=   operator razlicitosti
select Artikli.* from Racuni left outer join ArtiklRacun on Racuni.BrojRac = ArtiklRacun.BrojRac 
left outer join Artikli on Artikli.NazivArtikla = ArtiklRacun.NazivArtikla where NazivKupca!='Veleuciliste' 
order by Artikli.NazivArtikla asc;

select * from ArtikiVeleri;


# sa distinct kazemo da prikazuje samo razlicite atribute 
select distinct Artikli.NazivArtikla, Artikli.JedinicaMjere  from Racuni left outer join ArtiklRacun on Racuni.BrojRac = ArtiklRacun.BrojRac 
left outer join Artikli on Artikli.NazivArtikla = ArtiklRacun.NazivArtikla where NazivKupca='Veleuciliste' 
order by Artikli.NazivArtikla asc;


# promjenom Left u Right ispisujemo sve artikle, isto kao promjena redosljeda kod LOJ
select Artikli.* from Racuni right outer join ArtiklRacun on Racuni.BrojRac = ArtiklRacun.BrojRac 
right outer join Artikli on Artikli.NazivArtikla = ArtiklRacun.NazivArtikla 
order by Artikli.NazivArtikla asc;


#prikazi sve o kupcima koji su kupili jabuke
select Kupci.* from Kupci left outer join Racuni on Kupci.NazivKupca = Racuni.NazivKupca 
left outer join ArtiklRacun on ArtiklRacun.BrojRac = Racuni.BrojRac where NazivArtikla ='jabuke';




############################################################################################################

#20240117 nastavak 2

#pokazati naziv kupca i koliko je novaca zaradjeno po svakom kupcu i toi od najveceg prema najmanjem iznosu

select NazivKupca, sum(Iznos) as UkupnaZarada from Racuni left outer join ArtiklRacun on
Racuni.BrojRac = ArtiklRacun.BrojRac group by NazivKupca order by UkupnaZarada desc;


#prosiriti upit i koliko je po svakom kupcu
select Kupci.NazivKupca , sum(Iznos) as UkupnaZarada from Kupci left outer join Racuni 
on Kupci.NazivKupca = Racuni.NazivKupca  left outer join ArtiklRacun 
on Racuni.BrojRac = ArtiklRacun.BrojRac 
group by Kupci.NazivKupca order by UkupnaZarada desc;


#zamjena left u right kako bi ispisali samo gradove u kojima ima zarade
select Grad.Grad , sum(Iznos) as UkupnaZarada from Grad right outer join Kupci 
on Kupci.PostBr=Grad.PostBr right outer join Racuni 
on Kupci.NazivKupca = Racuni.NazivKupca  right outer join ArtiklRacun 
on Racuni.BrojRac = ArtiklRacun.BrojRac 
group by Grad.Grad  order by UkupnaZarada desc;

#zamjena right u left da bi dobili sve gradove
select Grad.Grad , sum(Iznos) as UkupnaZarada from Grad left outer join Kupci 
on Kupci.PostBr=Grad.PostBr left outer join Racuni 
on Kupci.NazivKupca = Racuni.NazivKupca  left outer join ArtiklRacun 
on Racuni.BrojRac = ArtiklRacun.BrojRac 
group by Grad.Grad  order by UkupnaZarada desc;


#sve o kupcima koji su kupili jabuke
select Kupci.* from Kupci left outer join Racuni 
on Kupci.NazivKupca=Racuni.NazivKupca left outer join ArtiklRacun 
on ArtiklRacun.BrojRac=Racuni.BrojRac where NazivArtikla='Jabuke';


#broj racuna i naziv kupca za sve kupce iz zagreba
select Kupci.NazivKupca, Racuni.BrojRac  from Racuni right outer join Kupci 
on Racuni.NazivKupca = Kupci.NazivKupca right outer join Grad 
on  Grad.PostBr =Kupci.PostBr where Grad='Zagreb';

#prosiriti prosli upit sa ukupnim iznosom
select Racuni.BrojRac, Kupci.NazivKupca, sum(Iznos) as Zarada from Grad left outer join Kupci 
on Grad.PostBr=Kupci.PostBr left outer join Racuni 
on Racuni.NazivKupca =Kupci.NazivKupca left outer join ArtiklRacun 
on ArtiklRacun.BrojRac  =Racuni.BrojRac;

#############################################################################

#20240125 nastavak i TRIGGERI

# before trigger je za naredbe koje rade u istoj tablici
# after trigger je za naredbe koje rade na drugim tablicama a ovise o nekom unosu 


#Triger za insert u ArtiklRacun izracunava iznos 
create trigger B_I_ArtiklRacun before insert on ArtiklRacun for each row set new.Iznos=new.Kolicina*new.Cijena;

insert into ArtiklRacun(BrojRac,NazivArtikla,Kolicina, Cijena) values 
(2,'Kosulja',33,25);

delete from ArtiklRacun where NazivArtikla='Lopta';


#Trigger za update u ArtiklRacun
create trigger B_U_ArtiklRacun before update on ArtiklRacun for each row set new.Iznos=new.Kolicina*new.Cijena;




# after Trigger insert

delimiter |
|
create trigger A_I_ArtiklRacun after insert on ArtiklRacun for each row 

begin
	
	declare Local_UKiznos decimal(10.2);
	select sum(Iznos) into Local_UKiznos from ArtiklRacun where BrojRac=new.BrojRac;
	update Racuni set UKiznos=local_UKiznos where BrojRac=new.BrojRac;




end 
|
delimiter ;




insert into ArtiklRacun(BrojRac,NazivArtikla,Kolicina, Cijena) values 
(1,'Lopta',10,250);






# after Trigger update

delimiter |
|
create trigger A_U_ArtiklRacun after update on ArtiklRacun for each row 

begin
	
	declare Local_UKiznos decimal(10.2);
	select sum(Iznos) into Local_UKiznos from ArtiklRacun where BrojRac=new.BrojRac;
	update Racuni set UKiznos=local_UKiznos where BrojRac=new.BrojRac;




end 
|
delimiter ;




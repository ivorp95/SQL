
#ispisat ime skladistara za id narudzbe = 10

select Skladistar.Ime_skladistara from Narudzba 
left outer join Skladistar on Narudzba.ID_skladistara = Skladistar.ID_skladistara where ID_narudzbe = 10;



select distinct ime_skladistara from Skladistar;
select distinct Prezime_skladistara from Skladistar;


#Prikazati (uz pomoć naredbe Join) nazive artikala koje su naručili skladištari s prezimenima Babić ili Bilić. 
#Prebrojati i koliko je ukupno svakog od tih artikala naručeno. Taj podatak nazvati Ukupna_kolicina. 
#Podatke sortirati po nazivima artikala uzlazno.

select Artikl.Naziv_artikla, sum(Stavka_narudzbe.Kolicina_narucenog_artikla) as Ukupna_kolicina from Artikl left outer join 
Stavka_narudzbe on Artikl.ID_artikla = Stavka_narudzbe.ID_artikla left outer JOIN 
Narudzba on Stavka_narudzbe.ID_narudzbe = Narudzba.ID_narudzbe left outer join 
Skladistar on Narudzba.ID_skladistara = Skladistar.ID_skladistara 
where Prezime_skladistara = 'Bilic' or Prezime_skladistara = 'Babic' order by Naziv_artikla asc;

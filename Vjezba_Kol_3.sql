
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





#Napisati upit (koristeći join) kojim će se prikazati ID svih kreiranih narudžbi, 
#datumi narudžbi te podatak o ukupnoj količini naručenih artikala na svakoj narudžbi. 
#Posljednji podatak nazvati Ukupna_kolicina.

select Narudzba.ID_narudzbe, Narudzba.Datum_narudzbe, sum(Kolicina_narucenog_artikla) as Ukupna_kolicina
from Narudzba left outer join Stavka_narudzbe on Narudzba.ID_narudzbe = Stavka_narudzbe.ID_narudzbe 
group by Narudzba.ID_narudzbe;




#Uz pomoć upita "select unutar selecta" prikazati najveći ID artikla te njegov naziv i cijenu.

select max(ID_artikla), Naziv_artikla, Cijena_artikla 
from Artikl where Artikl.ID_artikla in (select max(ID_artikla) from Artikli );



#Uz pomoć naredbe Join prikazati sve o stavkama narudžbi koje je na narudžbe zapisao skladištar Marin Babić. 
#Podatke sortirati po količini naručenog artikla silazno.

select Skladistar.Ime_skladistara, Skladistar.Prezime_skladistara, Stavka_narudzbe.* from Skladistar 
left outer join Narudzba on Narudzba.ID_skladistara  = Skladistar.ID_skladistara
left outer join Stavka_narudzbe on Narudzba.ID_narudzbe = Stavka_narudzbe.ID_narudzbe 
where Skladistar.Ime_skladistara = 'Marin' and Skladistar.Prezime_skladistara = 'Babic'
order by Stavka_narudzbe.Kolicina_narucenog_artikla desc;

 
#Izraditi trigger koji će omogućiti da za svaku novo upisanu narudžbu u stupcu Poklon_bon piše: Nema.

create trigger B_I_Narudzba before insert on Narudzba for each row set new.Poklon_bon='Nema';



#Uz pomoć upita "select unutar selecta" pokazati sve o artiklima koji se nalaze na narudžbama izdanim 25.11.2022

select Artikl.* from Artikl where ID_artikla in (select ID_artikla from Stavka_narudzbe 
where ID_narudzbe in (select ID_narudzbe from Narudzba where Datum_narudzbe='20221125'));


#Uz pomoć upita "select unutar selecta" prikazati sve podatke o artiklima koji nisu na narudžbi s ID-om '10'.

select Artikl.* from Artikl where Artikl.ID_artikla 
in (select ID_artikla from Stavka_narudzbe where ID_narudzbe 
in (select ID_narudzbe from Narudzba where ID_narudzbe != 10) );

#sva prezimena skladistara
select Skladistar.Ime_skladistara from Skladistar ;

select unique Skladistar.Prezime_skladistara from Skladistar ;

select Skladistar.Ime_skladistara from Skladistar where Prezime_skladistara != 'Babic';









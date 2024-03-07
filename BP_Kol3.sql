select distinct Prezime_skladistara from Skladistar;

select * from Skladistar where Prezime_skladistara = 'Babic'; 


select max(Artikl.ID_artikla), Naziv_artikla, Cijena_artikla 
from Artikl where Artikl.ID_artikla in (select max(ID_artikla) from Artikli );

select Narudzba.ID_narudzbe, Narudzba.Datum_narudzbe, sum(Kolicina_narucenog_artikla) as Ukupna_kolicina
from Narudzba left outer join Stavka_narudzbe on Narudzba.ID_narudzbe = Stavka_narudzbe.ID_narudzbe 
group by Narudzba.ID_narudzbe;


select Artikl.* from Artikl where Artikl.ID_artikla in ( 
select ID_artikla from Stavka_narudzbe where ID_narudzbe in (
select ID_narudzbe from Narudzba where Narudzba.ID_narudzbe != 10));



create view Skladistari as select Skladistar.Ime_skladistara, Skladistar.Prezime_skladistara, Narudzba.ID_narudzbe 
from Skladistar left outer join Narudzba on Skladistar.ID_skladistara  = Narudzba.ID_skladistara 
order by Skladistar.Prezime_skladistara ;


select Stavka_narudzbe.* from Stavka_narudzbe left outer join 
Narudzba on Stavka_narudzbe.ID_narudzbe = Narudzba.ID_narudzbe left outer JOIN 
Skladistar on Narudzba.ID_skladistara = Skladistar.ID_skladistara 
where Skladistar.Ime_skladistara = 'Marin' and Skladistar.Prezime_skladistara ='Babic';


select Artikl.* from Artikl where ID_artikla in (select ID_artikla from Stavka_narudzbe 
where ID_narudzbe in (select ID_narudzbe from Narudzba where Datum_narudzbe='20221125'));
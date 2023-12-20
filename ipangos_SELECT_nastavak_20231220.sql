#naredba JOIN - spajanje podataka iz vise tablica i njihova pretraga - dohvacanje podataka iz dvije ili vise tablica
# left outer join, right outer join, inner join
# lijevi spoj, prvo uzima sve iz ljeve tablice potom dodaje podatke iz vanjske tablice
# spajaju se samo tablice koje imaju zajednicke atribiute (PK-FK)

select NazivKupca, Grad from Kupci left outer join Grad on Kupci.PostBr = Grad.PostBr order by NazivKupca asc;
#lijevo kupci, desno gradovi LOJ. kupci LOJ gradovi / gradovi ROJ kupci

select Grad, NazivKupca from Kupci right outer join Grad on Kupci.PostBr = Grad.PostBr order by NazivKupca desc;
#prvo iz desne tablice, pa iz ljeve. kod ispisa sada - lijevo gradovi, desno kupci ROJ. gradovi ROJ kupci / kupci LOJ gradovi






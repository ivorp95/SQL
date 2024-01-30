

CREATE TABLE Skladistar(
ID_skladistara numeric, 
Ime_skladistara varchar(24), 
Prezime_skladistara varchar(32), 
Odjel varchar(24));


CREATE TABLE Narudzba(
ID_narudzbe numeric, 
Datum_narudzbe date, 
ID_skladistara numeric, 
Poklon_bon varchar(56));


CREATE TABLE Stavka_narudzbe(
ID_narudzbe numeric, 
ID_artikla numeric, 
Kolicina_narucenog_artikla numeric);


CREATE TABLE Artikl(
ID_artikla numeric, 
Naziv_artikla varchar(32), 
Cijena_artikla decimal(8,2), 
Kolicina_artikla_u_skladistu numeric);

ALTER TABLE Skladistar ADD PRIMARY KEY(ID_skladistara);
ALTER TABLE Narudzba ADD PRIMARY KEY(ID_narudzbe);
ALTER TABLE Stavka_narudzbe ADD PRIMARY KEY(ID_narudzbe, ID_artikla);
ALTER TABLE Artikl ADD PRIMARY KEY(ID_artikla);

ALTER TABLE Narudzba ADD CONSTRAINT V_skladistar FOREIGN KEY V_skladistar(ID_skladistara) REFERENCES Skladistar(ID_skladistara) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE Stavka_narudzbe ADD CONSTRAINT V_narudzba FOREIGN KEY V_narudzba(ID_narudzbe) REFERENCES Narudzba(ID_narudzbe) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE Stavka_narudzbe ADD CONSTRAINT V_artikl FOREIGN KEY V_artikl(ID_artikla) REFERENCES Artikl(ID_artikla) ON DELETE RESTRICT ON UPDATE CASCADE;

INSERT INTO Skladistar(ID_skladistara, Ime_skladistara, Prezime_skladistara, Odjel) VALUES 
(1,'Marin','Babic','tehnika'), 
(2,'Ana','Babic','keramika'), 
(3,'Ivan','Horvat','drvenarija'), 
(4,'Petra','Bilic','sanitarije');

INSERT INTO Narudzba(ID_narudzbe,Datum_narudzbe, ID_skladistara) VALUES 
(10,'20221125',1), 
(11,'20221130',2), 
(12,'20221201',2), 
(13,'20221220',4);

INSERT INTO Artikl (ID_artikla, Naziv_artikla, Cijena_artikla, Kolicina_artikla_u_skladistu) VALUES 
(111, 'laptop', 5000.00, 100), 
(222, 'tipkovnica', 400.50, 250), 
(333, 'monitor', 3500.00, 50), 
(444, 'printer', 1000.00, 115);

INSERT INTO Stavka_narudzbe (ID_narudzbe, ID_artikla, Kolicina_narucenog_artikla) VALUES 
(10,222,5), 
(10,444,2), 
(12,333,8), 
(11,111,5), 
(13,111,6);


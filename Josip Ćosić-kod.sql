create table knjiznica (
	naziv varchar (40) NOT NULL,
	grad varchar (20) NOT NULL,
	adresa varchar (25) NOT NULL,
  	  
PRIMARY KEY (naziv)
);
insert into knjiznica
       values( 'Gradska knji�nica Vinkovci', 'Vinkovci', 'Ulica bra�e Radi� 58');
         insert into knjiznica
       values( 'Gradska knji�nica Zagreb', 'Zagreb', 'Ilica 25');
         insert into knjiznica
       values( 'Gradska knji�nica i �itaonica Pula', 'Pula', 'Zagreba�ka ulica 31');
         insert into knjiznica
       values( 'Gradska knji�nica Osijek', 'Osijek', 'Vukovarska ulica 2');
         insert into knjiznica
       values( 'Gradska knji�nica Split', 'Split', 'Rije�ka ulica 78');

create table odjel (
	broj_odjela number (2) NOT NULL,
	broj_telefona number (10) NOT NULL,
	fax varchar (10) NOT NULL,
  
  naziv varchar (40) NOT NULL,
  	  
PRIMARY KEY (broj_odjela)
);
insert into odjel
       values( 1, 01589741, 01589741, 'Gradska knji�nica Vinkovci');
         insert into odjel
       values( 2, 032587456, 032587456, 'Gradska knji�nica Zagreb');
         insert into odjel
       values( 3, 031693412, 031693412, 'Gradska knji�nica i �itaonica Pula');
         insert into odjel
       values( 4, 052998745, 052998745, 'Gradska knji�nica Osijek');
         insert into odjel
       values( 5, 031741458, 031741458, 'Gradska knji�nica Split');

create table knjiznicar (
	oib number (11) NOT NULL,
	ime varchar (15) NOT NULL,
	prezime varchar (15) NOT NULL,
  
  naziv varchar (40) NOT NULL,
  	  
PRIMARY KEY (oib)
);
insert into knjiznicar
       values( 05105845547, 'Kristina', 'Horvat', 'Gradska knji�nica Vinkovci');
         insert into knjiznicar
       values( 09085478536, 'Tanja', 'Mari�', 'Gradska knji�nica Zagreb');
         insert into knjiznicar
       values( 05105896227, 'Jasminka', 'Babi�', 'Gradska knji�nica i �itaonica Pula'); 
         insert into knjiznicar
       values( 08105896337, 'Klara', 'Marki�', 'Gradska knji�nica Osijek');
         insert into knjiznicar
       values( 08105877547, 'Marko', 'Kreli�', 'Gradska knji�nica Split');
create table knjiga (
	sifra_knjige number (10) NOT NULL,
	naziv varchar (25) NOT NULL,
	autor varchar (25) NOT NULL,
	ime_izdavaca varchar (25) NOT NULL, 
  mjesto_izdavanja varchar (10) NOT NULL,
  
  broj_odjela number (2) NOT NULL,
  	  
PRIMARY KEY (sifra_knjige)
);
insert into knjiga
       values( 356852, 'Bra�ni zaplet', 'Jeffrey Eugenides', 'V.B.Z. d.o.o.', 'Zagreb', 1);
         insert into knjiga
       values( 458721,'Krug', 'Dave Eggers', 'Vukovi� i Runji�', 'Zagreb', 2);
         insert into knjiga
       values( 558963, 'Hladna magija', 'Kate Elliott', 'Lumen', 'Zagreb', 3);
         insert into knjiga
       values( 128745, 'Javne tajne', 'Alice Munro', 'OceanMore', 'Zagreb', 4);
         insert into knjiga
       values( 587986, 'Knjiga mojih �ivota', 'Aleksandar Hemon', 'BuyBook', 'Sarajevo', 5);
create table korisnik (
	br_clan_iskaznice number (10) NOT NULL,
	ime varchar (15) NOT NULL,
	prezime varchar (15) NOT NULL,
	adresa varchar (25) NOT NULL, 
  br_posudenih_knjiga number (2) NOT NULL,
  	  
PRIMARY KEY (br_clan_iskaznice)
);
insert into korisnik
       values( 4586987, 'Josipa', 'Kunjo�', 'Petrinjska 25', 5);
         insert into korisnik
       values( 5543214, 'Dora', 'Peri�', 'Vukovarska ulica 1', 8);
         insert into korisnik
       values( 4568793, 'Borna', 'Peto�', 'Jankovi�eva ulica 4', 1);
         insert into korisnik
       values( 1236547, 'Ivan', 'Teri�', 'Ulica Zrinske gore 25', 22);
         insert into korisnik
       values( 658965, 'Gabriel', 'Sebasti�', 'Bosutska ulica 56', 25);

create table posudba (
	sifra_knjige number (10) NOT NULL,
  br_clan_iskaznice number (10) NOT NULL,
  dan date NOT NULL,
	
PRIMARY KEY (sifra_knjige)
);
insert into posudba
       values( 356852, 4586987, DATE '2017-4-21');
         insert into posudba
       values( 458721, 5543214, DATE '2016-1-21');
         insert into posudba
       values( 558963, 4568793, DATE '2017-2-15');
         insert into posudba
       values( 128745, 1236547, DATE '2016-2-16');
         insert into posudba
       values( 587986, 658965, DATE '2017-3-15');
ALTER TABLE knjiznicar
ADD FOREIGN KEY (naziv) REFERENCES knjiznica(naziv);

ALTER TABLE odjel
ADD FOREIGN KEY (naziv) REFERENCES knjiznica(naziv);

ALTER TABLE knjiga
ADD FOREIGN KEY (broj_odjela) REFERENCES odjel(broj_odjela);

ALTER TABLE posudba
ADD FOREIGN KEY (br_clan_iskaznice) REFERENCES korisnik(br_clan_iskaznice);

select * from knjiznica;  
select * from odjel;
select * from knjiznicar;
select * from knjiga;
select * from korisnik;
select * from posudba;

select br_clan_iskaznice ,ime, prezime from korisnik where br_clan_iskaznice>5000000;

select br_clan_iskaznice ,ime, prezime, br_posudenih_knjiga from korisnik where br_posudenih_knjiga between 5 and 8;

select avg(br_posudenih_knjiga) as prosjecni_br_posudenih_knjiga from korisnik;

select ime, prezime, naziv, grad, adresa from knjiznica natural join knjiznicar where ime = 'Jasminka';
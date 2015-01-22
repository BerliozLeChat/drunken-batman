/*
Auteurs : François Hallereau & Alexis Giraudet
Date : 22 janvier 2015
Licence 3 informatique
Université de Nantes
*/

--Destruction des tables 
drop table ACHATS;
drop table AVIS;
drop table LIVRES;
drop table CLIENTS;


--Création des tables
create table CLIENTS(
  idcl integer primary key not null,
  nom varchar2(20),
  pren varchar2(15),
  adr varchar2(30),
  tel varchar2(12)
);

create table LIVRES(
  refl varchar2(10) primary key not null,
  titre varchar2(50), 
  auteur varchar2(20), 
  genre varchar2(15)
);

create table ACHATS(
  idcl integer not null, 
  refl varchar2(10), 
  dateachat date primary key not null
);

create table AVIS(
  idcl integer not null, 
  refl varchar2(10), 
  note number(4,2), 
  commentaire varchar2(50)
);

--Ajout des clés étrangères
alter table AVIS 
add foreign key (idcl)
references CLIENTS(idcl);

alter table ACHATS 
add foreign key (idcl)
references CLIENTS(idcl);

alter table ACHATS 
add foreign key (refl)
references LIVRES(refl);

-- insertions

--Table Clients
insert into CLIENTS
values (1,'dupont','jean','somewhere',66666666);

insert into CLIENTS
values (2,'dupond','michel','somewhere',66666666);

insert into CLIENTS
values (3,'blop','jacques','somewhere',66666666);

insert into CLIENTS
values (4,'blup','dédé','somewhere',66666666);

--Table Livres
insert into LIVRES
values ('4589632587','Fifty Shades of grey','E.L.James','Erotique');

insert into LIVRES
values ('4589632588','Fifty Shades Darker','E.L.James','Erotique');

insert into LIVRES
values ('4589632589','Fifty Shades Freed','E.L.James','Erotique');

--Table Achats
insert into ACHATS
values (2,'4589632587','14-02-2009');

insert into ACHATS
values (2,'4589632588','15-02-2009');

insert into ACHATS
values (2,'4589632589','16-02-2009');

insert into ACHATS
values (4,'4589632589','16-12-2009');

--Table Avis
insert into AVIS
values (2,'4589632588',99.99,'Cool, cool cool cool');

insert into AVIS
values (4,'4589632588',18,null);


--------Les requêtes---------------------------

--1/ Les meilleures ventes : les livres (titre, auteur, genre) qui ont été achetés
-- en plus de 10000 exemplaires.
 select titre, auteur, genre from livres where 
 (select count(refl) from achats where refl = livres.refl)>=10000;
---------------------------------------------------------------------------------

--2/Les livres qui obtiennent une note moyenne supérieure à 16.
 select titre, auteur, genre from livres natural join avis
group by refl having sum(note)/(select count(refl) from avis)>=16;
---------------------------------------------------------------------------------

--3/Les clients qui n'ont pas renseigné l'attribut commentaire d'un livre
-- (quel client, livre, note).
select nom, pren, titre, note from clients,livres, avis where
commentaire = null;
 
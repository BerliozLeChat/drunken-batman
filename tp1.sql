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
  titre varchar2(20), 
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
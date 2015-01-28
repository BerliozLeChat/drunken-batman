/*
Auteurs : François Hallereau & Alexis Giraudet
Date : 22 janvier 2015
Licence 3 informatique
Université de Nantes
*/

/*
drop table Clients cascade constraints;
drop table Livres cascade constraints;
drop table Achats cascade constraints;
drop table Avis cascade constraints;
*/

-- Déclaration
create table Clients ( idcl number       not null,
                       nom  varchar2(20) not null,
                       pren varchar2(15) not null,
                       adr  varchar2(30) not null,
                       tel  varchar2(12) not null,
                     primary key (idcl) );

create table Livres ( refl   varchar2(10) not null,
                      titre  varchar2(20) not null,
                      auteur varchar2(20) not null,
                      genre  varchar2(15) not null,
                    primary key (refl) );

create table Achats ( idcl      number       not null,
                      refl      varchar2(10) not null,
                      dateachat date         not null,
                    primary key (idcl, refl, dateachat),
                    foreign key (idcl) references Clients,
                    foreign key (refl) references Livres );

alter table Achats
add constraint check_date_achats
check ( dateachat between to_date('01-01-2008', 'dd-mm-yyyy') and to_date('31-12-2013', 'dd-mm-yyyy') );

create table Avis ( idcl number       not null,
                    refl varchar2(10) not null,
                    note number(4,2)  not null,
                    commentaire varchar2(50),
                  primary key (idcl, refl),
                  foreign key (idcl) references Clients,
                  foreign key (refl) references Livres );

-- Insertion
insert into Clients values (0, 'nom0', 'pren0', 'adr0', 'tel0');
insert into Clients values (1, 'nom1', 'pren1', 'adr1', 'tel1');
insert into Clients values (2, 'nom2', 'pren2', 'adr2', 'tel2');
insert into Clients values (3, 'nom3', 'pren3', 'adr3', 'tel3');
insert into Clients values (4, 'nom4', 'pren4', 'adr4', 'tel4');
insert into Clients values (5, 'nom5', 'pren5', 'adr5', 'tel5');
insert into Clients values (6, 'nom6', 'pren6', 'adr6', 'tel6');
insert into Clients values (7, 'nom7', 'pren7', 'adr7', 'tel7');
insert into Clients values (8, 'nom8', 'pren8', 'adr8', 'tel8');
insert into Clients values (9, 'nom9', 'pren9', 'adr9', 'tel9');

insert into Livres values ('refl0', 'titre0', 'auteur0', 'genre0');
insert into Livres values ('refl1', 'titre1', 'auteur1', 'genre1');
insert into Livres values ('refl2', 'titre2', 'auteur2', 'genre2');
insert into Livres values ('refl3', 'titre3', 'auteur3', 'genre3');
insert into Livres values ('refl4', 'titre4', 'auteur4', 'genre4');
insert into Livres values ('refl5', 'titre5', 'auteur5', 'genre5');
insert into Livres values ('refl6', 'titre6', 'auteur6', 'genre6');
insert into Livres values ('refl7', 'titre7', 'auteur7', 'genre7');
insert into Livres values ('refl8', 'titre8', 'auteur8', 'genre8');
insert into Livres values ('refl9', 'titre9', 'auteur9', 'genre9');

insert into Achats values (0, 'refl0', to_date('02-01-2008', 'dd-mm-yyyy') );
insert into Achats values (0, 'refl1', to_date('02-01-2008', 'dd-mm-yyyy') );
insert into Achats values (0, 'refl2', to_date('02-01-2008', 'dd-mm-yyyy') );
insert into Achats values (0, 'refl3', to_date('02-01-2008', 'dd-mm-yyyy') );
insert into Achats values (0, 'refl4', to_date('02-01-2008', 'dd-mm-yyyy') );
insert into Achats values (1, 'refl5', to_date('02-01-2008', 'dd-mm-yyyy') );
insert into Achats values (1, 'refl6', to_date('02-01-2008', 'dd-mm-yyyy') );
insert into Achats values (1, 'refl7', to_date('02-01-2008', 'dd-mm-yyyy') );
insert into Achats values (1, 'refl8', to_date('02-01-2008', 'dd-mm-yyyy') );
--insert into Achats values (1, 'refl9', current_date); -- Erreur: viol la contrainte check_date_achats

insert into Avis values (0, 'refl0' ,15 , null);
insert into Avis values (0, 'refl1' ,16 , 'commentaire1');
insert into Avis values (0, 'refl2' ,17 , null);
insert into Avis values (0, 'refl3' ,18 , 'commentaire3');
insert into Avis values (0, 'refl4' ,10 , null);
--insert into Avis values (0, 'refl9' ,15 , null); -- Erreur: Livre non acheté

-- Extractcion
-- 1. Les meilleures ventes : les livres (titre, auteur, genre) qui ont été achetés en plus de 10000 exemplaires.
select titre, auteur, genre
from Livres livre
where ( select count(refl)
        from Achats
        where refl = livre.refl ) > 10000;

--2. Les livres qui obtiennent une note moyenne supérieure à 16.
select refl, note
from Livres natural join Avis
group by refl, note
having sum(note)/count(refl) > 16;

--3. Les clients qui n'ont pas renseigné l'attribut commentaire d'un livre (quel client, livre, note).
select *
from Clients natural join Avis
where commentaire is null;

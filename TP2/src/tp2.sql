/*
Auteurs : François Hallereau & Alexis Giraudet
Date : 29 janvier 2015
Licence 3 informatique
Université de Nantes
*/


--Création d'une séquence
create sequence seqClients start with 20 increment by 1 ;
insert into Clients values(seqClients.nextval, 'toto','titi','adr', 'tel') ;




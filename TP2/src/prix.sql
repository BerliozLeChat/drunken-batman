/*
Auteurs : François Hallereau & Alexis Giraudet
Date : 29 janvier 2015
Licence 3 informatique
Université de Nantes
*/

-- Modification de la table achat
alter table Achats add prix number;

-- Ajouts des prix manquants dans la table Achats 
update Achats set prix = 10
where refl = 'refl0' and idcl = 0;

update Achats set prix = 10
where refl = 'refl1' and idcl = 0;

update Achats set prix = 10
where refl = 'refl2' and idcl = 0;

update Achats set prix = 10
where refl = 'refl3' and idcl = 0;

update Achats set prix = 10
where refl = 'refl4' and idcl = 0;

update Achats set prix = 10
where refl = 'refl5' and idcl = 1;

update Achats set prix = 10
where refl = 'refl6' and idcl = 1;

update Achats set prix = 10
where refl = 'refl7' and idcl = 1;

update Achats set prix = 10
where refl = 'refl8' and idcl = 1;
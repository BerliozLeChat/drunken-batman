/*
Auteurs : François Hallereau & Alexis Giraudet
Date : 29 janvier 2015
Licence 3 informatique
Université de Nantes
*/

SET ECHO OFF
SPOOL effacer.sql
SET ECHO OFF
SET FEEDBACK OFF
SET HEADING OFF
SET PAGESIZE 0
SELECT 'DELETE FROM ' || table_name || ';' FROM USER_TABLES ;
SPOOL OFF
SET ECHO ON

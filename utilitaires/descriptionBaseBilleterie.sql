-- ============================================================================
-- Fichier          : descriptionBaseBilleterie.sql
-- Auteur(s)        : Maxime LAFARIE
-- Auteur(s)		    : Nicolas DOUSSON
-- Date             : 07/01/14
-- role 			      : Requete d'affichage des contraintes associées aux relations.
-- base 			      : BILLETERIE
-- projet 			    : BILLETERIE
-- Fichier resultat : descriptionBaseBilleterie.out
-- ============================================================================

SPOOL descriptionBaseBilleterie.out

--Amelioration de l'affichage
COLUMN CCOLUMN FORMAT A15;
COLUMN COND FORMAT A30;
COLUMN RCOLUMN FORMAT A15;
COLUMN RTABLE FORMAT A15;
COLUMN CNAME FORMAT A25;

PROMPT Affichage des contraintes associees au schema
-- Requete qui affiche les contraintes associees au schema
SELECT CONSTRAINT_TYPE AS CTYPE, CONSTRAINT_NAME AS CNAME, TABLE_NAME AS CTABLE
FROM USER_CONSTRAINTS;

PROMPT ####################################################
PROMPT ################# Relation CLIENT ##################
PROMPT ####################################################
PROMPT

PROMPT Affichage de la liste des attributs de la relation CLIENT
-- Requete qui affiche la liste des attributs de la relation CLIENT
DESC CLIENT;


PROMPT Affichage de la liste des clés primaires et uniques pour la relation CLIENT
-- Requete qui affiche la liste des clés primaires et uniques pour la relation CLIENT

SELECT CONSTRAINT_TYPE AS CTYPE, C.CONSTRAINT_NAME AS CNAME, CC.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS C, USER_CONS_COLUMNS CC
WHERE C.CONSTRAINT_TYPE IN ('P', 'U')
AND C.TABLE_NAME = 'CLIENT'
AND C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME
AND C.TABLE_NAME = CC.TABLE_NAME
AND C.OWNER = CC.OWNER;


PROMPT Affichage la liste des clés étrangères pour la relation CLIENT
-- Requete qui affiche la liste des clés étrangères pour la relation CLIENT

SELECT CONSTRAINT_TYPE AS CTYPE, C.CONSTRAINT_NAME AS CNAME, CC.COLUMN_NAME AS CCOLUMN, CC2.TABLE_NAME AS RTABLE, CC2.COLUMN_NAME AS RCOLUMN
FROM USER_CONSTRAINTS C, USER_CONS_COLUMNS CC, USER_CONS_COLUMNS CC2
WHERE C.CONSTRAINT_TYPE = 'R'
AND C.TABLE_NAME = 'CLIENT'
AND C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME
AND C.TABLE_NAME = CC.TABLE_NAME
AND C.OWNER = CC.OWNER
AND C.R_CONSTRAINT_NAME = CC2.CONSTRAINT_NAME;


PROMPT Affichage la liste des contraintes de CHECK pour la relation CLIENT
-- Requete qui affiche la liste des contraintes de CHECK pour la relation CLIENT

SELECT CONSTRAINT_TYPE AS CTYPE, C.CONSTRAINT_NAME AS CNAME, C.SEARCH_CONDITION AS COND, CC.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS C, USER_CONS_COLUMNS CC
WHERE C.CONSTRAINT_TYPE = 'C'
AND C.TABLE_NAME = 'CLIENT'
AND C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME
AND C.TABLE_NAME = CC.TABLE_NAME
AND C.OWNER = CC.OWNER;



PROMPT ####################################################
PROMPT ################# Relation BILLET ##################
PROMPT ####################################################
PROMPT

PROMPT Affichage de la liste des attributs de la relation BILLET
-- Requete qui affiche la liste des attributs de la relation BILLET
DESC BILLET;


PROMPT Affichage de la liste des clés primaires et uniques pour la relation BILLET
-- Requete qui affiche la liste des clés primaires et uniques pour la relation BILLET

SELECT CONSTRAINT_TYPE AS CTYPE, C.CONSTRAINT_NAME AS CNAME, CC.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS C, USER_CONS_COLUMNS CC
WHERE C.CONSTRAINT_TYPE IN ('P', 'U')
AND C.TABLE_NAME = 'BILLET'
AND C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME
AND C.TABLE_NAME = CC.TABLE_NAME
AND C.OWNER = CC.OWNER;


PROMPT Affichage la liste des clés étrangères pour la relation BILLET
-- Requete qui affiche la liste des clés étrangères pour la relation BILLET

SELECT CONSTRAINT_TYPE AS CTYPE, C.CONSTRAINT_NAME AS CNAME, CC.COLUMN_NAME AS CCOLUMN, CC2.TABLE_NAME AS RTABLE, CC2.COLUMN_NAME AS RCOLUMN
FROM USER_CONSTRAINTS C, USER_CONS_COLUMNS CC, USER_CONS_COLUMNS CC2
WHERE C.CONSTRAINT_TYPE = 'R'
AND C.TABLE_NAME = 'BILLET'
AND C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME
AND C.TABLE_NAME = CC.TABLE_NAME
AND C.OWNER = CC.OWNER
AND C.R_CONSTRAINT_NAME = CC2.CONSTRAINT_NAME;


PROMPT Affichage la liste des contraintes de CHECK pour la relation BILLET
-- Requete qui affiche la liste des contraintes de CHECK pour la relation BILLET

SELECT CONSTRAINT_TYPE AS CTYPE, C.CONSTRAINT_NAME AS CNAME, C.SEARCH_CONDITION AS COND, CC.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS C, USER_CONS_COLUMNS CC
WHERE C.CONSTRAINT_TYPE = 'C'
AND C.TABLE_NAME = 'BILLET'
AND C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME
AND C.TABLE_NAME = CC.TABLE_NAME
AND C.OWNER = CC.OWNER;



PROMPT ####################################################
PROMPT ############### Relation EVENEMENT #################
PROMPT ####################################################
PROMPT

PROMPT Affichage de la liste des attributs de la relation EVENEMENT
-- Requete qui affiche la liste des attributs de la relation EVENEMENT
DESC EVENEMENT;


PROMPT Affichage de la liste des clés primaires et uniques pour la relation EVENEMENT
-- Requete qui affiche la liste des clés primaires et uniques pour la relation EVENEMENT

SELECT CONSTRAINT_TYPE AS CTYPE, C.CONSTRAINT_NAME AS CNAME, CC.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS C, USER_CONS_COLUMNS CC
WHERE C.CONSTRAINT_TYPE IN ('P', 'U')
AND C.TABLE_NAME = 'EVENEMENT'
AND C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME
AND C.TABLE_NAME = CC.TABLE_NAME
AND C.OWNER = CC.OWNER;


PROMPT Affichage la liste des clés étrangères pour la relation EVENEMENT
-- Requete qui affiche la liste des clés étrangères pour la relation EVENEMENT

SELECT CONSTRAINT_TYPE AS CTYPE, C.CONSTRAINT_NAME AS CNAME, CC.COLUMN_NAME AS CCOLUMN, CC2.TABLE_NAME AS RTABLE, CC2.COLUMN_NAME AS RCOLUMN
FROM USER_CONSTRAINTS C, USER_CONS_COLUMNS CC, USER_CONS_COLUMNS CC2
WHERE C.CONSTRAINT_TYPE = 'R'
AND C.TABLE_NAME = 'EVENEMENT'
AND C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME
AND C.TABLE_NAME = CC.TABLE_NAME
AND C.OWNER = CC.OWNER
AND C.R_CONSTRAINT_NAME = CC2.CONSTRAINT_NAME;


PROMPT Affichage la liste des contraintes de CHECK pour la relation EVENEMENT
-- Requete qui affiche la liste des contraintes de CHECK pour la relation EVENEMENT

SELECT CONSTRAINT_TYPE AS CTYPE, C.CONSTRAINT_NAME AS CNAME, C.SEARCH_CONDITION AS COND, CC.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS C, USER_CONS_COLUMNS CC
WHERE C.CONSTRAINT_TYPE = 'C'
AND C.TABLE_NAME = 'EVENEMENT'
AND C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME
AND C.TABLE_NAME = CC.TABLE_NAME
AND C.OWNER = CC.OWNER;



PROMPT ####################################################
PROMPT ################# Relation SALLE ###################
PROMPT ####################################################
PROMPT

PROMPT Affichage de la liste des attributs de la relation SALLE
-- Requete qui affiche la liste des attributs de la relation SALLE
DESC SALLE;


PROMPT Affichage de la liste des clés primaires et uniques pour la relation SALLE
-- Requete qui affiche la liste des clés primaires et uniques pour la relation SALLE

SELECT CONSTRAINT_TYPE AS CTYPE, C.CONSTRAINT_NAME AS CNAME, CC.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS C, USER_CONS_COLUMNS CC
WHERE C.CONSTRAINT_TYPE IN ('P', 'U')
AND C.TABLE_NAME = 'SALLE'
AND C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME
AND C.TABLE_NAME = CC.TABLE_NAME
AND C.OWNER = CC.OWNER;


PROMPT Affichage la liste des clés étrangères pour la relation SALLE
-- Requete qui affiche la liste des clés étrangères pour la relation SALLE

SELECT CONSTRAINT_TYPE AS CTYPE, C.CONSTRAINT_NAME AS CNAME, CC.COLUMN_NAME AS CCOLUMN, CC2.TABLE_NAME AS RTABLE, CC2.COLUMN_NAME AS RCOLUMN
FROM USER_CONSTRAINTS C, USER_CONS_COLUMNS CC, USER_CONS_COLUMNS CC2
WHERE C.CONSTRAINT_TYPE = 'R'
AND C.TABLE_NAME = 'SALLE'
AND C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME
AND C.TABLE_NAME = CC.TABLE_NAME
AND C.OWNER = CC.OWNER
AND C.R_CONSTRAINT_NAME = CC2.CONSTRAINT_NAME;


PROMPT Affichage la liste des contraintes de CHECK pour la relation SALLE
-- Requete qui affiche la liste des contraintes de CHECK pour la relation SALLE

SELECT CONSTRAINT_TYPE AS CTYPE, C.CONSTRAINT_NAME AS CNAME, C.SEARCH_CONDITION AS COND, CC.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS C, USER_CONS_COLUMNS CC
WHERE C.CONSTRAINT_TYPE = 'C'
AND C.TABLE_NAME = 'SALLE'
AND C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME
AND C.TABLE_NAME = CC.TABLE_NAME
AND C.OWNER = CC.OWNER;



PROMPT ####################################################
PROMPT ################# Relation TARIF ###################
PROMPT ####################################################
PROMPT

PROMPT Affichage de la liste des attributs de la relation TARIF
-- Requete qui affiche la liste des attributs de la relation TARIF
DESC TARIF;


PROMPT Affichage de la liste des clés primaires et uniques pour la relation TARIF
-- Requete qui affiche la liste des clés primaires et uniques pour la relation TARIF

SELECT CONSTRAINT_TYPE AS CTYPE, C.CONSTRAINT_NAME AS CNAME, CC.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS C, USER_CONS_COLUMNS CC
WHERE C.CONSTRAINT_TYPE IN ('P', 'U')
AND C.TABLE_NAME = 'TARIF'
AND C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME
AND C.TABLE_NAME = CC.TABLE_NAME
AND C.OWNER = CC.OWNER;


PROMPT Affichage la liste des clés étrangères pour la relation TARIF
-- Requete qui affiche la liste des clés étrangères pour la relation TARIF

SELECT CONSTRAINT_TYPE AS CTYPE, C.CONSTRAINT_NAME AS CNAME, CC.COLUMN_NAME AS CCOLUMN, CC2.TABLE_NAME AS RTABLE, CC2.COLUMN_NAME AS RCOLUMN
FROM USER_CONSTRAINTS C, USER_CONS_COLUMNS CC, USER_CONS_COLUMNS CC2
WHERE C.CONSTRAINT_TYPE = 'R'
AND C.TABLE_NAME = 'TARIF'
AND C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME
AND C.TABLE_NAME = CC.TABLE_NAME
AND C.OWNER = CC.OWNER
AND C.R_CONSTRAINT_NAME = CC2.CONSTRAINT_NAME;


PROMPT Affichage la liste des contraintes de CHECK pour la relation TARIF
-- Requete qui affiche la liste des contraintes de CHECK pour la relation TARIF

SELECT CONSTRAINT_TYPE AS CTYPE, C.CONSTRAINT_NAME AS CNAME, C.SEARCH_CONDITION AS COND, CC.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS C, USER_CONS_COLUMNS CC
WHERE C.CONSTRAINT_TYPE = 'C'
AND C.TABLE_NAME = 'TARIF'
AND C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME
AND C.TABLE_NAME = CC.TABLE_NAME
AND C.OWNER = CC.OWNER;



PROMPT ####################################################
PROMPT ################ Relation SITERESA #################
PROMPT ####################################################
PROMPT

PROMPT Affichage de la liste des attributs de la relation SITERESA
-- Requete qui affiche la liste des attributs de la relation SITERESA
DESC SITERESA;


PROMPT Affichage de la liste des clés primaires et uniques pour la relation SITERESA
-- Requete qui affiche la liste des clés primaires et uniques pour la relation SITERESA

SELECT CONSTRAINT_TYPE AS CTYPE, C.CONSTRAINT_NAME AS CNAME, CC.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS C, USER_CONS_COLUMNS CC
WHERE C.CONSTRAINT_TYPE IN ('P', 'U')
AND C.TABLE_NAME = 'SITERESA'
AND C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME
AND C.TABLE_NAME = CC.TABLE_NAME
AND C.OWNER = CC.OWNER;


PROMPT Affichage la liste des clés étrangères pour la relation SITERESA
-- Requete qui affiche la liste des clés étrangères pour la relation SITERESA

SELECT CONSTRAINT_TYPE AS CTYPE, C.CONSTRAINT_NAME AS CNAME, CC.COLUMN_NAME AS CCOLUMN, CC2.TABLE_NAME AS RTABLE, CC2.COLUMN_NAME AS RCOLUMN
FROM USER_CONSTRAINTS C, USER_CONS_COLUMNS CC, USER_CONS_COLUMNS CC2
WHERE C.CONSTRAINT_TYPE = 'R'
AND C.TABLE_NAME = 'SITERESA'
AND C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME
AND C.TABLE_NAME = CC.TABLE_NAME
AND C.OWNER = CC.OWNER
AND C.R_CONSTRAINT_NAME = CC2.CONSTRAINT_NAME;


PROMPT Affichage la liste des contraintes de CHECK pour la relation SITERESA
-- Requete qui affiche la liste des contraintes de CHECK pour la relation SITERESA

SELECT CONSTRAINT_TYPE AS CTYPE, C.CONSTRAINT_NAME AS CNAME, C.SEARCH_CONDITION AS COND, CC.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS C, USER_CONS_COLUMNS CC
WHERE C.CONSTRAINT_TYPE = 'C'
AND C.TABLE_NAME = 'SITERESA'
AND C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME
AND C.TABLE_NAME = CC.TABLE_NAME
AND C.OWNER = CC.OWNER;



SPOOL OFF

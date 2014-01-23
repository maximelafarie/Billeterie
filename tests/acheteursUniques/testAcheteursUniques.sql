-- ============================================================================
-- fichier :	testAcheteursUniques.sql
-- base : 		BILLETERIE
-- auteur(s) : 	Maxime LAFARIE
-- date : 		Décembre 2013 / Janvier 2014
-- role : 		Effectuer l'insertion des nuplets pour le test de la
--		  		requete testAcheteursUniques.sql.
-- projet : 	Billeterie
-- ============================================================================

-- ============================================================================
-- Modification du format de la date pour se conformer aux donnees du programme de test
-- ============================================================================
alter session set NLS_DATE_FORMAT='dd-mm-yyyy';

-- ============================================================================
-- Suppression des nuplets de la base de donnees
-- NB : Le test est effectué sur une base vide, il est nécessaire
-- de supprimer tous les nuplets de toutes les relations
-- ============================================================================
@ utilitaires/viderContenuBaseBilleterie.sql
-- ============================================================================
-- Jeu de test pour le DOMAINE VALIDE
-- ============================================================================

-- CAS 1 : Évènement avec un client ayant acheté un seul billet.
-- INSERTION D'UN NOUVEAU BILLET : Cas vente direct particulier
INSERT INTO client (idcli, nomcli, prenomcli, telcli, mailcli, adrcli)
VALUES (1, 'MARTIN', 'Jean', '0505050505', 'martin@gmail.com', 'La Rochelle');

INSERT INTO tarif (idtarif, prix, typetarif)
VALUES (1, 85, 'plein');

INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (1, 'Melrane', 'Bordeaux');

INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (1, 'GrandShow', '10/04/2014', 'concert', 1);

INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (1, '85PO365219CBD47', 1, 1, NULL, 1);

INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (2, 'Lacclameur', 'Niort');

INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (2, 'MusicFestival', '02/12/2014', 'concert', 2);

INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (2, '85P52SAM19CBD47', 1, 1, NULL, 2);

-- CAS 2 : Évènement avec plusieurs clients ayant acheté un seul billet chacun.
-- INSERTION D'UN NOUVEAU BILLET : Cas vente direct particulier
INSERT INTO client (idcli, nomcli, prenomcli, telcli, mailcli, adrcli)
VALUES (2, 'MIRON', 'Herve', '0605050505', 'miron@gmail.com', 'Niort');

INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (3, '996ZESAM19CBD47', 2, 1, NULL, 2);

-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE
-- ============================================================================

-- CAS 3 : Client ayant acheté plusieurs billets du même évènement.
-- INSERTION D'UN NOUVEAU BILLET : Cas vente direct particulier
INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (3, 'Sketch2013', '18/06/2014', 'comedie', 2);

INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (4, '862546DM19CBD47', 1, 1, NULL, 3);

INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (5, '658SD6DM19CBD47', 1, 1, NULL, 3);

-- CAS 4 : Évènement avec plusieurs clients ayant acheté plusieurs billets.
-- INSERTION D'UN NOUVEAU BILLET : Cas vente direct particulier
INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (3, 'StadeMichelHippeau', 'Brest');

INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (4, 'MatchRugby', '18/08/2014', 'sport', 3);

INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (6, '85PO377719CBD47', 1, 1, NULL, 4);

INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (7, '8562165219CBD47', 2, 1, NULL, 4);

INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (8, '62A5ZE7719CBD47', 2, 1, NULL, 4);


-- Debut de l'ecriture du fichier resultat du programme de test
SPOOL tests/acheteursUniques/testAcheteursUniques.out
PROMPT fichier resultat du test : testAcheteursUniques.out

-- Appel du fichier de presentation
@ utilitaires/presentationBaseBilleterie.sql

-- Afficher le contenu des relations de la base de donnees
PROMPT Contenu de la base :
SET echo ON
@ utilitaires/afficherContenuBaseBilleterie.sql

-- ============================================================================
-- Requete a tester
-- ============================================================================

-- Debut de l'affichage du resultat de la requete sur le client SqlPlus
prompt 'Resultat de la requete'
@ tests/acheteursUniques/acheteursUniques.sql

-- Fin de l'affichage sur le client SqlPlus
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================
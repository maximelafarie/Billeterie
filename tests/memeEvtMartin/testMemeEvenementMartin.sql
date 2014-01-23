-- ==================================================
-- fichier : 	testMemeEvtMartin.sql
-- base : 		BILLETERIE
-- auteur(s) : 	Maxime LAFARIE
-- date : 		Décembre 2013 / Janvier 2014
-- role : 		Effectuer l'insertion des nuplets pour le test de la
--		  		requete memeEvtMartin.sql.
-- projet : 	Billeterie
-- ==================================================

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

-- CAS 1 : Client ayant acheté un billet pour le même évènement que celui de Jean 
--         MARTIN le 15/12/2013.
-- INSERTION D'UN NOUVEAU BILLET : Cas vente direct particulier
INSERT INTO client (idcli, nomcli, prenomcli, telcli, mailcli, adrcli)
VALUES (1, 'MARTIN', 'Jean', '0505050505', 'martin@gmail.com', 'La Rochelle');

INSERT INTO tarif (idtarif, prix, typetarif)
VALUES (1, 85, 'plein');

INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (1, 'Melrane', 'Bordeaux');

INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (1, 'GrandShow', '15/12/2013', 'concert', 1);

INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (1, '85PO365219CBD47', 1, 1, NULL, 1);

INSERT INTO client (idcli, nomcli, prenomcli, telcli, mailcli, adrcli)
VALUES (2, 'MIRON', 'Herve', '0605050505', 'miron@gmail.com', 'Niort');

INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (2, '85P52SAM19CBD47', 2, 1, NULL, 1);

-- CAS 2 : Client différent ayant acheté des billets pour le même évènement 
--         que celui de Jean MARTIN le 15/12/2013.
-- INSERTION D'UN NOUVEAU BILLET : Cas vente direct particulier

INSERT INTO client (idcli, nomcli, prenomcli, telcli, mailcli, adrcli)
VALUES (3, 'PLEAU', 'Dimitri', '0705050505', 'pleau@gmail.com', 'Paris');

INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (3, '996ZESAM19CBD47', 3, 1, NULL, 1);

INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (4, '862546DM19CBD47', 3, 1, NULL, 1);

-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE
-- ============================================================================

-- CAS 3 : Client ayant acheté un billet pour un évènement différent de celui 
--         de Jean MARTIN le 15/12/2013. 
-- INSERTION D'UN NOUVEAU BILLET : Cas vente direct particulier
INSERT INTO client (idcli, nomcli, prenomcli, telcli, mailcli, adrcli)
VALUES (4, 'DUGET', 'Romane', '0706050505', 'duget@gmail.com', 'Lyon');

INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (2, 'Lacclameur', 'Niort');

INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (2, 'MusicFestival', '15/12/2013', 'concert', 2);

INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (5, '658SD6DM19CBD47', 4, 1, NULL, 2);

-- CAS 4 : Client ayant acheté un billet pour le même évènement que celui de 
--         Jean MARTIN à une autre date que le 15/12/2013.
-- INSERTION D'UN NOUVEAU BILLET : Cas vente direct particulier
INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (3, 'StadeMichelHippeau', 'Brest');

INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (3, 'MatchRugby', '18/08/2014', 'sport', 3);

INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (6, '85PO377719CBD47', 1, 1, NULL, 3);

INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (7, '8562165219CBD47', 4, 1, NULL, 3);


-- Debut de l'ecriture du fichier resultat du programme de test
SPOOL tests/memeEvtMartin/testMemeEvtMartin.out
PROMPT fichier resultat du test : testMemeEvtMartin.out

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
@ tests/memeEvtMartin/memeEvtMartin.sql

-- Fin de l'affichage sur le client SqlPlus
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================
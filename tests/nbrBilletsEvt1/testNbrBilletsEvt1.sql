-- ==================================================
-- fichier : 	testNbrBilletsEvt1.sql
-- base : 		BILLETERIE
-- auteur(s) : 	Nicolas DOUSSON
-- auteur(s) : 	Maxime LAFARIE
-- date : 		Décembre 2013 / Janvier 2014
-- role : 		Effectuer l'insertion des nuplets pour le test de la
--		  		requete testNbrBilletsEvt1.sql.
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

-- CAS 1 : Jean Martin a achete 2 billets sur un site de reservation pour l'evenement
-- 		 d'id 1
-- INSERTION D'UN NOUVEAU BILLET : Cas site resa
INSERT INTO client (idcli, nomcli, prenomcli, telcli, mailcli, adrcli)
VALUES (1, 'MARTIN', 'Jean', '0505050505', 'martin@gmail.com', 'La Rochelle');
INSERT INTO tarif (idtarif, prix, typetarif)
VALUES (1, 100, 'plein');
INSERT INTO siteresa (idsiteresa, nomsiteresa, urlsiteresa)
VALUES (1, 'LeMoinsCher', 'www.lmc.com');
INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (1, 'CARLINE', 'La Rochelle');
INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (1, 'Les Joyaux', '01/02/2014', 'sport', 1);
INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (1, '15ED68EP10EPD78', 1, 1, 1, 1);

INSERT INTO tarif (idtarif, prix, typetarif)
VALUES (2, 50, 'enfant');
INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (2, '65QS82CD02POD94', 1, 2, 1, 1);

-- CAS 2 : Paul Dupont a achete 1 billet pour l'evenement d'id 1
-- INSERTION D'UN NOUVEAU BILLET : Cas site resa
INSERT INTO client (idcli, nomcli, prenomcli, telcli, mailcli, adrcli)
VALUES (2, 'DUPONT', 'Paul', '0506060606', 'dupont@gmail.com', 'La Rochelle');
INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (3, '02IH68GT40FAB65', 2, 1, 1, 1);

-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE
-- ============================================================================

-- CAS 3 : Jean Martin a acheté 1 billet en vente direct pour l'evenement d'id 2
-- INSERTION D'UN NOUVEAU BILLET : Cas vente direct particulier
INSERT INTO tarif (idtarif, prix, typetarif)
VALUES (3, 85, 'plein');
INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (2, 'Melrane', 'Bordeaux');
INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (2, 'Clipto', '10/04/2014', 'concert', 2);
INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (4, '85PO36DM19CBD15', 1, 1, NULL, 2);


-- Debut de l'ecriture du fichier resultat du programme de test
SPOOL tests/nbrBilletsEvt1/testNbrBilletsEvt1.out
PROMPT fichier resultat du test : testNbrBilletsEvt1.out

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
@ tests/nbrBilletsEvt1/nbrBilletsEvt1.sql

-- Fin de l'affichage sur le client SqlPlus
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================
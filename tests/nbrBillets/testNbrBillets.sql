-- ==================================================
-- fichier : 	nbrBillets.sql
-- base : 		BILLETERIE
-- auteur(s) : 	Maxime LAFARIE
-- date : 		Décembre 2013 / Janvier 2014
-- role : 		Effectuer l'insertion des nuplets pour le test de la
--		  		requete nbrBillets.sql.
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

-- CAS 1 : Insertion d'un billet pour un évènement de type "sport"
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
VALUES (1, '15ED68EP10EPD56', 1, 1, 1, 1);

-- CAS 2 : Insertion de deux billets pour le même évènement (même client).
-- INSERTION D'UN NOUVEAU BILLET : Cas vente direct particulier
INSERT INTO tarif (idtarif, prix, typetarif)
VALUES (3, 85, 'plein');
INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (2, 'Melrane', 'Bordeaux');
INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (2, 'Clipto', '10/04/2014', 'concert', 2);
INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (2, '85PO36DM19CBD78', 1, 3, NULL, 2);
INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (3, '89X736DM55CZM54', 1, 3, NULL, 2);

-- CAS 3 : Insertion d'un nouveau billet pour un autre évènement
-- INSERTION D'UN NOUVEAU BILLET : Cas site resa
INSERT INTO client (idcli, nomcli, prenomcli, telcli, mailcli, adrcli)
VALUES (2, 'DUPONT', 'Michel', '0605050505', 'michel@gmail.com', 'Niort');
INSERT INTO tarif (idtarif, prix, typetarif)
VALUES (2, 50, 'enfant');
INSERT INTO siteresa (idsiteresa, nomsiteresa, urlsiteresa)
VALUES (2, 'eBill', 'www.ebill.com');
INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (7, 'LACCLAMEUR', 'Niort');
INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (3, 'Sketch', '02/04/2014', 'comedie', 7);
INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (4, '07ED77XD10EFR79', 2, 2, 2, 3);

-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE
-- ============================================================================

-- Pas de domaine invalide pour cette requête.

-- Debut de l'ecriture du fichier resultat du programme de test
SPOOL tests/nbrBillets/testNbrBillets.out
PROMPT fichier resultat du test : testNbrBillets.out

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
@ tests/nbrBillets/nbrBillets.sql

-- Fin de l'affichage sur le client SqlPlus
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================
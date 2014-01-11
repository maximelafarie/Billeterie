-- ==================================================
-- fichier : testEvtMartinSaison1314.sql
-- base : BILLETERIE
-- auteur(s) : Nicolas DOUSSON
-- auteur(s) : Maxime LAFARIE
-- date : 07/01/14
-- role :
-- projet : Billeterie
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
@ viderContenuBaseBilleterie.sql
-- ============================================================================
-- Jeu de test pour le DOMAINE VALIDE
-- ============================================================================

-- CAS 1 : Jean Martin a achete 2 billets sur un site de reservation pour l'evenement
-- 		 d'id 1 compris entre septembre 2013 et juin 2014
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
VALUES (1, '15ED68EP10EPD', 1, 1, 1, 1);

INSERT INTO tarif (idtarif, prix, typetarif)
VALUES (2, 50, 'enfant');
INSERT INTO siteresa (idsiteresa, nomsiteresa, urlsiteresa)
VALUES (1, 'LeMoinsCher', 'www.lmc.com');
INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (1, 'CARLINE', 'La Rochelle');
INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (1, 'Les Joyaux', '01/02/2014', 'sport', 1);
INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (2, '65QS82CD02POD', 1, 2, 1, 1);

-- CAS 2 : Jean Martin a acheté 1 billet en vente direct pour l'evenement d'id 2
--		   compris entre septembre 2013 et juin 2014
-- INSERTION D'UN NOUVEAU BILLET : Cas vente direct particulier
INSERT INTO tarif (idtarif, prix, typetarif)
VALUES (3, 85, 'plein');
INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (2, 'Melrane', 'Bordeaux');
INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (2, 'Clipto', '10/04/2014', 'concert', 2);
INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (3, '85PO36DM19CBD', 1, 1, NULL, 2);

-- CAS 3 : Jean Martin a acheté 2 billets en vente direct pour l'evenement d'id 3
--		   compris entre septembre 2013 et juin 2014
-- INSERTION D'UN NOUVEAU BILLET : Cas vente direct particulier
INSERT INTO tarif (idtarif, prix, typetarif)
VALUES (4, 65, 'plein');
INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (3, 'Ilimage', 'Nantes');
INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (3, 'Barbatruc', '25/06/2014', 'enfant', 3);
INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (4, '65DE48IL37UDT', 1, 4, NULL, 3);

INSERT INTO tarif (idtarif, prix, typetarif)
VALUES (5, 25, 'enfant');
INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (3, 'Ilimage', 'Nantes');
INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (3, 'Barbatruc', '25/06/2014', 'enfant', 3);
INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (5, '15KD86KU92EGT', 1, 5, NULL, 3);

-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE
-- ============================================================================

-- CAS 4 : Paul Dupont a achete 1 billet en dehors de la plage de date
-- INSERTION D'UN NOUVEAU BILLET : Cas site resa
INSERT INTO client (idcli, nomcli, prenomcli, telcli, mailcli, adrcli)
VALUES (2, 'DUPONT', 'Paul', '0506060606', 'dupont@gmail.com', 'La Rochelle');
INSERT INTO tarif (idtarif, prix, typetarif)
VALUES (1, 100, 'plein');
INSERT INTO siteresa (idsiteresa, nomsiteresa, urlsiteresa)
VALUES (1, 'LeMoinsCher', 'www.lmc.com');
INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (1, 'CARLINE', 'La Rochelle');
INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (4, 'Lourpa', '05/03/2015', 'comedie', 1);
INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (6, '02IH68GT40FAB', 2, 1, 1, 4);

-- Debut de l'ecriture du fichier resultat du programme de test
SPOOL testEvtMartinSaison1314.out
PROMPT fichier resultat du test : testEvtMartinSaison1314.out

-- Appel du fichier de presentation
@ presentationBaseBilleterie.sql

-- Afficher le contenu des relations de la base de donnees
PROMPT Contenu de la base :
SET echo ON
@ afficherContenuBaseBilleterie.sql

-- ============================================================================
-- Requete a tester
-- ============================================================================

-- Debut de l'affichage du resultat de la requete sur le client SqlPlus
prompt 'Resultat de la requete'
@ evtMartinSaison1314.sql

-- Fin de l'affichage sur le client SqlPlus
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================
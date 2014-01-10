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
--      de supprimer tous les nuplets de toutes les relations
-- ============================================================================
@ viderContenuBaseBilleterie.sql
-- ============================================================================
-- Jeu de test pour le DOMAINE VALIDE
-- ============================================================================

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
VALUES (1, '1055d255e', 1, 1, 1, 1);

-- INSERTION D'UN NOUVEAU BILLET : Cas site resa
INSERT INTO tarif (idtarif, prix, typetarif)
VALUES (2, 65, 'plein');
INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (2, 'ESTAPHANE', 'La Rochelle');
INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (2, 'Lestimache', '31/11/2013', 'concert', 2);
INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (2, '10ed82f5e', 1, 2, 1, 2);

-- INSERTION D'UN NOUVEAU BILLET : Cas vente direct particulier
INSERT INTO tarif (idtarif, prix, typetarif)
VALUES (3, 50, 'plein');
INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (3, 'Lourdine', 'Bordeaux');
INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (3, 'Miligane', '15/04/2014', 'concert', 3);
INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (3, 'fe75d255e', 1, 3, NULL, 3);


-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE 
-- ============================================================================

-- INSERTION D'UN NOUVEAU BILLET : Cas site resa qui n'est pas dans les dates de la requête
INSERT INTO tarif (idtarif, prix, typetarif)
VALUES (4, 25, 'plein');
INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (4, 'Bigalou', '15/07/2014', 'sport', 1);
INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (4, 'ae15df7789', 1, 4, 1, 4);

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
@ nbrevtMartinSaison1314.sql

-- Fin de l'affichage sur le client SqlPlus
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================
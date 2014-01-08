-- ==========================
-- fichier : modeleIsertBaseBilleterie.sql
-- base : BILLETERIE
-- auteur(s) : Nicolas DOUSSON
-- auteur(s) : Maxime LAFARIE
-- date : 07/01/14
-- role : Insertion des nuplets dans les relations
-- projet : BILLETERIE
-- ==========================

-- INSERTION D'UN NOUVEAU CLIENT
INSERT INTO client (idcli, nomcli, prenomcli, telcli, mailcli, adrcli)
VALUES (1, 'PEST', 'BUDA', '0505050505', 'budapest@exemple.org', 'BUDAPEST');

-- INSERTION D'UN NOUVEAU TARIF
INSERT INTO tarif (idtarif, prix, typetarif)
VALUES (1, 100, 'etudiant');

-- INSERTION D'UN NOUVEAU SITE DE RESERVATION
INSERT INTO siteresa (idsiteresa, nomsiteresa, urlsiteresa)
VALUES (1, 'LACOMMANDE', 'www.lacommande.com');

-- INSERTION D'UN NOUVEAU BILLET
INSERT INTO client (idcli, nomcli, prenomcli, telcli, mailcli, adrcli)
VALUES (1, 'PEST', 'BUDA', '0505050505', 'budapest@exemple.org', 'BUDAPEST');
INSERT INTO tarif (idtarif, prix, typetarif)
VALUES (1, 100, 'etudiant');
INSERT INTO siteresa (idsiteresa, nomsiteresa, urlsiteresa)
VALUES (1, 'LACOMMANDE', 'www.lacommande.com');
INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (1, 'DUCHAMP', 'BURKINA');
INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (1, 'BOURRAGE', '01/02/2014', 'enfant', 1);

-- INSERTION D'UNE NOUVELLE SALLE
INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (1, 'DUCHAMP', 'BURKINA');

-- INSERTION D'UN NOUVEL EVENEMENT
INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (1, 'DUCHAMP', 'BURKINA');
INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (1, 'BOURRAGE', '01/02/2014', 'enfant', 1);
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
VALUES (1, 'MARTIN', 'Jean', '0505050505', 'martin@gmail.com', 'La Rochelle');

-- INSERTION D'UN NOUVEAU TARIF
INSERT INTO tarif (idtarif, prix, typetarif)
VALUES (1, 100, 'etudiant');

-- INSERTION D'UN NOUVEAU SITE DE RESERVATION
INSERT INTO siteresa (idsiteresa, nomsiteresa, urlsiteresa)
VALUES (1, 'LeMoinsCher', 'www.lmc.com');

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
VALUES (1, '15ED68EP10EPD85', 1, 1, 1, 1);

-- INSERTION D'UN NOUVEAU BILLET : Cas vente direct particulier
INSERT INTO client (idcli, nomcli, prenomcli, telcli, mailcli, adrcli)
VALUES (1, 'MARTIN', 'Jean', '0505050505', 'martin@gmail.com', 'La Rochelle');
INSERT INTO tarif (idtarif, prix, typetarif)
VALUES (2, 85, 'plein');
INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (2, 'Melrane', 'Bordeaux');
INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (2, 'Clipto', '10/04/2014', 'concert', 2);
INSERT INTO billet (idbillet, codebillet, idcli, idtarif, idsiteresa, idevt)
VALUES (2, '85PO36DM19CBD47', 1, 2, NULL, 2);


-- INSERTION D'UNE NOUVELLE SALLE
INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (2, 'Melrane', 'Bordeaux');

-- INSERTION D'UN NOUVEL EVENEMENT
INSERT INTO salle (idsalle, nomsalle, adrsalle)
VALUES (2, 'Melrane', 'Bordeaux');
INSERT INTO evenement (idevt, titreevt, dateevt, typeevt, idsalle)
VALUES (2, 'Clipto', '10/04/2014', 'concert', 2);

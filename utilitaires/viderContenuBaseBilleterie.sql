-- ==========================
-- fichier : viderbase.sql
-- base : BILLETERIE
-- auteur(s) : Nicolas DOUSSON
-- auteur(s) : Maxime LAFARIE
-- date : 07/01/14
-- role : Requêtes pour vider la base.
-- projet : BILLETERIE
-- ==========================

-- suppression des nuplets de billet
DELETE FROM BILLET;

-- suppression des nuplets de client
DELETE FROM CLIENT;

-- suppression des nuplets de tarif
DELETE FROM TARIF;

-- suppresssion des nuplets du siteresa
DELETE FROM SITERESA;

-- suppression des nuplets de evenement
DELETE FROM EVENEMENT;

-- suppresssion des nuplets de salle
DELETE FROM SALLE;

-- ==========================
-- fichier : viderbase.sql
-- base : BILLETERIE
-- auteur(s) : Nicolas DOUSSON
-- auteur(s) : Maxime LAFARIE
-- date : 07/01/14
-- role : Requête pour vider la base.
-- projet : BILLETERIE
-- ==========================

-- suppression des nuplets de billet
DELETE FROM billet;

-- suppression des nuplets de client
DELETE FROM client;

-- suppression des nuplets de tarif
DELETE FROM tarif;

-- suppresssion des nuplets du siteresa
DELETE FROM siteresa;

-- suppression des nuplets de evenement
DELETE FROM evenement;

-- suppresssion des nuplets de salle
DELETE FROM salle;
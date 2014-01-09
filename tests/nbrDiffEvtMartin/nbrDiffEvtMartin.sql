-- ==================================================
-- fichier : nbrDiffEvtMartin.sql
-- base : BILLETERIE
-- auteur(s) : Nicolas DOUSSON
-- auteur(s) : Maxime LAFARIE
-- date : 07/01/14
-- role : Affichage du nombre d'événement pour lesquels
--		  Jean Martin a acheté des billets
-- projet : Billeterie
-- ==================================================

SELECT C.nomcli, C.prenomcli, E.idevt, SUM(E.idevt) as nbrevtachatbillet
FROM Client C, Evenement E, Billet B
WHERE C.prenomcli = 'Jean'
AND C.nomcli = 'MARTIN'
AND C.idcli = B.idcli
AND B.idevt = E.idevt;
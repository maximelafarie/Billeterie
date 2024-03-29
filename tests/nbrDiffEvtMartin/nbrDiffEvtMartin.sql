-- ==================================================
-- fichier : nbrDiffEvtMartin.sql
-- base : BILLETERIE
-- auteur(s) : Nicolas DOUSSON
-- date : 07/01/14
-- role : Affichage du nombre d'événement pour lesquels
--		  Jean Martin a acheté des billets
-- projet : Billeterie
-- ==================================================

SELECT C.nomcli, C.prenomcli, COUNT(DISTINCT B.idevt) as nbrEvtBilletAchete
FROM Client C, Evenement E, Billet B
WHERE C.nomcli = 'MARTIN'
AND C.prenomcli = 'Jean'
AND B.idevt = E.idevt
AND C.idcli = B.idcli
GROUP BY C.nomcli, C.prenomcli;
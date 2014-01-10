-- ==================================================
-- fichier : nbrDiffEvtMartin.sql
-- base : BILLETERIE
-- auteur(s) : Nicolas DOUSSON
-- date : 07/01/14
-- role : Affichage du prix des billets de Jea MARTIN
--		  pour les événement de type Sport ou Concert
-- projet : Billeterie
-- ==================================================

SELECT DISTINCT C.nomcli, C.prenomcli, E.typeevt, T.prix
FROM Billet B, Client C, Tarif F, Evenement E
WHERE C.nocli = 'MARTIN'
AND C.prenomcli = 'Jean'
AND E.typeevt = 'sport'
AND E.typeevt = 'concert'
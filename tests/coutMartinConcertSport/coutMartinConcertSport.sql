-- ==================================================
-- fichier : nbrDiffEvtMartin.sql
-- base : BILLETERIE
-- auteur(s) : Nicolas DOUSSON
-- date : 07/01/14
-- role : Affichage du prix des billets de Jean MARTIN
--		  pour les événements de type Sport ou Concert
-- projet : Billeterie
-- ==================================================

SELECT DISTINCT C.nomcli, C.prenomcli, B.idbillet, E.typeevt, T.prix
FROM Billet B, Client C, Tarif F, Evenement E
WHERE C.nomcli = 'MARTIN'
AND C.prenomcli = 'Jean'
AND E.typeevt = 'sport'
AND E.typeevt = 'concert'
AND B.idtarif = T.idtarif
AND C.idcli = B.idcli;
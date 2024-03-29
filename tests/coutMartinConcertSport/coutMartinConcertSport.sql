-- ==================================================
-- fichier : nbrDiffEvtMartin.sql
-- base : BILLETERIE
-- auteur(s) : Nicolas DOUSSON
-- date : 07/01/14
-- role : Affichage du prix des billets de Jean MARTIN
--		  pour les événements de type Sport ou Concert
-- projet : Billeterie
-- ==================================================

SELECT DISTINCT C.nomcli, C.prenomcli, E.typeevt, E.titreevt, SUM(T.prix) as "Prix pour Mr. MARTIN"
FROM Billet B, Client C, Tarif T, Evenement E
WHERE C.nomcli = 'MARTIN'
AND C.prenomcli = 'Jean'
AND E.idevt = B.idevt
AND B.idtarif = T.idtarif
AND C.idcli = B.idcli
AND E.typeevt IN ('concert', 'sport')
GROUP BY C.nomcli, C.prenomcli, E.typeevt, E.titreevt;

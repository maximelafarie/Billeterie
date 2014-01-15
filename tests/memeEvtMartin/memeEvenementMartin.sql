-- ============================================================================
-- Fichier          : memeEvenementMartin.sql
-- Auteur           : Maxime LAFARIE
-- Date             : Janvier 2014
-- Base				: Billeterie
-- Projet           : Billeterie
-- Role             : Clients ayant acheté un ou des billets pour le même 
--					  évènement que Jean MARTIN le 15/12/2013.
-- ============================================================================

SELECT C2.idcli, C2.nomcli, C2.prenomcli
FROM CLIENT C1, CLIENT C2, EVENEMENT E1, EVENEMENT E2, BILLET B1, BILLET B2
WHERE C1.nomcli = 'MARTIN'
AND C1.idcli = B1.idcli
AND E1.dateevt = '15/12/2013'
AND B1.idevt = E1.idevt
AND E1.idevt = E2.idevt
AND E1.dateevt = E2.dateevt
AND B2.idevt = E2.idevt
AND C2.idcli = B2.idcli
AND C2.nomcli != 'MARTIN'
ORDER BY C2.idcli ASC;
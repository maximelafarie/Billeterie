-- ============================================================================
-- Fichier          : memeEvtMartin.sql
-- Auteur           : Maxime LAFARIE
-- Date             : Janvier 2014
-- Base				: Billeterie
-- Projet           : Billeterie
-- Role             : Clients ayant acheté un ou des billets pour le même 
--					  évènement que Jean MARTIN le 15/12/2013.
-- ============================================================================

SELECT DISTINCT C2.idcli, C2.prenomcli, C2.nomcli
FROM CLIENT C, EVENEMENT E, BILLET B, CLIENT C2, BILLET B2 
WHERE B.idcli = C.idcli 
AND C.idcli IN (SELECT C.idcli 
				FROM CLIENT C 
				WHERE C.nomcli = 'MARTIN' 
				AND C.prenomcli = 'Jean') 
AND E.idevt = B.idevt 
AND B2.idevt = E.idevt 
AND C2.idcli = B2.idcli 
AND E.dateevt = '15/12/2013' 
AND C2.idcli NOT IN (SELECT C.idcli 
					 FROM CLIENT C 
					 WHERE C.nomcli = 'MARTIN' 
					 AND C.prenomcli = 'Jean');
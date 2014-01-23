-- ============================================================================
-- Fichier          : tousLesConcerts.sql
-- Auteur           : Maxime LAFARIE
-- Date             : Janvier 2014
-- Base				: Billeterie
-- Projet           : Billeterie
-- Role             : Clients ayant acheté des billets pour tous les 
-- 					  évènements de type "concert".
-- ============================================================================

SELECT DISTINCT C.idcli, C.prenomcli, C.nomcli
FROM BILLET B, CLIENT C
WHERE NOT EXISTS (SELECT *
				  FROM EVENEMENT E
				  WHERE E.typeevt = 'concert'
				  AND NOT EXISTS ( SELECT *
				  				   FROM BILLET B2
				  				   WHERE B2.idevt = E.idevt
				  				   AND B2.idcli = B.idcli))
AND C.idcli = B.idcli;
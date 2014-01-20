-- ============================================================================
-- Fichier          : acheteursUniques.sql
-- Auteur           : Maxime LAFARIE
-- Date             : Janvier 2014
-- Base				: Billeterie
-- Projet           : Billeterie
-- Role             : Evènements n'ayant que des acheteurs uniques (tous les
--					  acheteurs ont acheté un seul billet).
-- ============================================================================

SELECT E.idevt, E.titreevt, E.typeevt
FROM EVENEMENT E, CLIENT C, BILLET B
WHERE C.idcli IN (SELECT C2.idcli, COUNT(*) as NBRSV
				  FROM CLIENT C2, 
				  WHERE C2.idcli = C.idcli
				  AND E.idcli = C2.idcli
				  AND NBRSV = 1
				  GROUP BY idcli);
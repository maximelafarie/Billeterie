-- ============================================================================
-- Fichier          : acheteursUniques.sql
-- Auteur           : Maxime LAFARIE
-- Date             : Janvier 2014
-- Base				: Billeterie
-- Projet           : Billeterie
-- Role             : Evènements n'ayant que des acheteurs uniques (tous les
--					  acheteurs ont acheté un seul billet).
-- ============================================================================

SELECT B.idevt, E.titreevt, E.typeevt
FROM BILLET B, EVENEMENT E
WHERE E.idevt = B.idevt
GROUP BY B.idevt, E.titreevt, E.typeevt
HAVING COUNT(B.idcli) = COUNT(DISTINCT B.idcli);
-- ============================================================================
-- Fichier          : acheteursUniques.sql
-- Auteur           : Maxime LAFARIE
-- Date             : Janvier 2014
-- Base				: Billeterie
-- Projet           : Billeterie
-- Role             : Evènements n'ayant que des acheteurs uniques (tous les
--					  acheteurs ont acheté un seul billet).
-- ============================================================================

SELECT DISTINCT E.titreevt, count(*) as NBRBILLETS 
FROM BILLET B, EVENEMENT E 
WHERE B.idevt = E.idevt 
GROUP BY E.titreevt
HAVING COUNT(*) = 1 
ORDER BY E.titreevt ASC;
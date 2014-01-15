-- ============================================================================
-- Fichier          : nbrBillets.sql
-- Auteur           : Maxime LAFARIE
-- Date             : Janvier 2014
-- Base				: Billeterie
-- Projet           : Billeterie
-- Role             : Nombre de billets vendus par evenement dans l'ordre
--                    decroissant.
-- ============================================================================

SELECT COUNT(idbillet) AS NBRBILLETS, E.titreevt
FROM BILLET B, EVENEMENT E
WHERE B.idevt = E.idevt
GROUP BY titreevt
ORDER BY NBRBILLETS DESC;
-- ============================================================================
-- Fichier          : nbrBillets.sql
-- Auteur           : Maxime LAFARIE
-- Date             : Janvier 2014
-- Base				: Billeterie
-- Projet           : Billeterie
-- Role             : Nombre de billets vendus par evenement dans l'ordre
--                    decroissant.
-- ============================================================================

SELECT E.idevt, E.titreevt, COUNT(B.idbillet) AS NBRBILLETS
FROM EVENEMENT E, BILLET B
WHERE E.idevt = B.idevt
GROUP BY E.idevt, B.idbillet
ORDER BY NBRBILLETS DESC;

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
WHERE E.idevt = B.idevt
AND B.idcli = C.idcli
AND 
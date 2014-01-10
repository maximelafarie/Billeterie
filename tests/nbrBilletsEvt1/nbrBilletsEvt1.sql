-- ==================================================
-- fichier : nbrBilletsEvt1.sql
-- base : BILLETERIE
-- auteur(s) : Nicolas DOUSSON
-- date : 07/01/14
-- role : Affichage du nombre de billets vendu pour
--  	  l'événement d'id 1 
-- projet : Billeterie
-- ==================================================

SELECT SUM(B.idbillet) as billetvendu
FROM Billet B, Evenement E
WHERE E.idevt = 1
AND B.idevt = E.idevt;
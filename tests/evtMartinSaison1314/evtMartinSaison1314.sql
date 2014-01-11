-- ==================================================
-- fichier : evtMartinSaison1314.sql
-- base : BILLETERIE
-- auteur(s) : Nicolas DOUSSON
-- date : 07/01/14
-- role : Affichage des événements pour lesquels Jean MARTIN
--		  a acheté des billets qui se déroulent entre septembre
--		  2013 et juin 2014
-- projet : Billeterie
-- ==================================================

SELECT DISTINCT C.nomcli, C.prenomcli, E.titreevt, E.dateevt
FROM Billet B, Client C, Evenement E
WHERE C.nomcli = 'MARTIN'
AND C.prenomcli = 'Jean'
AND E.dateevt BETWEEN to_date ('01/09/2013', 'DD/MM/YYYY')
AND to_date ('30/06/2014', 'DD/MM/YYYY');
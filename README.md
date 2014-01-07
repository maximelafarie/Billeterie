DOUSSON Nicolas
LAFARIE Maxime

Projet BDD Info1

PROJET BILLETERIE
=================

## Etude Proposee ##

Une société, organisatrice d'évènements, vend des billets pour ses spectacles.
Ces billets peuvent êtes vendus directement à des particuliers :
Un client réserve soit par téléphone, soit par le site internet de la société.
Les billets peuvent être également vendus par un tiers comme un site internet 
spécialisé dans la vente de billets événementiels (ex. : "digitick").
Tous les billets vendus (en direct aux particuliers et par des sites tiers) sont
stockés dans la base de données de la société.

## Schéma Relationnel ##

#####CLIENT(IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
#####BILLET(IDBILLET, CODEBILLET, IDCLI, IDTARIF, IDSITERESA, IDEVT)
#####EVENEMENT(IDEVT, TITREEVT, DATEEVT, TYPEEVT, IDSALLE)
#####SALLE(IDSALLE, NOMSALLE, ADRSALLE)
#####TARIF(IDTARIF, PRIX, TYPETARIF)
#####SITERESA(IDSITERESA, NOMSITERESA, URLSITERESA)

## Dictionnaire de données ##

#####BILLET Place achetée pour assister à une événement, un Billet correspond à une personne. Un même Client peut acheter plusieurs Billets.

#####CLIENT Personne qui a acheté une ou des places

#####EVENEMENT  Manifestation, spectable se déroulant

#####SALLE  Lieu où se déroule un Evénement

#####SITERESA Site interne pour réserver et acheter des Billets pour un Evénement

#####TARIF  Prix et type de tarif d'un Billet pour un Evénement

-- ==================================================
-- fichier : ddlBaseBilleterie.sql
-- base : BILLETERIE
-- auteur(s) : Nicolas DOUSSON
-- auteur(s) : Maxime LAFARIE
-- date : 07/01/14
-- role : Creer l'ensemble des tables avec leurs attributs,
-- 	  cles primaires, contraintes check, cles uniques,
--	  et dependances de references.
-- projet : Billeterie
-- ==================================================

-- ==================================================
-- Creation des tables et des contraintes associees
-- ==================================================

-- Suppression des tables de la base BILLETERIE
DROP TABLE SALLE CASCADE CONSTRAINTS;
DROP TABLE EVENEMENT CASCADE CONSTRAINTS;
DROP TABLE SITERESA CASCADE CONSTRAINTS;
DROP TABLE TARIF CASCADE CONSTRAINTS;
DROP TABLE CLIENT CASCADE CONSTRAINTS;
DROP TABLE BILLET CASCADE CONSTRAINTS;


CREATE TABLE CLIENT (
	IDCLI		NUMBER(4)	NOT NULL,
	NOMCLI		VARCHAR2(40)	NOT NULL,
	PRENOMCLI	VARCHAR2(40)	NOT NULL,
	TELCLI		CHAR(10)	NOT NULL,
	MAILCLI		VARCHAR2(80)	NOT NULL,
	CONSTRAINT PK_CLIENT PRIMARY KEY (IDCLI),
	CONSTRAINT UNQ_CLIENT UNIQUE (MAILCLI)
);

CREATE TABLE BILLET (
	IDBILLET	NUMBER(4)	NOT NULL,
	CODEBILLET	CHAR(15)	NOT NULL,
	IDCLI		NUMBER(4)	NOT NULL,
	IDTARIF		NUMBER(4)	NOT NULL,
	IDSITERESA	NUMBER(4)	NULL,
	IDEVT		NUMBER(4)	NOT NULL,
	CONSTRAINT PK_BILLET PRIMARY KEY (IDBILLET),
	CONSTRAINT UNQ_BILLET UNIQUE (CODEBILLET)
);

CREATE TABLE EVENEMENT (
	IDEVT		NUMBER(4)	NOT NULL,
	TITREEVT	VARCHAR2(50)	NOT NULL,
	DATEEVT		DATE 		NOT NULL,
	TYPEEVT 	CHAR(7)		NOT NULL,
	IDSALLE		NUMBER(4)	NOT NULL,
	CONSTRAINT PK_EVT PRIMARY KEY (IDEVT),
	CONSTRAINT CK_TYPEEVT CHECK (TYPEEVT IN('concert','sport','comedie','enfant'))
);

CREATE TABLE SALLE (
	IDSALLE 	NUMBER(4)	NOT NULL,
	NOMSALLE	VARCHAR2(50)	NOT NULL,
	ADRSALLE	VARCHAR2(255)	NOT NULL,
	CONSTRAINT PK_SALLE PRIMARY KEY (IDSALLE)
);

CREATE TABLE TARIF (
	IDTARIF		NUMBER(4)	NOT NULL,
	PRIX		NUMBER(5,2)	NOT NULL,
	TYPETARIF	CHAR(8)		NOT NULL,
	CONSTRAINT PK_TARIF PRIMARY KEY (IDTARIF)
	CONSTRAINT CK_PRIX CHECK (PRIX > 0);
	CONSTRAINT CK_TYPETARIF CHECK (TYPETARIF IN('etudiant','plein','enfant'))
);

CREATE TABLE SITERESA (
	IDSITERESA	NUMBER(4)	NOT NULL,
	NOMSITERESA	VARCHAR2(50)	NOT NULL,
	URLSITERESA	VARCHAR2(80)	NOT NULL,
	CONSTRAINT PK_SITE PRIMARY KEY (IDSITERESA)
);

-- ==================================================
-- Creation des dependances de references
-- ==================================================

ALTER TABLE BILLET
ADD CONSTRAINT FK_BILLET_CLI FOREIGN KEY (IDCLI) REFERENCES CLIENT(IDCLI);

ALTER TABLE BILLET
ADD CONSTRAINT FK_BILLET_TARIF FOREIGN KEY (IDTARIF) REFERENCES TARIF(IDTARIF);

ALTER TABLE BILLET
ADD CONSTRAINT FK_BILLET_RESA FOREIGN KEY (IDSITERESA) REFERENCES SITERESA(IDSITERESA);

ALTER TABLE BILLET
ADD CONSTRAINT FK_BILLET_EVT FOREIGN KEY (IDEVT) REFERENCES EVENEMENT(IDEVT);

ALTER TABLE EVENEMENT 
ADD CONSTRAINT FK_EVT_SALLE FOREIGN KEY (IDSALLE) REFERENCES SALLE(IDSALLE);

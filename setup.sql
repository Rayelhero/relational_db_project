
--------------------------------------------------------
--  File created - Sonntag-Juni-09-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type ADRESSET
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "ADRESSET" AS OBJECT 
( 
    ort VARCHAR2(50),
    plz VARCHAR2(5),
    strasse VARCHAR2(50),
    hausnummer VARCHAR2(10),
    adresszusatz VARCHAR2(50)
/* TODO enter attribute and method declarations here */ 
)

/
--------------------------------------------------------
--  DDL for Type NAMET
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "NAMET" AS OBJECT (
    nachname VARCHAR2(50),
    vorname VARCHAR2(50)
);

/
--------------------------------------------------------
--  DDL for Type ZAHLUNGSINFORMATIONENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "ZAHLUNGSINFORMATIONENT" AS OBJECT (
    art VARCHAR2(30),
    kontoinhaber VARCHAR2(50),
    iBAN_Kontonummer VARCHAR2(34) --Maximall�nge nach Wikipedia
);

/
--------------------------------------------------------
--  DDL for Table ARBEITSSCHRITT
--------------------------------------------------------

  CREATE TABLE "ARBEITSSCHRITT" 
   (	"ARBEITSSCHRITT_ID" NUMBER(*,0), 
	"DAUER_MIN" NUMBER(*,0), 
	"QUALIFIKATION" VARCHAR2(30 BYTE) COLLATE "USING_NLS_COMP", 
	"ANZAHL_MITARBEITER" NUMBER(*,0)
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Table BAND
--------------------------------------------------------

  CREATE TABLE "BAND" 
   (	"BAND_ID" NUMBER(*,0), 
	"NAME" VARCHAR2(50 BYTE) COLLATE "USING_NLS_COMP", 
	"ADRESSE" VARCHAR2(50 BYTE) COLLATE "USING_NLS_COMP", 
	"GROESSE_DER_BAND" NUMBER(*,0), 
	"PERSON_ID" NUMBER(*,0)
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Table BEWERTUNG
--------------------------------------------------------

  CREATE TABLE "BEWERTUNG" 
   (	"BEWERTUNG_ID" NUMBER(*,0), 
	"BEWERTUNG" NUMBER(*,0), 
	"VERFASSUNGSDATUM" DATE, 
	"KUNDE_ID" NUMBER(*,0), 
	"EVENT_ID" NUMBER(*,0)
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Table BUCHUNG
--------------------------------------------------------

  CREATE TABLE "BUCHUNG" 
   (	"BUCHUNG_ID" NUMBER(*,0), 
	"DATUM" DATE, 
	"KUNDE_ID" NUMBER(*,0)
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Table BUCHUNGSPOSITION
--------------------------------------------------------

  CREATE TABLE "BUCHUNGSPOSITION" 
   (	"POSITIONS_NUMMER" NUMBER(*,0), 
	"BEZEICHNUNG" VARCHAR2(100 BYTE) COLLATE "USING_NLS_COMP", 
	"ANZAHL" NUMBER(*,0), 
	"BUCHUNG_ID" NUMBER(*,0)
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Table EINSATZ
--------------------------------------------------------

  CREATE TABLE "EINSATZ" 
   (	"EINSATZ_ID" NUMBER(*,0), 
	"DATUM" DATE, 
	"RESSOURCE_ID" NUMBER(*,0)
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Table EVENT
--------------------------------------------------------

  CREATE TABLE "EVENT" 
   (	"EVENT_ID" NUMBER(*,0), 
	"TITEL" VARCHAR2(50 BYTE) COLLATE "USING_NLS_COMP", 
	"ZEITPUNKT_BEGINN" DATE, 
	"COLUMN2" DATE, 
	"JETZT_AUF_WEBSITE" NUMBER(*,0), 
	"WEBSITE_AUFRUFE_24H" NUMBER(*,0), 
	"LOCATION_ID" NUMBER(*,0), 
	"EVENTKATEGORIE_ID" NUMBER(*,0)
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Table EVENTKATEGORIE
--------------------------------------------------------

  CREATE TABLE "EVENTKATEGORIE" 
   (	"EVENTKATEGORIE_ID" NUMBER(*,0), 
	"NAME" VARCHAR2(50 BYTE) COLLATE "USING_NLS_COMP", 
	"BESCHREIBUNG" VARCHAR2(1000 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Table EVENT_BAND
--------------------------------------------------------

  CREATE TABLE "EVENT_BAND" 
   (	"EVENT_ID" NUMBER(*,0), 
	"BAND_ID" NUMBER(*,0)
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Table KUNDE
--------------------------------------------------------

  CREATE TABLE "KUNDE" 
   (	"KUNDE_ID" NUMBER(*,0), 
	"ZAHLUNGSINFORMATIONEN" "ZAHLUNGSINFORMATIONENT" , 
	"NAME_PERSON" "NAMET" , 
	"ADRESSE" "ADRESSET" , 
	"ALTER_PERSON" NUMBER(*,0), 
	"EMAIL" VARCHAR2(50 BYTE) COLLATE "USING_NLS_COMP", 
	"TELEFONNUMMER" VARCHAR2(20 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Table LOCATION
--------------------------------------------------------

  CREATE TABLE "LOCATION" 
   (	"LOCATION_ID" NUMBER(*,0), 
	"ANZAHL_SITZPLAETZE" NUMBER(*,0), 
	"ANZAHL_STEHPLAETZE" NUMBER(*,0), 
	"ADRESSE" VARCHAR2(50 BYTE) COLLATE "USING_NLS_COMP", 
	"BARRIEREFREI" CHAR(1 BYTE) COLLATE "USING_NLS_COMP", 
	"PERSON_ID" NUMBER(*,0), 
	"BEZEICHNUNG" VARCHAR2(50 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Table MITARBEITER
--------------------------------------------------------

  CREATE TABLE "MITARBEITER" 
   (	"MITARBEITER_ID" NUMBER(*,0), 
	"NAME" VARCHAR2(20 BYTE) COLLATE "USING_NLS_COMP", 
	"ADRESSE" VARCHAR2(20 BYTE) COLLATE "USING_NLS_COMP", 
	"PERSON_ALTER" NUMBER(*,0), 
	"EMAIL" VARCHAR2(50 BYTE) COLLATE "USING_NLS_COMP", 
	"TELEFONNUMMER" VARCHAR2(25 BYTE) COLLATE "USING_NLS_COMP", 
	"ZAHLUNGSINFORMATIONEN" VARCHAR2(20 BYTE) COLLATE "USING_NLS_COMP", 
	"QUALIFIKATIONEN" VARCHAR2(30 BYTE) COLLATE "USING_NLS_COMP", 
	"GEHALT" NUMBER(*,0), 
	"MAX_ARBEITSPENSUM_WOCHE" NUMBER(*,0), 
	"RESSOURCE_ID" VARCHAR2(20 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Table PERSON
--------------------------------------------------------

  CREATE TABLE "PERSON" 
   (	"PERSON_ID" NUMBER(*,0), 
	"NAME" VARCHAR2(20 BYTE) COLLATE "USING_NLS_COMP", 
	"PERSON_ALTER" NUMBER(*,0), 
	"EMAIL" VARCHAR2(50 BYTE) COLLATE "USING_NLS_COMP", 
	"TELEFONNUMMER" VARCHAR2(25 BYTE) COLLATE "USING_NLS_COMP", 
	"ADRESSE" VARCHAR2(20 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Table RESSOURCE
--------------------------------------------------------

  CREATE TABLE "RESSOURCE" 
   (	"RESSOURCE_ID" NUMBER(*,0), 
	"MITARBEITER_ID" NUMBER(*,0), 
	"TECHNIK_ID" NUMBER(*,0)
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Table TECHNIK
--------------------------------------------------------

  CREATE TABLE "TECHNIK" 
   (	"TECHNIK_ID" NUMBER(*,0), 
	"KATEGORIE" VARCHAR2(50 BYTE) COLLATE "USING_NLS_COMP", 
	"MODELL" VARCHAR2(50 BYTE) COLLATE "USING_NLS_COMP", 
	"KOSTEN" NUMBER(*,0), 
	"BETRIEBSKOSTEN_STD" NUMBER(*,0), 
	"MIETKOSTEN_TAG" NUMBER(*,0), 
	"COLUMN1" VARCHAR2(20 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Table TICKET
--------------------------------------------------------

  CREATE TABLE "TICKET" 
   (	"TICKET_ID" NUMBER(*,0), 
	"PLATZ_NUMMER" VARCHAR2(10 BYTE) COLLATE "USING_NLS_COMP", 
	"PREIS" FLOAT(126), 
	"PLATZART" VARCHAR2(20 BYTE) COLLATE "USING_NLS_COMP", 
	"ERMAESSIGT" CHAR(1 BYTE) COLLATE "USING_NLS_COMP", 
	"EVENT_ID" NUMBER(*,0)
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "DATA" ;
REM INSERTING into ARBEITSSCHRITT
SET DEFINE OFF;
REM INSERTING into BAND
SET DEFINE OFF;
REM INSERTING into BEWERTUNG
SET DEFINE OFF;
REM INSERTING into BUCHUNG
SET DEFINE OFF;
REM INSERTING into BUCHUNGSPOSITION
SET DEFINE OFF;
REM INSERTING into EINSATZ
SET DEFINE OFF;
REM INSERTING into EVENT
SET DEFINE OFF;
REM INSERTING into EVENTKATEGORIE
SET DEFINE OFF;
REM INSERTING into EVENT_BAND
SET DEFINE OFF;
REM INSERTING into KUNDE
SET DEFINE OFF;
REM INSERTING into LOCATION
SET DEFINE OFF;
REM INSERTING into MITARBEITER
SET DEFINE OFF;
REM INSERTING into PERSON
SET DEFINE OFF;
REM INSERTING into RESSOURCE
SET DEFINE OFF;
REM INSERTING into TECHNIK
SET DEFINE OFF;
REM INSERTING into TICKET
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index EVENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EVENT_PK" ON "EVENT" ("EVENT_ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index BUCHUNGSPOSITION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BUCHUNGSPOSITION_PK" ON "BUCHUNGSPOSITION" ("POSITIONS_NUMMER") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index BEWERTUNG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BEWERTUNG_PK" ON "BEWERTUNG" ("BEWERTUNG_ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index ARBEITSSCHRITTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ARBEITSSCHRITTE_PK" ON "ARBEITSSCHRITT" ("ARBEITSSCHRITT_ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index BAND_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BAND_PK" ON "BAND" ("BAND_ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index PERSON_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PERSON_PK" ON "PERSON" ("PERSON_ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index EVENT_BAND_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EVENT_BAND_PK" ON "EVENT_BAND" ("EVENT_ID", "BAND_ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index BUCHUNG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BUCHUNG_PK" ON "BUCHUNG" ("BUCHUNG_ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index MITARBEITER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MITARBEITER_PK" ON "MITARBEITER" ("MITARBEITER_ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index TICKET_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TICKET_PK" ON "TICKET" ("TICKET_ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index EVENTKATEGORIE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EVENTKATEGORIE_PK" ON "EVENTKATEGORIE" ("EVENTKATEGORIE_ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index KUNDE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KUNDE_PK" ON "KUNDE" ("KUNDE_ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index LOCATION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LOCATION_PK" ON "LOCATION" ("LOCATION_ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index RESSOURCE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RESSOURCE_PK" ON "RESSOURCE" ("RESSOURCE_ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index EINSATZ_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EINSATZ_PK" ON "EINSATZ" ("EINSATZ_ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index TECHNIK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TECHNIK_PK" ON "TECHNIK" ("TECHNIK_ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  Constraints for Table KUNDE
--------------------------------------------------------

  ALTER TABLE "KUNDE" MODIFY ("KUNDE_ID" NOT NULL ENABLE);
  ALTER TABLE "KUNDE" MODIFY ("ALTER_PERSON" NOT NULL ENABLE);
  ALTER TABLE "KUNDE" MODIFY ("ZAHLUNGSINFORMATIONEN" NOT NULL ENABLE);
  ALTER TABLE "KUNDE" MODIFY ("NAME_PERSON" NOT NULL ENABLE);
  ALTER TABLE "KUNDE" MODIFY ("ADRESSE" NOT NULL ENABLE);
  ALTER TABLE "KUNDE" ADD CONSTRAINT "KUNDE_PK" PRIMARY KEY ("KUNDE_ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "DATA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BAND
--------------------------------------------------------

  ALTER TABLE "BAND" MODIFY ("BAND_ID" NOT NULL ENABLE);
  ALTER TABLE "BAND" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "BAND" MODIFY ("ADRESSE" NOT NULL ENABLE);
  ALTER TABLE "BAND" MODIFY ("GROESSE_DER_BAND" NOT NULL ENABLE);
  ALTER TABLE "BAND" ADD CONSTRAINT "BAND_PK" PRIMARY KEY ("BAND_ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table RESSOURCE
--------------------------------------------------------

  ALTER TABLE "RESSOURCE" MODIFY ("RESSOURCE_ID" NOT NULL ENABLE);
  ALTER TABLE "RESSOURCE" ADD CONSTRAINT "RESSOURCE_PK" PRIMARY KEY ("RESSOURCE_ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA"  ENABLE;
  ALTER TABLE "RESSOURCE" ADD CONSTRAINT "RESSOURCE_CHK1" CHECK ((mitarbeiter_id IS NOT NULL AND technik_id IS NULL) OR (mitarbeiter_id IS NULL AND technik_id IS NOT NULL)) ENABLE;
--------------------------------------------------------
--  Constraints for Table EVENT
--------------------------------------------------------

  ALTER TABLE "EVENT" MODIFY ("EVENT_ID" NOT NULL ENABLE);
  ALTER TABLE "EVENT" MODIFY ("TITEL" NOT NULL ENABLE);
  ALTER TABLE "EVENT" ADD CONSTRAINT "EVENT_PK" PRIMARY KEY ("EVENT_ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA"  ENABLE;
  ALTER TABLE "EVENT" MODIFY ("ZEITPUNKT_BEGINN" NOT NULL ENABLE);
  ALTER TABLE "EVENT" MODIFY ("COLUMN2" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BUCHUNG
--------------------------------------------------------

  ALTER TABLE "BUCHUNG" MODIFY ("BUCHUNG_ID" NOT NULL ENABLE);
  ALTER TABLE "BUCHUNG" MODIFY ("DATUM" NOT NULL ENABLE);
  ALTER TABLE "BUCHUNG" ADD CONSTRAINT "BUCHUNG_PK" PRIMARY KEY ("BUCHUNG_ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EVENTKATEGORIE
--------------------------------------------------------

  ALTER TABLE "EVENTKATEGORIE" MODIFY ("EVENTKATEGORIE_ID" NOT NULL ENABLE);
  ALTER TABLE "EVENTKATEGORIE" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "EVENTKATEGORIE" MODIFY ("BESCHREIBUNG" NOT NULL ENABLE);
  ALTER TABLE "EVENTKATEGORIE" ADD CONSTRAINT "EVENTKATEGORIE_PK" PRIMARY KEY ("EVENTKATEGORIE_ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EVENT_BAND
--------------------------------------------------------

  ALTER TABLE "EVENT_BAND" MODIFY ("EVENT_ID" NOT NULL ENABLE);
  ALTER TABLE "EVENT_BAND" MODIFY ("BAND_ID" NOT NULL ENABLE);
  ALTER TABLE "EVENT_BAND" ADD CONSTRAINT "EVENT_BAND_PK" PRIMARY KEY ("EVENT_ID", "BAND_ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BUCHUNGSPOSITION
--------------------------------------------------------

  ALTER TABLE "BUCHUNGSPOSITION" MODIFY ("POSITIONS_NUMMER" NOT NULL ENABLE);
  ALTER TABLE "BUCHUNGSPOSITION" MODIFY ("BEZEICHNUNG" NOT NULL ENABLE);
  ALTER TABLE "BUCHUNGSPOSITION" MODIFY ("ANZAHL" NOT NULL ENABLE);
  ALTER TABLE "BUCHUNGSPOSITION" ADD CONSTRAINT "BUCHUNGSPOSITION_PK" PRIMARY KEY ("POSITIONS_NUMMER")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MITARBEITER
--------------------------------------------------------

  ALTER TABLE "MITARBEITER" MODIFY ("MITARBEITER_ID" NOT NULL ENABLE);
  ALTER TABLE "MITARBEITER" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MITARBEITER" MODIFY ("ADRESSE" NOT NULL ENABLE);
  ALTER TABLE "MITARBEITER" MODIFY ("PERSON_ALTER" NOT NULL ENABLE);
  ALTER TABLE "MITARBEITER" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "MITARBEITER" MODIFY ("TELEFONNUMMER" NOT NULL ENABLE);
  ALTER TABLE "MITARBEITER" MODIFY ("ZAHLUNGSINFORMATIONEN" NOT NULL ENABLE);
  ALTER TABLE "MITARBEITER" MODIFY ("QUALIFIKATIONEN" NOT NULL ENABLE);
  ALTER TABLE "MITARBEITER" MODIFY ("GEHALT" NOT NULL ENABLE);
  ALTER TABLE "MITARBEITER" MODIFY ("MAX_ARBEITSPENSUM_WOCHE" NOT NULL ENABLE);
  ALTER TABLE "MITARBEITER" MODIFY ("RESSOURCE_ID" NOT NULL ENABLE);
  ALTER TABLE "MITARBEITER" ADD CONSTRAINT "MITARBEITER_PK" PRIMARY KEY ("MITARBEITER_ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA"  ENABLE;
  ALTER TABLE "MITARBEITER" ADD CONSTRAINT "MITARBEITER_CHK1" CHECK (qualifikationen IN ('B�hnentechnik','Lichttechnik','Videotechnik','Backlinetechnik','Pyrotechnik','Sicherheitstechnik','Einlasskontrolle','Ersthelfer','Crowd Controll','Catering','Reinigung','Public Relations')) ENABLE;
--------------------------------------------------------
--  Constraints for Table ARBEITSSCHRITT
--------------------------------------------------------

  ALTER TABLE "ARBEITSSCHRITT" MODIFY ("ARBEITSSCHRITT_ID" NOT NULL ENABLE);
  ALTER TABLE "ARBEITSSCHRITT" MODIFY ("DAUER_MIN" NOT NULL ENABLE);
  ALTER TABLE "ARBEITSSCHRITT" MODIFY ("QUALIFIKATION" NOT NULL ENABLE);
  ALTER TABLE "ARBEITSSCHRITT" MODIFY ("ANZAHL_MITARBEITER" NOT NULL ENABLE);
  ALTER TABLE "ARBEITSSCHRITT" ADD CONSTRAINT "ARBEITSSCHRITTE_PK" PRIMARY KEY ("ARBEITSSCHRITT_ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA"  ENABLE;
  ALTER TABLE "ARBEITSSCHRITT" ADD CONSTRAINT "ARBEITSSCHRITT_CHK1" CHECK (qualifikation IN ('B�hnentechnik','Lichttechnik','Videotechnik','Backlinetechnik','Pyrotechnik','Sicherheitstechnik','Einlasskontrolle','Ersthelfer','Crowd Controll','Catering','Reinigung','Public Relations')) ENABLE;
--------------------------------------------------------
--  Constraints for Table LOCATION
--------------------------------------------------------

  ALTER TABLE "LOCATION" MODIFY ("LOCATION_ID" NOT NULL ENABLE);
  ALTER TABLE "LOCATION" MODIFY ("ANZAHL_SITZPLAETZE" NOT NULL ENABLE);
  ALTER TABLE "LOCATION" MODIFY ("ANZAHL_STEHPLAETZE" NOT NULL ENABLE);
  ALTER TABLE "LOCATION" MODIFY ("ADRESSE" NOT NULL ENABLE);
  ALTER TABLE "LOCATION" MODIFY ("BARRIEREFREI" NOT NULL ENABLE);
  ALTER TABLE "LOCATION" MODIFY ("BEZEICHNUNG" NOT NULL ENABLE);
  ALTER TABLE "LOCATION" ADD CONSTRAINT "LOCATION_PK" PRIMARY KEY ("LOCATION_ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA"  ENABLE;
  ALTER TABLE "LOCATION" ADD CONSTRAINT "LOCATION_CHK1" CHECK (barrierefrei IN ('Y', 'N')) ENABLE;
--------------------------------------------------------
--  Constraints for Table TECHNIK
--------------------------------------------------------

  ALTER TABLE "TECHNIK" MODIFY ("TECHNIK_ID" NOT NULL ENABLE);
  ALTER TABLE "TECHNIK" MODIFY ("KATEGORIE" NOT NULL ENABLE);
  ALTER TABLE "TECHNIK" MODIFY ("MODELL" NOT NULL ENABLE);
  ALTER TABLE "TECHNIK" MODIFY ("KOSTEN" NOT NULL ENABLE);
  ALTER TABLE "TECHNIK" MODIFY ("BETRIEBSKOSTEN_STD" NOT NULL ENABLE);
  ALTER TABLE "TECHNIK" MODIFY ("MIETKOSTEN_TAG" NOT NULL ENABLE);
  ALTER TABLE "TECHNIK" ADD CONSTRAINT "TECHNIK_PK" PRIMARY KEY ("TECHNIK_ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA"  ENABLE;
  ALTER TABLE "TECHNIK" ADD CONSTRAINT "TECHNIK_CHK1" CHECK (kategorie IN ('Schall','Licht','B�hne','Stromerzeugung & Verteilung','Z�une & Absperrungen','Instrumente','Pyrotechnik','�berdachung','Sonstiges')) ENABLE;
--------------------------------------------------------
--  Constraints for Table BEWERTUNG
--------------------------------------------------------

  ALTER TABLE "BEWERTUNG" MODIFY ("BEWERTUNG_ID" NOT NULL ENABLE);
  ALTER TABLE "BEWERTUNG" MODIFY ("BEWERTUNG" NOT NULL ENABLE);
  ALTER TABLE "BEWERTUNG" MODIFY ("VERFASSUNGSDATUM" NOT NULL ENABLE);
  ALTER TABLE "BEWERTUNG" ADD CONSTRAINT "BEWERTUNG_PK" PRIMARY KEY ("BEWERTUNG_ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EINSATZ
--------------------------------------------------------

  ALTER TABLE "EINSATZ" MODIFY ("EINSATZ_ID" NOT NULL ENABLE);
  ALTER TABLE "EINSATZ" MODIFY ("DATUM" NOT NULL ENABLE);
  ALTER TABLE "EINSATZ" MODIFY ("RESSOURCE_ID" NOT NULL ENABLE);
  ALTER TABLE "EINSATZ" ADD CONSTRAINT "EINSATZ_PK" PRIMARY KEY ("EINSATZ_ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TICKET
--------------------------------------------------------

  ALTER TABLE "TICKET" MODIFY ("TICKET_ID" NOT NULL ENABLE);
  ALTER TABLE "TICKET" MODIFY ("PLATZ_NUMMER" NOT NULL ENABLE);
  ALTER TABLE "TICKET" MODIFY ("PREIS" NOT NULL ENABLE);
  ALTER TABLE "TICKET" MODIFY ("PLATZART" NOT NULL ENABLE);
  ALTER TABLE "TICKET" MODIFY ("ERMAESSIGT" NOT NULL ENABLE);
  ALTER TABLE "TICKET" ADD CONSTRAINT "TICKET_PK" PRIMARY KEY ("TICKET_ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA"  ENABLE;
  ALTER TABLE "TICKET" ADD CONSTRAINT "TICKET_CHK1" CHECK (platzart IN ('Stehplatz', 'Sitzplatz Kategorie A', 'Sitzplatz Kategorie B', 'Sitzplatz Kategorie C',  'Sitzplatz Kategorie D',  'Sitzplatz Kategorie E')) ENABLE;
  ALTER TABLE "TICKET" ADD CONSTRAINT "TICKET_CHK2" CHECK (ermaessigt IN ('Y', 'N')) ENABLE;
--------------------------------------------------------
--  Constraints for Table PERSON
--------------------------------------------------------

  ALTER TABLE "PERSON" MODIFY ("PERSON_ID" NOT NULL ENABLE);
  ALTER TABLE "PERSON" MODIFY ("PERSON_ALTER" NOT NULL ENABLE);
  ALTER TABLE "PERSON" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "PERSON" MODIFY ("TELEFONNUMMER" NOT NULL ENABLE);
  ALTER TABLE "PERSON" ADD CONSTRAINT "PERSON_PK" PRIMARY KEY ("PERSON_ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BAND
--------------------------------------------------------

  ALTER TABLE "BAND" ADD CONSTRAINT "BAND_FK1" FOREIGN KEY ("PERSON_ID")
	  REFERENCES "PERSON" ("PERSON_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BEWERTUNG
--------------------------------------------------------

  ALTER TABLE "BEWERTUNG" ADD CONSTRAINT "BEWERTUNG_FK1" FOREIGN KEY ("KUNDE_ID")
	  REFERENCES "KUNDE" ("KUNDE_ID") ENABLE;
  ALTER TABLE "BEWERTUNG" ADD CONSTRAINT "BEWERTUNG_FK2" FOREIGN KEY ("EVENT_ID")
	  REFERENCES "EVENT" ("EVENT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BUCHUNG
--------------------------------------------------------

  ALTER TABLE "BUCHUNG" ADD CONSTRAINT "BUCHUNG_FK1" FOREIGN KEY ("KUNDE_ID")
	  REFERENCES "KUNDE" ("KUNDE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BUCHUNGSPOSITION
--------------------------------------------------------

  ALTER TABLE "BUCHUNGSPOSITION" ADD CONSTRAINT "BUCHUNGSPOSITION_FK1" FOREIGN KEY ("BUCHUNG_ID")
	  REFERENCES "BUCHUNG" ("BUCHUNG_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EINSATZ
--------------------------------------------------------

  ALTER TABLE "EINSATZ" ADD CONSTRAINT "EINSATZ_FK1" FOREIGN KEY ("RESSOURCE_ID")
	  REFERENCES "RESSOURCE" ("RESSOURCE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EVENT
--------------------------------------------------------

  ALTER TABLE "EVENT" ADD CONSTRAINT "EVENT_FK1" FOREIGN KEY ("LOCATION_ID")
	  REFERENCES "LOCATION" ("LOCATION_ID") ENABLE;
  ALTER TABLE "EVENT" ADD CONSTRAINT "EVENT_FK2" FOREIGN KEY ("EVENTKATEGORIE_ID")
	  REFERENCES "EVENTKATEGORIE" ("EVENTKATEGORIE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EVENT_BAND
--------------------------------------------------------

  ALTER TABLE "EVENT_BAND" ADD CONSTRAINT "EVENT_BAND_FK1" FOREIGN KEY ("EVENT_ID")
	  REFERENCES "EVENT" ("EVENT_ID") ENABLE;
  ALTER TABLE "EVENT_BAND" ADD CONSTRAINT "EVENT_BAND_FK2" FOREIGN KEY ("BAND_ID")
	  REFERENCES "BAND" ("BAND_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LOCATION
--------------------------------------------------------

  ALTER TABLE "LOCATION" ADD CONSTRAINT "LOCATION_FK1" FOREIGN KEY ("PERSON_ID")
	  REFERENCES "PERSON" ("PERSON_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RESSOURCE
--------------------------------------------------------

  ALTER TABLE "RESSOURCE" ADD CONSTRAINT "RESSOURCE_FK1" FOREIGN KEY ("MITARBEITER_ID")
	  REFERENCES "MITARBEITER" ("MITARBEITER_ID") ENABLE;
  ALTER TABLE "RESSOURCE" ADD CONSTRAINT "RESSOURCE_FK2" FOREIGN KEY ("TECHNIK_ID")
	  REFERENCES "TECHNIK" ("TECHNIK_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TICKET
--------------------------------------------------------

  ALTER TABLE "TICKET" ADD CONSTRAINT "TICKET_FK1" FOREIGN KEY ("EVENT_ID")
	  REFERENCES "EVENT" ("EVENT_ID") ENABLE;

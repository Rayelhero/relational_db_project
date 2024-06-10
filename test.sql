--MIT CHECK BEIM ERSTELLEN DER TABELLE MACHEN!!
CREATE table test (
    name VARCHAR2(10) check (name IN ('small', 'medium', 'large', 'mittel'))
);
--BEIM INSERTEN DANACH EINMAL COMMIT WORK AUSFÜHREN DAMIT DAS GANZE AUCH ÜBERNOMMEN WIRD
INSERT INTO test 
VALUES ('mittel');
COMMIT; -- VIelleicht auch nur "COMMIT;"

drop table test;



CREATE TABLE Ressource (
    ressource_id INTEGER PRIMARY KEY,
    mitarbeiter_id INTEGER,
    technik_id INTEGER,
    CONSTRAINT chk_ressource CHECK ((mitarbeiter_id IS NOT NULL AND technik_id IS NULL) 
        OR (mitarbeiter_id IS NULL AND technik_id IS NOT NULL)),
    FOREIGN KEY (mitarbeiter_id) REFERENCES Mitarbeiter(mitarbeiter_id),
    FOREIGN KEY (technik_id) REFERENCES Technik(technik_id)
);


CREATE OR REPLACE EDITIONABLE TYPE "ADRESSET" AS OBJECT 
( 
    ort VARCHAR2(50),
    plz VARCHAR2(5),
    strasse VARCHAR2(50),
    hausnummer VARCHAR2(10),
    adresszusatz VARCHAR2(50)
/* TODO enter attribute and method declarations here */ 
);

--Testing how to use user defined dataTypes

--drop table person;

INSERT into person (person_id, name, person_alter, email, TELEFONNUMMER, adresse) 
VALUES ('1', 'pedro', '25', 'info@example.com', '01701741' ,ADRESSET('Breisach', '79206', 'Rheinuferstrasse', '12', ''));
commit; 

INSERT INTO TECHNIK (technik_id, kategorie, modell, kosten, betriebskosten_std, mietkosten_tag) VALUES ('1', 'Licht', 'StratoTech 2000', '1494', '186', '555');


CREATE TABLE "PERSON" 
   (	"PERSON_ID" NUMBER(*,0), 
	"NAME" VARCHAR2(20 BYTE) COLLATE "USING_NLS_COMP", 
	"PERSON_ALTER" NUMBER(*,0), 
	"EMAIL" VARCHAR2(50 BYTE) COLLATE "USING_NLS_COMP", 
	"TELEFONNUMMER" VARCHAR2(25 BYTE) COLLATE "USING_NLS_COMP", 
	"ADRESSE" AdresseT
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "DATA" ;

  REM INSERTING into PERSON
SET DEFINE OFF;

--  DDL for Index PERSON_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PERSON_PK" ON "PERSON" ("PERSON_ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA" ;

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




INSERT INTO LOCATION (location_id, anzahl_sitzplaetze, anzahl_stehplaetze, bezeichnung, adresse, barrierefrei, person_id) VALUES ('12', '469', '1858', 'Crescendo Club', '5 Kipling Street', 'true', '385');

commit;
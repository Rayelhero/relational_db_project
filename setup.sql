--Enumerations:
-- -> werdem via Checks in der Table generation gemacht


--Custom Datatypes:
--Name Datatype
CREATE TYPE NameT AS (
    nachname VARCHAR2(50),
    vorname VARCHAR2(50)
);

--Adresse Datatype
CREATE TYPE AdresseT AS (
    ort VARCHAR2(100),
    pLZ VARCHAR2(5),
    strasse VARCHAR2(100),
    hausnummer VARCHAR2(10),
    adresszusatz VARCHAR2(10)
);

--Zahlungsinformationen Datatype
CREATE TYPE ZahlungsinformationenT (
    art VARCHAR2(30),
    kontoinhaber VARCHAR2(50),
    iBAN_Kontonummer VARCHAR2(34) --Maximallänge nach Wikipedia
);


--Creating Tables
CREATE TABLE band (
    bandname VARCHAR2(100)
    
);

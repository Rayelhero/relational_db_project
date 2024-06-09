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



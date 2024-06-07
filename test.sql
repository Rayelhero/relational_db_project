--MIT CHECK BEIM ERSTELLEN DER TABELLE MACHEN!!
CREATE table test (
    name VARCHAR2(10) check (name IN ('small', 'medium', 'large', 'mittel'))
);
--BEIM INSERTEN DANACH EINMAL COMMIT WORK AUSFÜHREN DAMIT DAS GANZE AUCH ÜBERNOMMEN WIRD
INSERT INTO test 
VALUES ('mittel');
COMMIT WORK; -- VIelleicht auch nur "COMMIT;"

drop table test;
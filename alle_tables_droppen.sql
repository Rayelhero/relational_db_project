
BEGIN
   FOR fk IN (SELECT constraint_name, table_name
                FROM user_constraints
               WHERE constraint_type = 'R'
                 AND status = 'ENABLED')
   LOOP
      EXECUTE IMMEDIATE 'ALTER TABLE ' || fk.table_name || ' DISABLE CONSTRAINT ' || fk.constraint_name;
   END LOOP;
END;
/
BEGIN
   FOR table_row IN (SELECT table_name
                       FROM user_tables)
   LOOP
      EXECUTE IMMEDIATE 'DROP TABLE ' || table_row.table_name || ' CASCADE CONSTRAINTS';
   END LOOP;
END;
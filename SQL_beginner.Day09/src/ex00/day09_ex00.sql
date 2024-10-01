CREATE TABLE person_audit(
created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
type_event CHAR(1) DEFAULT 'I' NOT NULL,
CONSTRAINT ch_type_event CHECK (type_event='I' OR type_event='U' OR type_event='D'),
row_id BIGINT NOT NULL,
name VARCHAR,
age INTEGER,
gender VARCHAR,
address varchar
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() 
RETURNS TRIGGER AS $person_audit$
BEGIN
INSERT INTO person_audit SELECT now(),'I',NEW.*;
RETURN NEW;
END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
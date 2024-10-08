CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() 
RETURNS TRIGGER AS $person_audit$
BEGIN
INSERT INTO person_audit
VALUES(now(),'D',OLD.id,OLD.name,OLD.age,OLD.gender,OLD.address);
RETURN OLD;
END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit
AFTER DELETE ON person
FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;
DROP FUNCTION IF EXISTS fnc_persons_female();
DROP FUNCTION IF EXISTS fnc_persons_male();

CREATE OR REPLACE FUNCTION fnc_persons(IN pgender varchar DEFAULT 'female')
RETURNS TABLE (
    id bigint,
    name varchar,
    age integer,
    gender varchar,
    address varchar
) AS $persons_male_or_female$
SELECT id, name,age,gender,address FROM person WHERE gender=pgender;
$persons_male_or_female$ LANGUAGE sql;

select * from fnc_persons(pgender := 'male');
select * from fnc_persons();

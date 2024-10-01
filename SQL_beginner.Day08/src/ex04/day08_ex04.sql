--сеанс №1
BEGIN ISOLATION LEVEL SERIALIZABLE;
SHOW TRANSACTION ISOLATION LEVEL;

--сеанс №2
BEGIN ISOLATION LEVEL SERIALIZABLE;
SHOW TRANSACTION ISOLATION LEVEL;

--сеанс №1
SELECT * FROM pizzeria WHERE name='Pizza Hut';

--сеанс №2
UPDATE pizzeria SET rating=3 WHERE name='Pizza Hut';
COMMIT;

--сеанс №1
SELECT * FROM pizzeria WHERE name='Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name='Pizza Hut';

--сеанс №2
SELECT * FROM pizzeria WHERE name='Pizza Hut';
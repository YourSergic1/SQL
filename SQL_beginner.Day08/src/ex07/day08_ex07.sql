--сеанс №1
BEGIN ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;

--сеанс №2
BEGIN ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;

--сеанс №1
UPDATE pizzeria SET name='Kazan Pizza 3' WHERE id=10;

--сеанс №2
UPDATE pizzeria SET name='Kazan Pizza 4' WHERE id=11;

--сеанс №1
UPDATE pizzeria SET name='Kazan Pizza 1' WHERE id=11;

--сеанс №2
UPDATE pizzeria SET name='Kazan Pizza' WHERE id=10;

--сеанс №1
COMMIT;

--сеанс №2
COMMIT;
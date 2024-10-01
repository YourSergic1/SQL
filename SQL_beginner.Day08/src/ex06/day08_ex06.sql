--сеанс №1
BEGIN ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;

--сеанс №2
BEGIN ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;

--сеанс №1
SELECT SUM(rating) FROM pizzeria;

--сеанс №2
INSERT INTO pizzeria(id,name,rating)
VALUES(11,'Kazan Pizza 2',4);
COMMIT;

--сеанс №1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;

--сеанс №2
SELECT SUM(rating) FROM pizzeria;
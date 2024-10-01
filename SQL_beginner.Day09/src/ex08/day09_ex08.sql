CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop INTEGER DEFAULT 10)
RETURNS TABLE(num integer) AS $fibonachi$
WITH RECURSIVE fib(num1,num2) AS (
    VALUES(0,1)
    UNION
    SELECT GREATEST(num1,num2), num1+num2 FROM fib
    WHERE num2<pstop)
    SELECT num1 FROM fib;
$fibonachi$ LANGUAGE sql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
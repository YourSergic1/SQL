SELECT name,
lastname,
currency_name,
money * rate_to_usd AS currency_in_usd
FROM(
SELECT COALESCE(u.name, 'not defined') AS name,
COALESCE(u.lastname, 'not defined') AS lastname,
c.name AS currency_name,
b.money,
COALESCE((select rate_to_usd
from currency c
where b.currency_id = c.id and c.updated < b.updated
order by c.updated desc
limit 1),
(select rate_to_usd
from currency c
where b.currency_id = c.id and c.updated > b.updated
order by c.updated asc
limit 1)) AS rate_to_usd
FROM balance b
LEFT JOIN "user" u ON b.user_id = u.id
JOIN (select c.id, c.name from currency c group by c.id, c.name) as c ON c.id = b.currency_id
) ORDER BY 1 DESC,2,3
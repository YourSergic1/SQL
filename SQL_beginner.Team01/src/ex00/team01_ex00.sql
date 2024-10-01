SELECT name,
lastname,
type,
sum(money) AS volume,
currency_name,
last_rate_to_usd,
sum(money) * last_rate_to_usd as total_volume_in_usd
FROM(
SELECT distinct COALESCE(u.name, 'not defined') as name,
COALESCE(u.lastname, 'not defined') as lastname,
b.type,
b.money,
COALESCE(c.name, 'not defined') as currency_name,
COALESCE(first_value(c.rate_to_usd) over(partition by c.id order by c.updated desc), 1) as last_rate_to_usd
FROM balance b
FULL JOIN "user" u ON b.user_id = u.id
FULL JOIN currency c ON b.currency_id = c.id
) GROUP BY name, lastname, type, currency_name, last_rate_to_usd
ORDER BY 1 DESC,2,3
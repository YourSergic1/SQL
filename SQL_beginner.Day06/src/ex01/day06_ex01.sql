INSERT INTO person_discounts
SELECT 
ROW_NUMBER( ) OVER ( ) AS id,
person_id,
pizzeria_id,
CASE WHEN orders = 1 THEN 10.5
WHEN orders=2 THEN 22
ELSE 30
END
FROM (SELECT person_id,
	m.pizzeria_id,
	count(person_id) AS orders
	FROM person_order 
	JOIN menu m ON m.id=person_order.menu_id
	GROUP BY person_id, m.pizzeria_id
	)
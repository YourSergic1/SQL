WITH peperoni AS (SELECT person.name FROM person_order
JOIN person ON person.id=person_order.person_id
JOIN menu ON menu.id=person_order.menu_id
WHERE person.gender='female' AND menu.pizza_name='pepperoni pizza'),
cheese AS (SELECT person.name FROM person_order
JOIN person ON person.id=person_order.person_id
JOIN menu ON menu.id=person_order.menu_id
WHERE person.gender='female' AND menu.pizza_name='cheese pizza')
SELECT name FROM peperoni
INTERSECT
SELECT name FROM cheese
ORDER BY name
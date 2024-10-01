WITH female AS(SELECT pizzeria.name AS pizzeria_name FROM person_order
JOIN menu ON menu.id=person_order.menu_id
JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
JOIN person ON person.id=person_order.person_id
WHERE person.gender='female'), male AS (SELECT pizzeria.name AS pizzeria_name FROM person_order
JOIN menu ON menu.id=person_order.menu_id
JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
JOIN person ON person.id=person_order.person_id
WHERE person.gender='male')
(SELECT pizzeria_name FROM male
EXCEPT
SELECT pizzeria_name FROM female)
UNION
(SELECT pizzeria_name FROM female
EXCEPT
SELECT pizzeria_name FROM male
)
ORDER BY 1

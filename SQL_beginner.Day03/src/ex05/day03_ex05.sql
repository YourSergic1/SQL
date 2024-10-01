WITH orders AS (SELECT pizzeria.name AS pizzeria_name FROM person_order
JOIN menu ON menu.id=person_order.menu_id
JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
JOIN person ON person.id=person_order.person_id
WHERE person.name='Andrey'), 
visit AS (SELECT pizzeria.name AS pizzeria_name FROM person_visits
JOIN pizzeria ON pizzeria.id=person_visits.pizzeria_id
JOIN person ON person.id=person_visits.person_id
WHERE person.name='Andrey')
SELECT pizzeria_name FROM visit
EXCEPT
SELECT pizzeria_name FROM orders
ORDER BY 1
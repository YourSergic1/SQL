SELECT pizza_name, pizzeria.name AS pizzeria_name FROM menu
INNER JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
INNER JOIN person_order ON person_order.menu_id=menu.id
INNER JOIN person ON person.id=person_order.person_id
WHERE person.name='Denis' OR person.name='Anna'
ORDER BY 1,2
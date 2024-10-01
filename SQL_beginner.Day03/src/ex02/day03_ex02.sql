SELECT pizza_name, price,pizzeria.name FROM menu
JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
EXCEPT
SELECT menu.pizza_name, menu.price,pizzeria.name FROM person_order
JOIN menu ON menu.id=person_order.menu_id
JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
ORDER BY 1,2

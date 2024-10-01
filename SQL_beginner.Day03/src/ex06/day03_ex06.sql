WITH menu1 AS(SELECT menu.id,pizza_name, pizzeria.name AS pizzeria_name_1,price FROM menu
JOIN pizzeria ON pizzeria.id=menu.pizzeria_id),
menu2 AS(SELECT menu.id,pizza_name, pizzeria.name AS pizzeria_name_2,price FROM menu
JOIN pizzeria ON pizzeria.id=menu.pizzeria_id)
SELECT menu1.pizza_name,pizzeria_name_1,menu2.pizzeria_name_2,menu1.price FROM menu1
JOIN menu2 ON menu2.price=menu1.price AND menu2.pizza_name=menu1.pizza_name
WHERE pizzeria_name_1!=pizzeria_name_2
AND menu1.id>menu2.id
ORDER BY 1
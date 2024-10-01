SELECT pizzeria.name,
COUNT(*) AS count_of_orders,
round(avg(price),2) AS average_price,
MAX(price) AS max_price,
MIN(price) AS min_price FROM person_order
JOIN menu ON menu.id=person_order.menu_id
JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
GROUP BY pizzeria.name
ORDER BY 1
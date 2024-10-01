SELECT person.name,
menu.pizza_name,
menu.price,
round(menu.price-(person_discounts.discount*menu.price*0.01)) AS discount_price,
pizzeria.name FROM person_order
JOIN person ON person.id=person_order.person_id
JOIN menu ON menu.id=person_order.menu_id
JOIN person_discounts ON person_discounts.person_id=person.id
JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
ORDER BY 1,2

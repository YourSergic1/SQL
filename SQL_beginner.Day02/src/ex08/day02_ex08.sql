SELECT person.name FROM person_order
JOIN person ON person.id=person_order.person_id
JOIN menu ON menu.id=person_order.menu_id
WHERE (person.address='Samara' OR person.address='Moscow') AND (menu.pizza_name='pepperoni pizza' OR menu.pizza_name='mushroom pizza') AND person.gender='male'
ORDER BY name DESC
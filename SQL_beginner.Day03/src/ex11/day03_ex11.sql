INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (19, 2, 'greek pizza', 800);
UPDATE menu SET price=price*0.9 WHERE pizza_name='greek pizza'
DELETE FROM menu WHERE id=19
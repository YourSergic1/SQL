INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (19, 2, 'greek pizza', 800);
INSERT INTO person_order(id,person_id,menu_id,order_date)
SELECT
    generate_series((SELECT MAX(id) FROM person_order)+1,
	(SELECT MAX(id) FROM person_order)+(SELECT MAX(id) FROM person),
	1),
    generate_series((SELECT MIN(id) FROM person),
	(SELECT MAX(id)  FROM person),
	1),
    (SELECT id FROM menu WHERE pizza_name='greek pizza'),
	'2022-02-25'
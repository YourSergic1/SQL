SELECT id FROM menu
EXCEPT
SELECT menu_id AS id FROM person_order
ORDER BY id
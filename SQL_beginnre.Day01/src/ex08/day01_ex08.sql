SELECT order_date, CONCAT(pv.name,' (age:',pv.age,')') AS person_information FROM person_order
NATURAL JOIN (SELECT id AS person_id, name,age FROM person)AS pv
ORDER BY order_date,person_information
SELECT name, rating FROM pizzeria
WHERE id NOT IN (SELECT pizzeria_id AS id FROM person_visits)
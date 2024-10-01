SELECT pizzeria.name AS pizzeria_name FROM person_visits
JOIN person ON person.id=person_visits.person_id
JOIN menu ON menu.pizzeria_id=person_visits.pizzeria_id
JOIN pizzeria ON menu.pizzeria_id=pizzeria.id
WHERE visit_date='2022-01-08' AND price<800 AND person.name='Dmitriy'
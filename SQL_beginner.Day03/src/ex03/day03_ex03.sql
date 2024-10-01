WITH female AS(SELECT pizzeria.name AS pizzeria_name FROM person_visits
JOIN pizzeria ON pizzeria.id=person_visits.pizzeria_id
JOIN person ON person.id=person_visits.person_id
WHERE person.gender='female'), male AS (SELECT pizzeria.name AS pizzeria_name FROM person_visits
JOIN pizzeria ON pizzeria.id=person_visits.pizzeria_id
JOIN person ON person.id=person_visits.person_id
WHERE person.gender='male')
(SELECT pizzeria_name
FROM female
EXCEPT ALL 
SELECT pizzeria_name
FROM male)
UNION ALL
(SELECT pizzeria_name
FROM male
EXCEPT ALL 
SELECT pizzeria_name
FROM female)
ORDER BY 1
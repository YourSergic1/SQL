WITH cte_visit AS(
SELECT person_id, COUNT(*) as count_of_visits FROM person_visits
GROUP BY person_id
)
SELECT person.name, count_of_visits FROM cte_visit
JOIN person ON person.id=cte_visit.person_id
WHERE count_of_visits>3
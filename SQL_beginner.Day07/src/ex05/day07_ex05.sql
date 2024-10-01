WITH cte_order AS(
SELECT person_id, COUNT(*) as count FROM person_order
GROUP BY person_id
)
SELECT person.name FROM cte_order
JOIN person ON person.id=cte_order.person_id
WHERE count>0
ORDER BY 1
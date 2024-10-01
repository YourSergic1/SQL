WITH cte_visit AS (
SELECT pizzeria.name AS name,COUNT(*) AS count FROM person_visits
JOIN pizzeria ON pizzeria.id=person_visits.pizzeria_id
GROUP BY pizzeria.name
),
cte_order AS (SELECT pizzeria.name AS name,COUNT(*)AS count FROM person_order
JOIN menu ON menu.id=person_order.menu_id
JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
GROUP BY pizzeria.name
)
SELECT pizzeria.name,COALESCE(cte_order.count,0)+COALESCE(cte_visit.count,0) AS total_count FROM pizzeria
FULL JOIN cte_order ON cte_order.name=pizzeria.name
FULL JOIN cte_visit ON cte_visit.name=pizzeria.name
ORDER BY 2 DESC,1
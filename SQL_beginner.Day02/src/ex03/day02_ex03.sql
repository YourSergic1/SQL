WITH cte AS (SELECT missing_date::date FROM generate_series(
	  '2022-01-01', 
  '2022-01-10', 
  interval '1 day')AS missing_date),
cte2 AS (SELECT visit_date FROM person_visits WHERE person_id=1 OR person_id=2)
SELECT missing_date
FROM cte
EXCEPT
SELECT visit_date 
FROM cte2
ORDER BY missing_date  
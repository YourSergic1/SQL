SELECT address,
round(MAX(age)::numeric-(MIN(age)::numeric/MAX(age)::numeric),2) AS formula,
round(AVG(age),2) AS average,
(CASE
WHEN (MAX(age)::numeric-(MIN(age)::numeric/MAX(age)::numeric)) > AVG(age)
THEN TRUE
ELSE FALSE
END) AS comparison
FROM person
GROUP BY address
ORDER BY 1
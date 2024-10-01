CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts(person_id,pizzeria_id);

SET enable_seqscan TO ON;
EXPLAIN ANALYZE 
SELECT discount FROM person_discounts
WHERE person_id=8 AND pizzeria_id=2;

SET enable_seqscan TO OFF;
EXPLAIN ANALYZE 
SELECT discount FROM person_discounts
WHERE person_id=7 AND pizzeria_id=1;
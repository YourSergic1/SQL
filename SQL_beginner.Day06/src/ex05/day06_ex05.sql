COMMENT ON TABLE person_discounts IS 'Table of personal discounts for customers';
COMMENT ON COLUMN person_discounts.id IS 'ID of row';
COMMENT ON COLUMN person_discounts.person_id IS 'ID of the customer';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'ID of pizzeria where customer have discount';
COMMENT ON COLUMN person_discounts.discount IS 'Size of discount';
SELECT c1.*
FROM customers c1
JOIN customers c2 ON 
    LOWER(TRIM(REPLACE(c1.first_name, '.', ''))) = LOWER(TRIM(REPLACE(c2.first_name, '.', '')))
    AND LOWER(TRIM(REPLACE(c1.last_name, '.', ''))) = LOWER(TRIM(REPLACE(c2.last_name, '.', '')))
    AND c1.customer_id < c2.customer_id;

DELETE c1
FROM customers c1
JOIN customers c2 ON 
    LOWER(TRIM(REPLACE(c1.first_name, '.', ''))) = LOWER(TRIM(REPLACE(c2.first_name, '.', '')))
    AND LOWER(TRIM(REPLACE(c1.last_name, '.', ''))) = LOWER(TRIM(REPLACE(c2.last_name, '.', '')))
    AND c1.customer_id > c2.customer_id;

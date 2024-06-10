-- Assuming the table is named 'messy_data'

SELECT 
    CAST(date_string AS DATE) AS date_column, 
    CAST(REGEXP_REPLACE(mixed_column, '[^0-9.]', '', 'g') AS NUMERIC) AS numeric_column,
    CASE WHEN boolean_column = 0 THEN FALSE ELSE TRUE END AS boolean_column
FROM messy_data;
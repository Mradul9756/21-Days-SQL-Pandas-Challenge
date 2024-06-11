-- Create the dimension table
CREATE TABLE DIM_TRANSACTION_CATEGORY (
    transaction_category_id INT PRIMARY KEY,
    transaction_category_name VARCHAR(255)
);

-- Populate the dimension table (example)
INSERT INTO DIM_TRANSACTION_CATEGORY (transaction_category_id, transaction_category_name)
VALUES (1, 'Income'), (2, 'Expense'), (3, 'Transfer'); 

-- Alter the fact table to add a foreign key column
ALTER TABLE FACT_TRANSACTIONS
ADD COLUMN transaction_category_id INT;

-- Update the fact table to link to the dimension table
UPDATE FACT_TRANSACTIONS ft
SET ft.transaction_category_id = dtc.transaction_category_id
FROM DIM_TRANSACTION_CATEGORY dtc
WHERE ft.transaction_category_name = dtc.transaction_category_name;

-- Drop the original transaction_category_name column (optional)
ALTER TABLE FACT_TRANSACTIONS
DROP COLUMN transaction_category_name;
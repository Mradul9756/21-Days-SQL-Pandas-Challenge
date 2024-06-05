CREATE TABLE customers ( 
    customer_id INT PRIMARY KEY, 
    first_name VARCHAR(50), 
    last_name VARCHAR(50), 
    email VARCHAR(100) UNIQUE, -- Enforce email uniqueness 
    phone VARCHAR(20), 
    address VARCHAR(255) 
);


INSERT INTO customers (customer_id, first_name, last_name, email, phone, address) VALUES
(1, 'John', 'Smith', 'john.smith@email.com', '123-456-7890', '123 Main St.'),
(2, 'Jane', 'Doe', 'jane.doe@email.com', '987-654-3210', '456 Elm St.'),
(3, 'john', 'smith', 'johnsmith@email.com', '123-456-7890', '123 Main St.'),
(4, 'Robert', 'Downey Jr.', 'r.downey@email.com', '555-123-4567', '789 Oak St.'),
(5, 'R.', 'Downey Jr.', 'rdowneyjr@email.com', '555-123-4567', '789 Oak St.');


CSV:

customer_id,first_name,last_name,email,phone,address 
1,John,Smith,john.smith@email.com,123-456-7890,123 Main St. 
2,Jane,Doe,jane.doe@email.com,987-654-3210,456 Elm St. 
3,john,smith,johnsmith@email.com,123-456-7890,123 Main St. 
4,Robert,Downey Jr.,r.downey@email.com,555-123-4567,789 Oak St. 
5,R.,Downey Jr.,rdowneyjr@email.com,555-123-4567,789 Oak St.
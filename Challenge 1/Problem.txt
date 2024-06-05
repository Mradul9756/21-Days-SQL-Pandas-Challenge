"Data scientists spend 80% of their time cleaning data"? Yeah, it's not a joke. Most data cleaning boils down to these three tasks:
-> Removing Duplicates
-> Correcting Formats
-> Applying Business Rules (While working on a reference data import project, It's a requirement for me to add an auto-incrementing integer ID column for all tables before importing them into the production environment.)

To kick things off, I've got data cleaning challenges for you.

SQL Challenge: 

You're working with a table called customers which has the following schema:
	customer_id INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(100),
	phone VARCHAR(20),
	address VARCHAR(255)

The customers table contains duplicate customer records due to data entry errors and inconsistencies. Some duplicates are exact matches, while others have minor variations like:

-> Different Cases: "john Smith" vs. "John Smith"
-> Different Name Formats: "Robert Downey Jr." vs. "R. Downey Jr."
-> Missing or Extra Spaces: " Jane Doe" vs. "Jane Doe"

Task: 
-> Identify Duplicates: Write a SQL query that identifies all duplicate customer records, taking into account potential variations in names.
-> Remove Duplicates: Write a SQL query that removes all duplicate records, keeping only one copy of each unique customer record.

Additional Considerations:
-> You cannot modify the existing customers table.
-> You can create temporary tables or views as needed.
-> Consider using string functions (e.g., LOWER, TRIM, REPLACE) to normalize data and improve duplicate detection.

Now, can you replicate your solution using Pandas?

Task remains the same:
-> Load the Data: Read the same CSV file containing customer data into a Pandas DataFrame. (Remember, it has the same structure as the SQL table.)
-> Identify Duplicates: Find all duplicate customer records, keeping in mind those pesky variations in names (cases, different formats, etc.).
-> Remove Duplicates: Eliminate the duplicates, leaving only one unique record for each customer.
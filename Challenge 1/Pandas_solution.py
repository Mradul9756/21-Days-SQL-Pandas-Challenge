import pandas as pd

df = pd.read_csv('Customers.csv')

# Normalize names
df['norm_first_name'] = df['first_name'].astype(str).str.lower().str.strip().str.replace('.', '', regex=False)
df['norm_last_name'] = df['last_name'].astype(str).str.lower().str.strip().str.replace('.', '', regex=False)

# Identify duplicates (keep the first occurrence)
duplicates = df.duplicated(subset=['norm_first_name', 'norm_last_name'], keep='first')

# Remove duplicates
df_cleaned = df[~duplicates].drop(columns=['norm_first_name', 'norm_last_name'])

# Optionally, save cleaned data to a new file
df_cleaned.to_csv('cleaned_customers.csv', index=False)

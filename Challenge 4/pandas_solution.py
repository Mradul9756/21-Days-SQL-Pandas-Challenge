import pandas as pd

df['date_column'] = pd.to_datetime(df['date_string'])
df['numeric_column'] = df['mixed_column'].astype(str).str.replace(r'[^0-9.]', '', regex=True).astype(float)  
df['boolean_column'] = df['boolean_column'].astype(bool)
import pandas as pd

def remove_consecutive_values(df):
  return df[df['cash_flow'] != df['cash_flow'].shift()]

# Ex dataframe
df = pd.DataFrame({'cash_flow': [1000,1000,1000,1500,1500,1000,1200,1200,1800,1800]})

# Filter Dataframe
result = remove_consecutive_values(df.copy())
print(result)

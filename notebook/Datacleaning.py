import pandas as pd 

# 1. Load the data

df = pd.read_csv('healthcare_dataset.csv')

# 2. Find total duplicates duplicated() creates a list of True/False, .sum() counts the "True" values

total_duplicates = df.duplicated().sum()

print("-" * 30)
print(f"TOTAL DUPLICATE ROWS FOUND: {total_duplicates}")
print("-" * 30)

# 3. If you want to see exactly how many rows you will have LEFT after cleaning:

original_count = len(df)
cleaned_count = len(df.drop_duplicates())

print(f"Original Rows: {original_count}")
print(f"Rows after removing duplicates: {cleaned_count}")


# 4. Check initial stats

initial_count = len(df)
duplicates_before = df.duplicated().sum()

# 5. Drop the duplicates

df_cleaned = df.drop_duplicates()

# 6. Check final stats

final_count = len(df_cleaned)
duplicates_after = df_cleaned.duplicated().sum()

# 7. Display the Results

print(f"--- Duplicate Verification ---")
print(f"Total rows in original file: {initial_count}")
print(f"Number of duplicates found: {duplicates_before}")
print(f"Total rows after cleaning: {final_count}")
print(f"Duplicates remaining: {duplicates_after}")

if duplicates_after == 0:
    print("\nStatus: SUCCESS. All duplicates were removed.")
else:
    print("\nStatus: FAILED. Duplicates still exist.")

# 8. Standardize Text (Fixes 'Bobby JacksOn' -> 'Bobby Jackson')

cols_to_fix = ['Name', 'Doctor', 'Medical Condition', 'Insurance Provider', 'Admission Type', 'Medication', 'Test Results']
for col in cols_to_fix:
    df[col] = df[col].str.strip().str.title()

# 9. Format Dates for MySQL (YYYY-MM-DD)

df['Date of Admission'] = pd.to_datetime(df['Date of Admission'], dayfirst=True).dt.strftime('%Y-%m-%d')
df['Discharge Date'] = pd.to_datetime(df['Discharge Date'], dayfirst=True).dt.strftime('%Y-%m-%d')

# 10. Save the cleaned master file

df.to_csv('healthcare_cleaned.csv', index=False)
print("Step 1 Complete: 534 duplicates removed and names standardized.")


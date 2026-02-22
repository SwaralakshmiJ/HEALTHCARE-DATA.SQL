SELECT  * FROM healthcare_cleaned;
/*Query: High-Bill, Short-Stay Anomalies
This finds patients charged over $45,000 for a stay of 1 day or less.*/
SELECT 
    Name, 
    [Medical_Condition], 
    [Admission_Type],
    DATEDIFF(day, [Date_of_Admission], [Discharge_Date]) AS Days_In_Hospital,
    [Billing_Amount]
FROM [healthcare_cleaned]
WHERE DATEDIFF(day, [Date_of_Admission], [Discharge_Date]) <= 1 
  AND [Billing_Amount] > 45000
ORDER BY [Billing_Amount] DESC;

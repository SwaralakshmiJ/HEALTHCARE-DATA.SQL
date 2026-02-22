/*
Identifying Revenue Leakage by Insurance Provider
This query helps you see which insurance providers are associated with the most "High Risk" billing anomalies.*/
SELECT 
    [Insurance_Provider], 
    COUNT(*) AS High_Risk_Cases,
    SUM([Billing_Amount]) AS Potential_Leakage_Amount
FROM healthcare_cleaned
WHERE 
    DATEDIFF(day, [Date_of_Admission], [Discharge_Date]) <= 1 
    AND [Billing_Amount] > 45000
GROUP BY [Insurance_Provider]
ORDER BY Potential_Leakage_Amount DESC;
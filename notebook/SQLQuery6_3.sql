/*Finding "Repeat" Leakage by Doctors
This identifies if certain doctors are consistently associated with high-billing short-stay cases.*/
SELECT 
    Doctor, 
    COUNT(*) AS Leakage_Incident_Count,
    AVG([Billing_Amount]) AS Avg_Leakage_Bill
FROM healthcare_cleaned
WHERE 
    DATEDIFF(day, [Date_of_Admission], [Discharge_Date]) <= 1 
    AND [Billing_Amount] > 45000
GROUP BY Doctor
HAVING COUNT(*) > 1  -- Doctors with more than 1 flagged case
ORDER BY Leakage_Incident_Count DESC;
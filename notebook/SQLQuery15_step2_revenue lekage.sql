SELECT 
    p.[Name] AS Patient,
    d.[Doctor] AS Physician,
    a.[Billing_Amount],
    DATEDIFF(day, a.[Date_of_Admission], a.[Discharge_Date]) AS Days_Stayed
FROM Admissions a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
WHERE 
    DATEDIFF(day, a.[Date_of_Admission], a.[Discharge_Date]) <= 1 
    AND a.[Billing_Amount] > 45000;
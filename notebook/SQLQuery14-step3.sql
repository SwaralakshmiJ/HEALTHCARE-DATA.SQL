-- 1. Move Patient Data
INSERT INTO Patients ([Name], [Age], [Gender], [Blood Type])
SELECT DISTINCT [Name], [Age], [Gender], [Blood Type] 
FROM [healthcare_cleaned];

-- 2. Move Doctor Data
INSERT INTO Doctors ([Doctor])
SELECT DISTINCT [Doctor] 
FROM [healthcare_cleaned];

-- 3. Move Admissions Data (Linking IDs)
INSERT INTO Admissions (
    PatientID, DoctorID, [Medical Condition], [Date of Admission], 
    [Discharge Date], [Insurance Provider], [Billing Amount], 
    [Room Number], [Admission Type], [Medication], [Test Results]
)
SELECT 
    p.PatientID, 
    d.DoctorID, 
    h.[Medical Condition], 
    h.[Date of Admission], 
    h.[Discharge Date], 
    h.[Insurance Provider], 
    h.[Billing Amount], 
    h.[Room Number],
    h.[Admission Type],
    h.[Medication], 
    h.[Test Results]
FROM [healthcare_cleaned] h
JOIN Patients p ON h.[Name] = p.[Name] AND h.[Age] = p.[Age]
JOIN Doctors d ON h.[Doctor] = d.[Doctor];
GO
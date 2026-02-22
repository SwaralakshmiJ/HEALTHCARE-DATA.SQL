
-- This tells you exactly what SQL calls your columns
SELECT TOP 0 * FROM [healthcare_cleaned];

-- Remove old versions to avoid "Already exists" errors
IF OBJECT_ID('Admissions', 'U') IS NOT NULL DROP TABLE Admissions;
IF OBJECT_ID('Patients', 'U') IS NOT NULL DROP TABLE Patients;
IF OBJECT_ID('Doctors', 'U') IS NOT NULL DROP TABLE Doctors;
GO

-- Create the 3NF Structure
CREATE TABLE Patients (
    PatientID INT IDENTITY(1,1) PRIMARY KEY,
    [Name] NVARCHAR(255),
    [Age] INT,
    [Gender] NVARCHAR(50),
    [Blood Type] NVARCHAR(50)
);

CREATE TABLE Doctors (
    DoctorID INT IDENTITY(1,1) PRIMARY KEY,
    [Doctor] NVARCHAR(255)
);

CREATE TABLE Admissions (
    AdmissionID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
    DoctorID INT FOREIGN KEY REFERENCES Doctors(DoctorID),
    [Medical_Condition] NVARCHAR(255),
    [Date_of_Admission] DATETIME,
    [Discharge_Date] DATETIME,
    [Insurance_Provider] NVARCHAR(255),
    [Billing_Amount] FLOAT, 
    [Room_Number] INT,
    [Admission_Type] NVARCHAR(50),
    [Medication] NVARCHAR(255),
    [Test_Results] NVARCHAR(255)
);
GO

-- 1. Insert unique patients
INSERT INTO Patients ([Name], [Age], [Gender],  [Blood Type])
SELECT DISTINCT [Name], [Age], [Gender], [Blood_Type] 
FROM [healthcare_cleaned];

-- 2. Insert unique doctors
INSERT INTO Doctors ([Doctor])
SELECT DISTINCT [Doctor] 
FROM [healthcare_cleaned];

-- 3. The Big JOIN: Link IDs and move all admission records
INSERT INTO Admissions (
    PatientID, DoctorID, [Medical_Condition], [Date_of_Admission], 
    [Discharge_Date], [Insurance_Provider], [Billing_Amount], 
    [Room_Number], [Admission_Type], [Medication], [Test_Results]
)
SELECT 
    p.PatientID, 
    d.DoctorID, 
    h.[Medical_Condition], 
    h.[Date_of_Admission], 
    h.[Discharge_Date], 
    h.[Insurance_Provider], 
    h.[Billing_Amount], 
    h.[Room_Number],
    h.[Admission_Type],
    h.[Medication], 
    h.[Test_Results]
FROM [healthcare_cleaned] h
JOIN Patients p ON h.[Name] = p.[Name] AND h.[Age] = p.[Age] AND h.[Gender] = p.[Gender]
JOIN Doctors d ON h.[Doctor] = d.[Doctor];
GO

SELECT TOP 10 * FROM Patients;
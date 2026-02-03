# Hospital Operational Intelligence : IDENTIFYING REVENUE LEAKAGE THROUGH SQL ANALYTICS 

## 📌 Project Overview
This project demonstrates a full-cycle Data Engineering and Analytics workflow. It transforms a raw healthcare dataset of 55,500+ records into a structured Relational Database. The system is designed to provide "Operational Intelligence"—specifically identifying **Revenue Leakage** and **Doctor Efficiency** through advanced SQL analysis.

---

## 🛠 Tech Stack
* **Language:** Python 3.x (Pandas for Data Manipulation)
* **Database:** Microsoft SQL server MSSQL (Relational Modeling & 3NF Schema)
* **Environment:** VS Code (Python) Concepts: Data Normalization, ETL (Extract, Transform, Load), Revenue Leakage Analysis.

📖 Theoretical Framework
## 1. The ETL Process (Extract, Transform, Load)
This project follows the standard data engineering lifecycle:

*Extract: Pulling raw patient data from a CSV source.

*Transform: Using Python to handle "dirty data." This includes deduplication (removing 534 redundant entries) and case standardization.

*Load: Migrating the high-integrity data into a MySQL environment for permanent storage.

## 2. Database Normalization (3rd Normal Form)
To ensure Data Integrity and prevent anomalies, I moved from a "Flat File" structure to a Relational Schema following 3rd Normal Form (3NF) rules:

*Eliminating Redundancy: Instead of repeating patient details for every visit, unique data is stored in a Patients table and referenced via Foreign Keys.

*Data Consistency: Separate tables for Doctors and Admissions ensure that a change in a doctor's name only needs to be updated in one place.

## 3. Operational Intelligence & Business Logic
The project aims to solve two specific business problems:

*Revenue Leakage: Identifying instances where the Billing Amount is statistically lower than the average for complex conditions (e.g., Cancer), suggesting errors in insurance claims.

*Provider Efficiency: Analyzing the throughput of clinicians by measuring patient volume against treatment outcomes.

---

## STEPS INVOLVED 
## STEP 1: DATA CLEANING - PYTHON AND ETL
The raw data contained inconsistencies that would compromise database integrity. Using Pandas, I performed the following:

Duplicate Elimination: Successfully identified and removed 534 duplicate records.

Standardization: Fixed messy capitalization (e.g., andrEw waTtS → Andrew Watts) using .str.title().

Data Formatting: Standardized date formats to YYYY-MM-DD to ensure successful MySQL migration.

Financial Precision: Rounded billing amounts to 2 decimal places for accounting accuracy.

## STEP 2: SQL QUERY 
To minimize data redundancy, I normalized the dataset into a 3rd Normal Form (3NF) schema:

Patients Table: Contains unique patient demographics.

Doctors Table: A master list of clinicians.

Admissions Table: A transaction-level table linking Patients and Doctors via Foreign Keys.

## 📁 Repository Structure
```text
├── data/
│   ├── healthcare_dataset.csv     # Raw messy data (Original)
│   └── healthcare_cleaned.csv     # Output after Python processing
├── scripts/
│   ├── data_cleaning.py           # Python script for ETL/Preprocessing
│   └── analysis_queries.sql       # SQL script for Schema & Business Logic
└── README.md                      # Project documentation (This file)




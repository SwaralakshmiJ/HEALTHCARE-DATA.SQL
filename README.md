# Hospital Operational Intelligence : IDENTIFYING REVENUE LEAKAGE THROUGH SQL ANALYTICS 

## 📌 Project Overview
This project demonstrates a full-cycle Data Engineering and Analytics workflow. It transforms a raw healthcare dataset of 55,500+ records into a structured Relational Database. The system is designed to provide "Operational Intelligence"—specifically identifying **Revenue Leakage** and **Doctor Efficiency** through advanced SQL analysis.

---

## 🛠 Tech Stack
* **Language:** Python 3.x (Pandas for Data Manipulation)
* **Database:** MySQL (Relational Modeling & 3NF Schema)
* **Environment:** VS Code

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




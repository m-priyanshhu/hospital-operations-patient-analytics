SELECT * FROM hospital_records;

--Q1. How many patient records are available in the hospital dataset?
SELECT COUNT(*) AS total_patient_records
FROM hospital_records;


--Q2. Which hospital department handles the highest number of patient records?
SELECT
    department,
    COUNT(*) AS patient_records
FROM hospital_records
GROUP BY department
ORDER BY patient_records DESC;


--Q3. How has the number of hospital admissions changed month by month?
SELECT
    DATE_TRUNC('month', admission_date)::date AS admission_month,
    COUNT(*) AS total_admissions
FROM hospital_records
GROUP BY admission_month
ORDER BY admission_month;


--Q4. What is the average hospital bill per patient record?
SELECT
    ROUND(AVG(total_bill), 2) AS average_hospital_bill
FROM hospital_records;


--Q5. Which hospital departments have the highest average treatment cost?
SELECT
    department,
    ROUND(AVG(total_bill), 2) AS average_bill
FROM hospital_records
GROUP BY department
ORDER BY average_bill DESC;


--Q6. How many patients were admitted through emergency admission compared with regular admission?
SELECT
    admission_type,
    COUNT(*) AS total_admissions
FROM hospital_records
GROUP BY admission_type
ORDER BY total_admissions DESC;


--Q7. Which medical conditions are most frequently recorded among patients?
SELECT
    condition,
    COUNT(*) AS patient_records
FROM hospital_records
GROUP BY condition
ORDER BY patient_records DESC;


--Q8. How much of the total hospital bill is covered by insurance compared with the amount paid directly by patients?
SELECT
    ROUND(SUM(insurance_coverage), 2) AS total_insurance_coverage,
    ROUND(SUM(patient_paid), 2) AS total_patient_paid
FROM hospital_records;


--Q9. What is the overall patient readmission rate?
SELECT
    readmission,
    COUNT(*) AS patient_records,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM hospital_records
GROUP BY readmission
ORDER BY patient_records DESC;


--Q10. What is the distribution of patients by discharge status?
SELECT
    discharge_status,
    COUNT(*) AS patient_records,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM hospital_records
GROUP BY discharge_status
ORDER BY patient_records DESC;
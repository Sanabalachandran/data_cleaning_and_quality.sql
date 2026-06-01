-- Calculating operational enrollment metrics over time
SELECT 
    DATE_TRUNC('month', enrollment_date) AS enrollment_month,
    COUNT(patient_id) AS monthly_new_patients,
    -- Running total across time boundaries
    SUM(COUNT(patient_id)) OVER(ORDER BY DATE_TRUNC('month', enrollment_date)) AS running_total_patients
FROM patients
GROUP BY DATE_TRUNC('month', enrollment_date);

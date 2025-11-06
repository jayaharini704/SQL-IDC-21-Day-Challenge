--Practise Questions

--Answer 1
SELECT COUNT(*) AS total_patients_count FROM patients;

--Answer 2
SELECT AVG(satisfaction) AS avg_satisfaction_score FROM patients;

--Answer 3
SELECT MIN(age) AS Min_age,Max(age) AS Max_age FROM patients;

--Daily Challenge Questions

--Answer
SELECT SUM(patients_request) AS patients_requested_count,
SUM(patients_refused) AS patients_refused_count,
ROUND(AVG(patient_satisfaction),2) AS avg_patient_satisfaction FROM services_weekly;

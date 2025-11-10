--Practise Questions

--Answer 1
SELECT service,SUM(patients_admitted) AS total_patients_admitted
FROM services_weekly
GROUP BY service
HAVING SUM(patients_admitted)>500;


--Answer 2
SELECT service,AVG(patient_satisfaction) as avg_patient_satisfaction
FROM services_weekly
GROUP BY service
HAVING AVG(patient_satisfaction)<75;

--Answer 3
SELECT week,SUM(present) AS total_staff
FROM staff_schedule
GROUP BY week
HAVING SUM(present)<50;

--Daily Challenge Question

--Answer
SELECT service,SUM(patients_refused) AS total_refused,ROUND(AVG(patient_satisfaction),2) AS avg_satisfaction
FROM services_weekly
GROUP BY service
HAVING SUM(patients_refused)>100 AND AVG(patient_satisfaction)<80;
--Practise Questions

--Answer 1
SELECT service,COUNT(*) AS patients_count FROM patients GROUP BY service;

--Answer 2
SELECT service,AVG(age) AS avg_age from patients GROUP BY service;

--Answer 3
SELECT role,COUNT(*) AS staff_count FROM staff GROUP BY role;

--Daily Challenge Questions

--Answer
SELECT 
SUM(patients_admitted) AS total_admitted,
SUM(patients_refused) AS total_refused,
ROUND(
	CASE WHEN SUM(patients_request) = 0 THEN 0
    ELSE (SUM(patients_admitted)/sum(patients_request))*100 END
    , 2) AS admission_rate
FROM services_weekly
GROUP BY service
ORDER BY admission_rate DESC;

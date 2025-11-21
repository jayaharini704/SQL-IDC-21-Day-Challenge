--Practise Questions

--Answer 1
SELECT * FROM patients 
WHERE service IN(SELECT service FROM staff GROUP BY SERVICE HAVING COUNT(*) > 
(SELECT AVG(staff_count) 
FROM (SELECT COUNT(*) AS staff_count FROM staff GROUP BY service)t));

--Answer 2
SELECT * FROM staff WHERE service IN (SELECT service FROM services_weekly WHERE patient_satisfaction<70);

--Answer 3
SELECT * FROM patients WHERE service IN(SELECT service FROM services_weekly GROUP BY service HAVING SUM(patients_admitted)>1000); 

--Daily Challenge Question

--Answer
SELECT patient_id, name, service,satisfaction 
FROM patients WHERE service IN
(SELECT service FROM services_weekly where patients_refused > 0 
GROUP BY service HAVING AVG(patient_satisfaction)< 
(SELECT AVG(patient_satisfaction) FROM services_weekly));

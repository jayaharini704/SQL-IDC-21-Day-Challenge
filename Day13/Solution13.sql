--Practise Questions

--Answer 1
SELECT p.name,s.staff_name,p.service
FROM patients p
JOIN staff s ON
p.service=s.service;

--Answer 2
SELECT sw.week,sw.available_beds,sw.service,sw.patients_request,sw.patients_admitted,sw.patients_refused,s.staff_name,s.role
FROM services_weekly sw JOIN
staff s
ON sw.service=s.service;

--Answer 3
SELECT p.*,s.staff_name
FROM patients p JOIN
staff s
ON p.service=s.service;

--Daily Challenge Question

--Answer
SELECT p.patient_id,p.name,p.age,p.service,COUNT(s.staff_name) AS total_staff_per_service
FROM patients p JOIN staff s ON p.service=s.service
GROUP BY p.patient_id,p.name,p.age,p.service
HAVING total_staff_per_service>5
ORDER BY total_staff_per_service DESC,p.name;

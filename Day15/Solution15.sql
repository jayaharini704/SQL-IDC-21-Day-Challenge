--Practise Questions

--Answer 1
SELECT p.patient_id,p.service,s.staff_name,ss.present
FROM patients p JOIN staff s ON
p.service=s.service
JOIN staff_schedule ss
ON s.staff_id=ss.staff_id
AND s.service=ss.service;

--Answer 2
SELECT sw.service,sw.week,sw.patients_request,sw.patients_admitted,s.staff_name,s.role,ss.present
FROM services_weekly sw LEFT JOIN staff s
ON sw.service=s.service LEFT JOIN
staff_schedule ss
ON s.staff_id=ss.staff_id AND s.service=ss.service;

--Answer 3
SELECT p.patient_id,p.name,p.service,sw.patients_admitted,sw.patients_refused,ss.present
FROM patients p LEFT JOIN services_weekly sw ON 
p.service=sw.service LEFT JOIN
staff_schedule ss ON
sw.week=ss.week AND sw.service=ss.service;


--Daily Challenge Question

--Answer
SELECT sw.service,sw.week,sw.patients_admitted AS total_patients_admitted,sw.patients_refused AS total_patients_refused,
AVG(sw.patient_satisfaction) AS avg_patient_satisfaction,COUNT(DISTINCT s.staff_id) AS staff_count_per_service,
COUNT(DISTINCT CASE WHEN ss.present=1 THEN s.staff_id END) AS total_staff_present 
FROM services_weekly sw LEFT JOIN staff s ON sw.service=s.service 
LEFT JOIN staff_schedule ss ON s.staff_id=ss.staff_id AND sw.week=ss.week AND s.service=ss.service
WHERE sw.week=20
GROUP BY sw.service,sw.week,sw.patients_admitted,sw.patients_refused
ORDER BY total_patients_admitted DESC;


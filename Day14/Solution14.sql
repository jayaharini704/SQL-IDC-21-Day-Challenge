--Practise Questions

--Answer 1
SELECT s.staff_name,s.role,s.service,ss.week,ss.present
FROM staff s LEFT JOIN staff_schedule ss
ON s.staff_name=ss.staff_name;

--Answer 2
SELECT sw.service,s.staff_name
FROM services_weekly sw LEFT JOIN staff s
ON sw.service=s.service;

--Answer 3
SELECT p.patient_id,p.name,p.age,p.service,sw.*
FROM patients p LEFT JOIN services_weekly sw
ON p.service=sw.service;

--Daily Challenge Question

--Answer
SELECT s.staff_id, s.staff_name, s.role, s.service,
COALESCE(SUM(ss.present),0) AS weeks_present
FROM staff s LEFT JOIN staff_schedule ss
ON s.staff_id=ss.staff_id
GROUP BY s.staff_id, s.staff_name, s.role, s.service
ORDER BY weeks_present DESC;


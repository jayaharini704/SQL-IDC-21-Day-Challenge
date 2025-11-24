--Practise Questions

--Answer 1
SELECT name FROM patients 
UNION ALL
SELECT staff_name FROM staff;

--Answer 2
SELECT patient_id,satisfaction,'High' AS category FROM patients WHERE satisfaction>90
UNION ALL
SELECT patient_id,satisfaction,'LOW' AS category FROM patients WHERE satisfaction<50;

--Answer 3
SELECT name FROM patients 
UNION
SELECT staff_name FROM staff;

--Daily Challenge Question

--Answer
SELECT patient_id AS identifier,
name AS full_name,
"Patient" AS type,
service 
FROM patients 
WHERE service IN("surgery","emergency")

UNION ALL

SELECT staff_id AS identifier,
staff_name AS full_name,
"Staff" AS type,
service 
FROM staff 
WHERE service IN("surgery","emergency")

ORDER BY type,service,full_name;

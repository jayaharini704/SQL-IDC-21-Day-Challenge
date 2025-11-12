--Practise Questions

--Answer 1
SELECT patient_id,name,YEAR(arrival_date) AS arrival_year
FROM patients;

--Answer 2
SELECT patient_id,name,
DATEDIFF(departure_date,arrival_date) AS stay_length
FROM patients;

--Answer 3
SELECT patient_id,name,arrival_date
FROM patients
WHERE MONTH(arrival_date)=5;

--Daily Challenge Question

--Answer
SELECT 
  service,
  ROUND(AVG(DATEDIFF(departure_date, arrival_date)), 2) AS avg_stay_length,
  COUNT(patient_id) AS patient_count
FROM patients
GROUP BY service
HAVING AVG(DATEDIFF(departure_date, arrival_date)) > 7
ORDER BY avg_stay_length DESC;
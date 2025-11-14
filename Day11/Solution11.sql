--Practise Questions

--Answer 1
SELECT DISTINCT service FROM patients;

--Answer 2
SELECT DISTINCT role FROM staff;

--Answer 3
SELECT DISTINCT month from services_weekly;

--Daily Challenge Question

--Answer
 SELECT service,event,COUNT(*) AS unique_comb 
 FROM services_weekly 
 WHERE event IS NOT NULL AND event!="none"
 GROUP BY service,event
 ORDER BY unique_comb DESC;

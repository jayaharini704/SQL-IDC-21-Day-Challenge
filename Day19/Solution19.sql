--Practise Questions

--Answer 1
SELECT * FROM (SELECT patient_id,name,service,satisfaction,RANK() OVER(PARTITION BY service ORDER BY satisfaction DESC) AS sat_rank
 FROM patients)pt;

--Answer 2
 SELECT * FROM (SELECT *,ROW_NUMBER() OVER(ORDER BY staff_name) AS row_no FROM staff)st;

--Answer 3
SELECT service,total_admitted,RANK() OVER (ORDER BY total_admitted) as tot_rank
FROM (
	SELECT service,
    SUM(patients_admitted) AS total_admitted
    FROM services_weekly
    GROUP BY service)sw;

--Daily Challenge Question

--Answer
SELECT * FROM 
( SELECT service,week,patient_satisfaction,patients_admitted,
RANK() OVER(PARTITION BY service ORDER BY patient_satisfaction DESC)
AS pat_rank FROM services_weekly)sw
WHERE pat_rank<=3;
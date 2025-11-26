--Practise Questions

--Answer 1
SELECT service,week,patients_admitted,SUM(patients_admitted) 
OVER(PARTITION BY service ORDER BY week) AS running_total FROM services_weekly;

--Answer 2
SELECT service,week,patient_satisfaction,
ROUND(AVG(patient_satisfaction) OVER (PARTITION BY service ORDER BY week ROWs BETWEEN  3 PRECEDING AND CURRENT ROW),2) AS mpv_avg
FROM services_weekly;

--Answer 3
SELECT service,week,patients_refused,SUM(patients_refused) 
OVER(ORDER BY week) AS tot_ref
FROM services_weekly;


--Daily Challenge Question

--Answer
SELECT week,patients_admitted,SUM(patients_admitted) OVER (PARTITION BY service ORDER BY week) AS tot_adm,
AVG(patient_satisfaction) OVER(PARTITION BY service ORDER BY week ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS mov_avg,
patients_admitted-(AVG(patients_admitted) OVER (PARTITION BY service)) AS diff_avg
FROM services_weekly
WHERE week BETWEEN 10 AND 20
ORDER BY service,week;
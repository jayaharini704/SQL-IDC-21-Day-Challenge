--Practise Questions

--Answer 1
SELECT p.*,sw.avg_patient_satisfaction
FROM patients p 
LEFT JOIN 
(SELECT service,AVG(patient_satisfaction) AS avg_patient_satisfaction
FROM services_weekly
GROUP BY service) sw
ON p.service = sw.service;

--Answer 2
WITH service_stats AS (
    SELECT service,
    SUM(patients_admitted) AS total_admitted,
    SUM(patients_refused) AS total_refused
    AVG(patient_satisfaction) AS avg_satisfaction
    FROM services_weekly
    GROUP BY service
)
SELECT * FROM service_stats;

--Answer 3
SELECT s.*,sw.total_patients
FROM staff s
LEFT JOIN
(SELECT service,SUM(patients_admitted) AS total_patients
FROM services_weekly
GROUP BY service ) sw
ON s.service=sw.service;

--Daily Challenge Question

--Answer
WITH service_totals AS (
	SELECT service,SUM(patients_admitted) AS total_admissions
    FROM services_weekly
    GROUP BY service),
overall_avg AS (
	SELECT AVG(total_admissions) as avg_admissions
    FROM service_totals)

SELECT st.service,
st.total_admissions,
st.total_admissions-oa.avg_admissions AS diff_avg,
CASE WHEN st.total_admissions-oa.avg_admissions<st.total_admissions THEN "Above Average" 
WHEN st.total_admissions-oa.avg_admissions=st.total_admissions THEN "Average"
ELSE "Below Average" END AS rank_indicator
FROM service_totals st
CROSS JOIN overall_avg oa
ORDER BY st.total_admissions DESC;
    



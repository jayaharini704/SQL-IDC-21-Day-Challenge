--Practise Questions

--Answer 1
SELECT satisfaction,name,
CASE WHEN satisfaction<40 THEN "Low"
	WHEN satisfaction>=40 AND satisfaction<=70 THEN "Medium"
    ELSE "High" END AS satisfaction_category
FROM patients;

--Answer 2
SELECT staff_name,role,
CASE WHEN role IN ("doctor","nurse") THEN "Medical"
    ELSE "Support" END AS role_type
FROM staff;

--Answer 3
SELECT name,age,
CASE WHEN age>=0 AND age<=18 THEN "0-18"
	 WHEN age>=19 AND age<=40 THEN "19-40"
     WHEN age>=41 AND age<=65 THEN "41-65"
     ELSE "65+" END AS age_group
FROM patients;

--Daily Challenge Question

--Answer
SELECT service,SUM(patients_admitted) AS total_patients,ROUND(AVG(patient_satisfaction),2) AS avg_satisfaction,
CASE WHEN AVG(patient_satisfaction)>=85 THEN "Excellent"
	 WHEN AVG(patient_satisfaction)>=75 THEN "Good"
	 WHEN AVG(patient_satisfaction)>=65 THEN "Fair"
     ELSE "Needs Improvement" END AS performance_category
FROM services_weekly
GROUP BY service
ORDER BY avg_satisfaction DESC;
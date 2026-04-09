--Practise Questions

--Answer 1
WITH service_stats AS(
 SELECT service,
 SUM(patients_admitted) AS total_admitted,
 SUM(patients_refused) AS total_refused,
 ROUND(AVG(patient_satisfaction),2) AS avg_satisfaction
 FROM services_weekly
 GROUP BY service)
 SELECT * FROM service_stats;

--Answer 2
 WITH service_stats AS(
	 SELECT service,
	 SUM(patients_admitted) AS total_admitted,
	 SUM(patients_refused) AS total_refused,
	 AVG(patient_satisfaction) AS avg_satisfaction
	 FROM services_weekly
	 GROUP BY service
     ),
     staff_presence AS(
		SELECT s.staff_id,
        s.service,
        COUNT(CASE WHEN ss.present=1 THEN 1 END) as weeks_present
        FROM staff s 
        LEFT JOIN staff_schedule ss
        ON s.staff_id=ss.staff_id
        GROUP BY s.staff_id,s.service
	),
    staff_metrics AS(
        SELECT sp.service,
        AVG(sp.weeks_present) AS avg_weeks_present
        FROM staff_presence sp
        GROUP BY sp.service
    )
    SELECT st.service,
    st.total_admitted,
    st.total_refused,
    st.avg_satisfaction,
    ROUND(sm.avg_weeks_present,2) as rounded_avg_weeks_present
    FROM service_stats st 
    LEFT JOIN staff_metrics sm
    ON st.service=sm.service;

--Answer 3
 WITH staff_util AS(
        SELECT s.service,
        COUNT(DISTINCT s.staff_id) AS total_staff,
        COUNT(DISTINCT CASE WHEN ss.present=1 THEN staff_id END) AS staff_present
        FROM staff s
        LEFT JOIN staff_schedule ss
        ON s.staff_id=ss.staff_id
        GROUP BY s.service
    )
    SELECT p.patient_id,
    p.patient_name,
    p.service,
    su.total_staff,
    su.staff_present,
    COALESCE(ROUND((su.staff_present*100.0)/NULLIF(su.total_staff,0),2),0) AS util_percentage
    FROM patients p
    LEFT JOIN staff_util su
    ON p.service=su.service;



--Daily Challenge Question

--Answer
WITH service_metrics AS(
	SELECT service,
    SUM(patients_admitted) AS total_admitted,
    SUM(patients_refused) AS total_refused,
    AVG(patient_satisfaction) AS avg_satisfaction
    FROM services_weekly
    GROUP BY service
    ),
    staff_presence AS(
		SELECT s.staff_id,
        s.service,
        COUNT(CASE WHEN ss.present=1 THEN 1 END) AS weeks_present
        FROM staff s
        LEFT JOIN staff_schedule ss
        ON s.staff_id=ss.staff_id
        GROUP BY s.staff_id,s.service
	),
    staff_metrics AS (
		SELECT service,
		COUNT(DISTINCT staff_id) as total_staff,
        ROUND(AVG(weeks_present),2) as avg_weeks_present
        FROM staff_presence
        GROUP BY service
	),
	patient_demo AS (
		SELECT
		service,
		COUNT(DISTINCT patient_id) AS total_patients,
		ROUND(AVG(age),2) AS avg_age
		FROM patients
		GROUP BY service
)
SELECT sm.service,
sm.total_admitted,
sm.total_refused,
sm.avg_satisfaction,
stm.total_staff,
stm.avg_weeks_present,
pd.avg_age,
pd.total_patients,
COALESCE(ROUND((sm.total_admitted * 100.0) / NULLIF(pd.total_patients, 0), 2),0) AS admission_rate,
ROUND(COALESCE((sm.total_admitted * 100.0) / NULLIF(pd.total_patients, 0),0) / NULLIF(sm.avg_satisfaction, 0),2) AS performance_score
FROM service_metrics sm 
LEFT JOIN 
staff_metrics stm ON sm.service=stm.service
LEFT JOIN
patient_demo pd ON sm.service=pd.service;
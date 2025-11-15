--Practise Questions

--Answer 1
SELECT * FROM services_Weekly WHERE event='' OR event IS NULL OR event='none';

--Answer 2
SELECT COUNT(*) AS null_or_empty_count FROM services_weekly WHERE event='' OR event IS NULL OR event='none';

--Answer 3
SELECT DISTINCT service FROM services_weekly WHERE event!='' AND event IS NOT NULL AND event!='none';

--Daily Challenge Question

--Answer
SELECT AVG(patient_satisfaction) AS avg_satisfaction,AVG(staff_morale) AS avg_staff_morale,COUNT(*) AS weeks_count,
CASE WHEN event IS NULL OR event='' or event='none' THEN "No Event" 
	ELSE "With Event" END AS event_status
FROM services_weekly
GROUP BY event_status
ORDER BY avg_satisfaction DESC;

--Practise Questions

--Answer 1
select name from patients order by age desc;

--Answer 2
SELECT * FROM services_weekly ORDER BY week ,patients_request DESC;

--Answer 3
SELECT staff_name FROM staff ORDER BY staff_name;

--Daily Challenge Questions

--Answer
SELECT week,service,patients_refused,patients_request FROM services_weekly ORDER BY patients_refused DESC LIMIT 5;

--Practise Questions

--Answer 1
SELECT UPPER(name) AS Name_UpperCase FROM patients;

--Answer 2
SELECT staff_name,LENGTH(staff_name) AS staff_name_length FROM staff;

--Answer 3
SELECT CONCAT(staff_id,'-',staff_name) AS staff_info FROM staff;

--Daily Challenge Question

--Answer
SELECT patient_id,UPPER(name) AS name_upper,LOWER(service) AS service_lower,
CASE WHEN age>=65 THEN 'Senior'
	WHEN age>=18 THEN 'Adult'
    ELSE 'Minor' END AS age_category,
LENGTH(name) AS name_length
FROM patients
WHERE LENGTH(name)>10;
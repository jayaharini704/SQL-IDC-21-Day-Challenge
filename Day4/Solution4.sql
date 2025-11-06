--Practise Questions

--Answer 1
SELECT * FROM patients LIMIT 5;

--Answer 2
SELECT * FROM patients ORDER BY patient_id LIMIT 10 OFFSET 10;

--Answer 3
SELECT * FROM patients ORDER BY arrival_date DESC LIMIT 10;

--Daily Challenge Questions

--Answer
SELECT patient_id, name, service,satisfaction FROM patients ORDER BY satisfaction DESC LIMIT 5 OFFSET 2;
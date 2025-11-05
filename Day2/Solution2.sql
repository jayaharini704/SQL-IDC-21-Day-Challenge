--Practise Questions

--Answer 1
select name from patients where age>0;

--Answer 2
select staff_name from staff where service="Surgery";

--Answer 3
select week from services_weekly where patients_request>100;

--Daily Challenge Question

--Answer
select patient_id,name,age,satisfaction from patients where service="Surgery" and satisfaction<70;
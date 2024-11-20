USE [diabetes_prediction]
GO

SELECT [EmployeeName]
      ,[Patient_id]
      ,[gender]
      ,[age]
      ,[hypertension]
      ,[heart_disease]
      ,[smoking_history]
      ,[bmi]
      ,[HbA1c_level]
      ,[blood_glucose_level]
      ,[diabetes]
  FROM [dbo].[Diabetes_prediction] 

select Patient_id,age from [Diabetes_prediction]

select EmployeeName,Patient_id from [Diabetes_prediction] where age > 40 AND gender='Female'

select AVG(bmi) from [Diabetes_prediction]

select EmployeeName,Patient_id from [Diabetes_prediction] order by [blood_glucose_level] DESC;

select EmployeeName,Patient_id from diabetes_prediction where diabetes= 1  or hypertension = 1 

select EmployeeName,Patient_id from diabetes_prediction where heart_disease= 1 

select count(Patient_id) from diabetes_prediction where heart_disease= 1

select EmployeeName from diabetes_prediction group by smoking_history,EmployeeName

select count(Patient_id) from diabetes_prediction where smoking_history in ('never','not current','former','ever')

select count(Patient_id) from diabetes_prediction where smoking_history ='current'

select Patient_id,EmployeeName from diabetes_prediction where bmi >(select avg(bmi) from diabetes_prediction)

select Patient_id,EmployeeName from diabetes_prediction where [HbA1c_level]=(select MAX(HbA1c_level)from diabetes_prediction)

select Patient_id,EmployeeName from diabetes_prediction where [HbA1c_level]=(select MIN(HbA1c_level)from diabetes_prediction)

select gender from diabetes_prediction where bmi >(select avg(bmi) from diabetes_prediction)

select patient_id, gender, blood_glucose_level, RANK() OVER(PARTITION BY gender ORDER BY blood_glucose_level) AS glucose_rank_within_gender FROM diabetes_prediction ORDER BY  gender, blood_glucose_level;
 
update diabetes_prediction set smoking_history= 'Ex-smoker' where age>50

insert into diabetes_prediction (Patient_id, EmployeeName, age, gender, smoking_history, hypertension, heart_disease, bmi, HbA1c_level, blood_glucose_level, diabetes) 
values (95478, 'Ali', 35, 'Male', 'Non-smoker', 0, 0, 26.0, 3.0, 126.0, 0);

delete from diabetes_prediction where heart_disease = 1;

select Patient_id from diabetes_prediction where hypertension = 1 except select Patient_id from diabetes_prediction where hypertension = 1 and diabetes = 1;

alter table diabetes_prediction add constraint uc_patient_id unique (patient_id);
Go

create view patient_info as select patient_id, age, bmi from diabetes_prediction;




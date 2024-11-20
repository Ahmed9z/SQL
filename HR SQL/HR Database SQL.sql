SELECT Fname,Lname from Employee where Dno=30 AND salary between 1000 AND 2000

SELECT Pname,Plocation,Dnum from Project

SELECT Fname,Lname,salary*0.10 as "annual column" from Employee

SELECT Fname,Dno from Employee where salary >1000

SELECT Fname,Lname,Salary from Employee where gender="F"

SELECT Fname,Dno from Employee where Superssn=968574

SELECT Pnumber, Pname, Plocation from Project
WHERE (Dnum = 10 OR Dnum = 20) 
  AND (City = 'Cairo' OR City = 'Alex');

select Pname,Plocation from Project where Pname LIKE  'P*'

Create table dependent (
Gender varchar,
BDate int,
Dependent_name varchar,
ESSN int primary key
)

insert into Employee
(
Dno,
Superssn,
SSn,
)
values
(
30,
112233,
666666 ,
)

insert into Employee(Fname,Lname,Dno,Superssn,SSN,BDate,Address,gender,Salary)
values
(Ali,Alaa,30,112233,666666,
10/8/2000,"20 street",male,10000)

Insert into Department (Dname, DNumber, MGRSSN, MGRStartdate)
VALUES ('DEPT IT', 100, 112233, '2006-12-08');

update department
set mgrssn = 555555
where dnumber = 20;

update department
set mgrssn = 968574
where dnumber = 100;

update employee
set superssn = 666666 where ssn = 555555;

update department
set mgrssn = 666666
where dnumber = 10;

update employee
set salary = salary * 1.20
where ssn = 666666;

delete from employee
where ssn = 223344;

SELECT Dnum,Dname,MGRSSN,Fname 
from Departments,Employee where
MGRSSN=Superssn

SELECT Pname,Dname
from Project p,Departments d where
p.Dnum=d.Dnum

SELECT Dependent_name, Fname
from Employee e,Dependent d where
e.SSN=d.ESSN

SELECT e.Fname, p.Pname
FROM (employee e
INNER JOIN works_for w  ON w.ESSn = e.SSN)
INNER JOIN project p ON w.pno = p.pnumber
WHERE e.dno = 10
AND w.hours >= 10
ORDER BY e.Fname;

SELECT Dname 
FROM departments
WHERE Dnum = (
    SELECT Dno
    FROM employees
    ORDER BY SSN
    LIMIT 1
);

SELECT 
    D.Dname AS Department_Name,
    D.Dnum AS Department_Number,
    COUNT(E.SSN) AS Number_of_Employees
FROM 
    Departments D,
    Employee E
WHERE 
    D.Dnum = E.Dno
GROUP BY 
    D.Dname, D.Dnum
HAVING
   AVG(E.Salary) < 1200;



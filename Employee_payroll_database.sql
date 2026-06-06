CREATE DATABASE library_db;
USE library_db;
Create table Employee_details(
    employee_id int primary key,
    employee_name varchar(25),
    department_id int,
    designation varchar(20)
);
Create table Department(
    department_id int primary key,
    department_name varchar(60)
);
Create table Payroll(
    payroll_id int primary key,
    employee_id int,
    basic_salary int,
    bonus  int,
    deductions int,
    net_salary int,
    foreign key (employee_id) References Employee_details (employee_id)
);
Insert into Department values
(1, 'IT'),
(2, 'IT'),
(3, 'Sales'),
(4, 'Non IT');
Insert Into Employee_details values
(678, 'harish', 1, 'Software Developer'),
(957, 'Harsha', 2, 'Software Engineer'),
(607, 'ammu', 3, 'Sales manager'),
(801, 'Mommy', 4, 'operation executive');
Insert into Payroll values
(1, 678, 60000, 15000, 5000, 70000),
(2, 957, 50000, 10000, 3000, 57000),
(3, 607, 30000, 6000, 2000, 34000),
(4, 801, 25000, 2000, 1000, 26000);
Select * from Employee_details;
Select * from Department;
Select * from Payroll;
Select Employee_details.employee_name,
       Department.department_name,
       Payroll.basic_salary,
       Payroll.bonus,
       Payroll.deductions,
       Payroll.net_salary
 from Payroll
 JOIN Employee_details
 on Payroll.employee_id = Employee_details.employee_id
 JOIN Department
 on Employee_details.department_id = Department.department_id;
Select * from Payroll Where net_salary >30000;
 Update Payroll Set bonus = 20000 Where employee_id = 678;
Select * from Payroll Where employee_id = 678;
Delete from Payroll where payroll_id = 3;
Select * from Payroll;
Create VIEW  Employee_salary_details As
Select Employee_details.employee_name,
       Department.department_name,
       Payroll.net_salary
from Payroll
JOIN Employee_details
on Payroll.employee_id = Employee_details.employee_id
JOIN Department
on Employee_details.department_id = Department.department_id;
Select * from Employee_salary_details;
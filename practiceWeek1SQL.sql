-- task1 
--Create a database to store employee records and name it
-- techmac_db

create schema techmac_db;

use techmac_db;

-- task 2
--Create three tables to store the details of the employees of
--the three start-ups. Name the tables techhyve_employees, 
--techcloud _employees, and techsoft _employees. Each table must
--be designed to store the employee ID, first name, last name,
-- gender, and age

create table techhyve_employees(
employeeid int, 
first_name varchar(20), 
last_name varchar(20), 
gender varchar(6), 
age int,
primary key (employeeid),
check (age between 21 and 55));

create table techcloud_employees(
employeeid int, 
first_name varchar(20), 
last_name varchar(20), 
gender varchar(6), 
age int,
primary key (employeeid),
check (age between 21 and 55));

create table techsoft_employees(
employeeid int, 
first_name varchar(20), 
last_name varchar(20), 
gender varchar(6), 
age int,
primary key (employeeid),
check (age between 21 and 55));

-- task 3
-- Alter the three tables and add a new column 
-- Communication_Proficiency.

alter table techhyve_employees
add column communication_proficiency int;

alter table techhyve_employees
add check (communication_proficiency between 1 and 5),
alter communication_proficiency set default 1 ;

alter table techcloud_employees
add column communication_proficiency int;

alter table techcloud_employees
add check (communication_proficiency between 1 and 5),
alter communication_proficiency set default 1 ;

alter table techsoft_employees
add column communication_proficiency int;

alter table techsoft_employees
add check (communication_proficiency between 1 and 5),
alter communication_proficiency set default 1 ;

-- task 4
-- Insert employee data in the three tables, techhyve_employees, 
-- techcloud _employees, and techsoft_employees

insert into techhyve_employees
values 
(0001, 'Eli', 'Evans', 'Male', 26, 1),
(0002, 'Carlos', 'Simmons', 'Male', 32, 2),
(0003, 'Kathie', 'Bryant', 'Female', 23, 1),
(0004, 'Joey', 'Hughes', 'Male', 41, 4),
(0005, 'Alice', 'Matthews', 'Female', 52, 4);

insert into techcloud_employees
values 
(0001, 'Teresa', 'Bryant', 'Female', 39, 2),
(0002, 'Alexis', 'Patterson', 'Male', 48, 5),
(0003, 'Rose', 'Bell', 'Female', 42, 3),
(0004, 'Gemma', 'Watkins', 'Female', 44, 3),
(0005, 'Kingston', 'Martinez', 'Male', 29, 2);


insert into techsoft_employees
values 
(0001, 'Peter', 'Burtler', 'Male', 44, 4),
(0002, 'Harold', 'Simmons', 'Male', 54, 4),
(0003, 'Juliana', 'Sanders', 'Female', 36, 2),
(0004, 'Paul', 'Ward', 'Male', 29, 2),
(0005, 'Nicole', 'Bryant', 'Female', 30, 2);


-- task 5 
-- Back up the three tables techhyve_employees
create schema backup_techmac_db;

use backup_techmac_db;

create table techhyve_employees_bkp
like techmac_db.techhyve_employees;

insert into techhyve_employees_bkp
select *
from techmac_db.techhyve_employees;

create table techcloud_employees_bkp
like techmac_db.techcloud_employees;

insert into techcloud_employees_bkp
select *
from techmac_db.techcloud_employees;

create table techsoft_employees_bkp
like techmac_db.techsoft_employees;

insert into techsoft_employees_bkp
select *
from techmac_db.techsoft_employees;

-- task 6
-- TechHyve and TechCloud employees with the following employee 
-- IDs have resigned: TH0003, TH0005, TC0001, and TC0004.

use techmac_db;

delete from techhyve_employees
where employeeid in (0003,0005,0001,0004);

delete from techcloud_employees
where employeeid in (0003,0005,0001,0004);

delete from techsoft_employees
where employeeid in (0003,0005,0001,0004);

-- task 7 Merge the data on these two start-ups in a new table called techhyvecloud_employees. 
-- Then, delete the records from the techhyve_employees and 
-- techcloud _employees tables and retain them in the backup database.

select *
from techhyve_employees;

select *
from techcloud_employees;

create table techhyvecloud_employees like techhyve_employees;
show tables;
describe techhyvecloud_employees;

select *
from techhyvecloud_employees;

insert into techhyvecloud_employees
select *
from techhyve_employees;

update techhyvecloud_employees
set employeeid = 1
where employeeid = 2;

insert into techhyvecloud_employees
select *
from techcloud_employees;

drop table techhyve_employees;
drop table techcloud_employees;





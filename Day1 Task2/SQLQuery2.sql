create database Administration
use Administration

create table tblEmp
(
Empno int primary key,
Ename varchar(15) not null,
Job varchar(15) not null,
MgrId int,
date datetime,
sal float,
comm int,
Deptno int)

create table tblDept
(
Deptno int primary key foreign key references tbldept(deptno),
Dname varchar(20),
LOC varchar(15))



sp_help tblEmp

insert into tblEmp values(7369,'SMITH','CLERK',7902,1982-12-17,800,NULL,20),
(7499,'ALLEN','SALESMAN',7698,1981-02-20,1600,300,30),
(7521,'WARD','SALESMAN',7902,1981-02-22,1250,500,30),
(7566,'JONES','MANAGER',7839,1981-04-02,2975,NULL,20),
(7654,'MARTIN','SALESMAN',7698,1981-09-28,1250,1400,30),
(7698,'BLAKE','MANAGER',7839,1981-05-01,2850,NULL,30),
(7782,'CLARK','MANAGER',7839,1981-06-09,2450,NULL,10),
(7788,'SCOTT','ANALYST',7566,1987-04-19,3000,NULL,20),
(7839,'KING','PRESIDENT',NULL,1981-11-17,5000,NULL,10),
(7844,'TURNER','SALESMAN',7698,1981-09-08,1500,0,30),
(7876,'ADAMS','CLERK',7788,1987-05-23,1100,NULL,20),
(7900,'JAMES','CLERK',7698,1981-12-03,950,NULL,30),
(7902,'FORD','ANALYST',7566,1981-12-03,3000,NULL,20),
(7934,'MILLER','CLERK',7782,1982-01-23,NULL,1300,10)

insert into tblDept values(10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON')

SELECT * FROM tblEmp
SELECT * FROM tblDept

--- add column
alter table tblEmp
add Age int

---- delete column
alter table tblEmp
drop column Age

------------ Query 1
SELECT * FROM tblEmp where Ename like '[a]__%'

------------ Query 2
--Select * from tblEmp where Job != 'Manager'
Select * from tblEmp where MgrId is Null

------------ Query 3
Select Empno,Ename,sal from tblEmp where sal >1200 and sal <1400

------------ Query 4
update tblEmp set sal=sal*0.10 from tblEmp e left join tblDept d on e.deptno=d.deptno where d.Dname='Research'

------------ Query 5
Select count(Job)'Count of Clerks' from tblEmp where Job = 'Clerk'

------------- Query 6
Select Job,avg(sal) 'Employee Salary', count(Job) 'No. of Jobs' from tblEmp group by Job

-------------- Query 7
Select min(sal),max(sal) from tblEmp 

-------------- Query 8
Select * from tblDept where not exists (Select Deptno from tblEmp where tblDept.deptno=tblEmp.deptno) 

-------------- Query 9
Select Ename ,Sal from tblEmp where Sal > 1200 order by Ename Asc

-------------- Query 10
Select d.Dname,d.Deptno,Sum(e.sal) from tblDept d left join tblEmp e on e.Deptno=d.Deptno group by d.Deptno,d.Dname

------------- Query 11
Select sal,Ename from tblEmp where Ename='MILLER' OR Ename='SMITH'

------------- Query 12
Select * from tblEmp where Ename like '[AM]__%'

------------- Query 13
Select Ename, sal=sal*12 from tblEmp where Ename='Smith'

------------ Query 14
Select Ename,sal from tblEmp where sal not between 1500 and 2850
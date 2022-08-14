Create Database SAssignment
use SAssignment

Create table Clients(
Client_ID int Primary key,
C_name varchar(40) not null,
Address varchar(30),
Email varchar(30) unique,
Phone varchar(10),
Business varchar(20) not null
)

Create table Employees(
Empno int primary key,
Ename varchar(20) not null,
Job varchar(15),
Salary float check(salary>0),
Deptno int,
)

Create table Departments(
Deptno int Primary key,
Dname varchar(15) not null,
Loc varchar(20)
)

Create table Projects(
Project_ID int primary key,
Descr varchar(30) not null,
Start_date Date,
Planned_End_Date Date,
Actual_End_Date Date,
check(Actual_End_Date > Planned_End_Date),
Budget Bigint check(Budget>0),
Client_ID int foreign key
references Clients(Client_ID)
)

Create Table EmpProjectTask
(
Project_ID int not null,
Empno int not null,
Start_date Date,
End_Date Date,
Task varchar(25) not null,
Status varchar(15) not null,
)

/*Alter table EmpProjectTask
Add Constraint PK_EmpProjectTask Primary Key(Project_ID,Empno)

Alter Table EmpProjectTask
Add Constraint FK_EmpProjectTask1 Foreign Key(Project_ID)
References Projects(Project_ID)

Alter Table EmpProjectTask
Add Constraint FK_EmpProjectTask2 Foreign Key(Empno)
References Employees(Empno) */ 

Insert into Clients values(1001,'ACME Utilites','Noida','contact@acmeutil.com','9567880032','Manufacturing'),
(1002,'Trackon Consultants','Mumbai','consult@trackon.com','8734210090','Consultant'),
(1003,'MoneySaver Distributers','Kolkata','save@moneysaver.com','7799886655','Reseller'),
(1004,'Lawful Corp','Chennai','justice@lawful.com','9210342219','Professional')

INSERT INTO EMPLOYEES VALUES(7001 ,'Sandeep','Analyst', 25000 ,10),
(7002,'Rajesh','Designer', 30000 ,10),
(7003 ,'Madhav', 'Developer' ,40000 ,20),
(7004,'Manoj', 'Developer', 40000, 20),
(7005, 'Abhay' ,'Designer',35000,10),
(7006, 'Uma' ,'Tester', 30000, 30)

INSERT INTO DEPARTMENTS VALUES(10 ,'Design' ,'Pune'),
(20 ,'Development', 'Pune'),
(30 ,'Testing', 'Mumbai'),
(40 ,'Document', 'Mumbai')

INSERT INTO PROJECTS VALUES(401,'Inventory','2011-04-01','2011-10-01','2011-10-31',150000,1001),
(402,'Accounting','2011-08-01','2012-01-01',Null,500000,1002),
(403,'Payroll','2011-10-01','2011-12-31',Null,750000,1003),
(404,'Contact Mgmt','2011-11-01','2011-12-31',Null,500000,1004)

INSERT INTO  EmpProjectTask VALUES(401, 7001,'2011-04-01','2011-04-20', 'System Analysis','Completed'),
(401 ,7002 ,'2011-04-21', '2011-05-30', 'System Design','Completed'),
(401 ,7003 ,'2011-06-01', '2011-07-15', 'Coding','Completed'),
(401 ,7004 ,'2011-07-18', '2011-09-11', 'Coding','Completed'),
(401 ,7006 ,'2011-09-03', '2011-09-15', 'Testing','Completed'),
(401 ,7009 ,'2011-09-18', '2011-10-05', 'Code Change','Completed'), -----------
(401 ,7008 ,'2011-10-06', '2011-10-06', 'Testing','Completed'),
(401 ,7007 ,'2011-10-06', '2011-10-22', 'Documentation','Completed'),
(401 ,7011 ,'2011-10-22', '2011-10-31', 'Sign off','Completed'),
(402 ,7010 ,'2011-08-01', '2011-08-20', 'System Analysis','Completed'),
(402 ,7002 ,'2011-08-22', '2011-09-30', 'System Design','Completed'),
(402 ,7004 ,'2011-10-11', Null, 'Coding','In Progress')

Select * from Clients
Select * from Employees
Select * from Departments
select * from Projects
Select * from EmpProjectTask

create database Assignment
use Assignment

create table Books(
id int primary key,
title varchar(30),
author varchar(30),
isbn float,
unique (isbn),
published_date datetime
)

insert into Books values(1,'My First SQL Book','Mary Parker','981483029127','2012-02-22 12:08:17 '),
(2,'My Second SQL Book','John Mayer','857300923713','1972-07-03 09:22:45'),
(3,'My Third SQL Book','Cary Flint','523120967812','2015-10-18 14:05:44')

select * from Books


---------------------------------------------- Query 1
select *  from Books where author like '%er'

---------------------------------------------- Query 2

create table reviews (
id int primary key,
book_id int,
reviewer_name varchar(30),
content varchar(30),
rating int,
published_date datetime
)

insert into reviews values(1,1,'John Smith','My first Review',4,'2017-12-10 05:50:11'),
(2,2,'John Smith','My Second Review',5,'2017-10-13 15:05:12'),
(3,2,'Alice Walker','Another Review',1,'2017-10-22 23:47:10')

select * from reviews

select e.title,e.Author,d.reviewer_name,d.rating from Books e join Reviews d on e.id = d.book_id
order by title
-----------------------------------------------------   Query 3

select * from Books
select * from reviews

select reviewer_name,content
from reviews
where reviewer_name in
(
    select reviewer_name
	from reviews
	group by reviewer_name
	having count(reviewer_name) >1
)

----------------------------------------- Query 4

create table Customers(
Id int primary key,
EName varchar(25),
Age int,
EAddress varchar(15),
Sal float
)

insert into Customers values (1,'Ramesh',32,'Ahmedabad',2000),
(2,'Khilan',25,'Delhi',1500),(3,'kaushik',23,'Kota',2000),
(4,'Chaitali',25,'Mumbai',6500),(5,'Hardik',27,'Bhopal',8500),
(6,'Komal',22,'MP',4500),(7,'Muffy',24,'Indore',10000)

select Ename from Customers where Eaddress in 
     (select Eaddress from Customers
	 group by EAddress having count(*) > 1)
	 and EAddress like '%o%'

------------------------------- Query 5

create table orders(
OID int primary key,
EDate datetime,
Customer_id int ,
Amount float
)

insert into orders values(102,'2009-10-08',3,3000),
(100,'2009-10-08',3,1500),
(101,'2009-11-20',2,1560),
(103,'2008-05-20',4,2060)

Select Edate from orders  
select count(Customer_id) as 'Total No.' from orders where Edate in
	(select Edate from orders 
	group by Edate having count(Edate) > 1
	)

---------------------------------- Query 6
update customers 
set sal = 0 where EName ='Komal'
update customers 
set sal = 0 where EName ='Muffy'

Select * from Customers
Select Lower(Ename) as LowercaseEmp from Customers where sal like 0

-------------------------------- Query 7

create Table StudentDetails (
RegisterNo int ,
Ename varchar(10),
Age int,
Qualification varchar(10),
MobileNo float,
MailId varchar(15),
Location varchar(10),
Gender varchar(5)
)

insert into StudentDetails values (2,'Sai',22,'B.E',9952836777,'Sai@gmail.com','Chennai','M'),
(3,'Kumar',20,'BSC',7890125648,'Kumar@gmail.com','Madurai','M'),
(4,'Selvi',22,'B.Tech',8904567342,'Selvi@gmail.com','Selam','F'),
(5,'Nisha',25,'M.E',7834672310,'Nisha@gmail.com','Theni','F'),
(6,'SaiSaran',21,'B.A',7890345678,'Saran@gmail.com','Madurai','F'),
(7,'Tom',23,'BCA',8901234675,'Tom@gmail.com','Pune','M')

Select * from StudentDetails

Select Count(Case When Upper(Gender)='M' then 1 End)MaleCount,
Count(Case When Gender='F' then 1 End)FemaleCount,
Count(RegisterNo) AS 'Total Employee'
from StudentDetails


------------------------------------ Query 8
Create table CourseDetails(
C_id varchar(10),
C_Name varchar(20),
Start_Date Datetime,
End_Date Datetime,
Fee Float
)

Create Table CourseRegistration(
RegisterNo int,
Cid varchar(10),
Batch varchar(5)
)

insert into CourseDetails values('DN003','DotNet','2018-02-01','2018-02-28',15000),
('DV004','DataVisualization','2018-03-01','2018-04-15',15000),
('JA002','AdvancedJava','2018-01-02','2018-01-20',10000),
('JC001','CoreJava','2018-01-02','2018-01-12',3000)

insert into CourseRegistration values(2,'DN003','FN'),
(3,'DV004','AN'),
(4,'JA002','FN'),
(2,'JA002','AN'),
(5,'JC003','FN')
select * from CourseDetails
select * from CourseRegistration

Select e.C_Name,d.registerno as EnrolledStudents from CourseDetails e join CourseRegistration d on e.C_id=d.Cid  where  Start_date >='2018-01-02' and End_Date <= '2018-02-28'
order by C_id desc

------------------------------------------------------------------- Query 9

Create table CustomerQuery9 (
Cust_id int primary key,
first_name varchar(10),
last_name varchar(10)
)

Create Table OrderQuery9(
Order_id int,
Order_date Datetime,
Amount float,
Cust_id int
)

select * from CustomerQuery9
select * from OrderQuery9

insert into CustomerQuery9 values(1,'George','Washington'),
(2,'John','Adams'),(3,'Thomas','Jefferson'),
(4,'James','Mandison'),(5,'James','Monroe')

insert into OrderQuery9 values(1,'1776-07-04',234.56,1),
(2,'1760-03-14',78.50,3),
(3,'1784-05-23',124.00,2),
(4,'1790-09-03',65.50,3),
(5,'1795-07-21',25.50,10),
(6,'1787-11-27',14.40,9)

Select distinct e.first_name,e.Last_name from CustomerQuery9 e join OrderQuery9 d on e.Cust_id=d.Cust_id where d.Cust_id > 1

--------------------------------  Query 10
select * from StudentDetails
Select REVERSE(Ename),UPPER(Location) from StudentDetails

--------------------------------  Query 11
Create table OrderQuery11 (
Id int primary key,
OrderDate date,
OrderNumber int,
CustomerId int,
TotalAmount int
)

Create table OrderitemQuery11(
Id int primary key,
OrderId int,
ProductId int,
UnitPrice int,
Quantity int
)

Create table ProductQuery11(
Id int primary key,
ProductName varchar(10),
SuppilerId int,
unitPrice int,
Package varchar(10),
IsDiscontinued varchar(5)
)

Create View OrdersView
As select a.Id,OrderDate,OrderNumber,CustomerId,TotalAmount
from OrderQuery11 a,OrderitemQuery11 b,ProductQuery11 c
where a.Id=b.Id and a.Id=c.Id

Select * from OrdersView

------------------------------------ Query 12
select * from StudentDetails
select * from CourseDetails
select * from CourseRegistration

Select a.Ename,b.C_Name 
from StudentDetails a Full join CourseRegistration c on a.RegisterNo = c.RegisterNo 
full Join CourseDetails b on b.C_id=c.Cid
where Ename like 'Nisha'
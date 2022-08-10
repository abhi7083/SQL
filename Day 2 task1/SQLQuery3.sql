Select * from tblEmp
Select * from tblDept

----------------------- Query 1
Select * from tblEmp 
where Job='Manager'

----------------------- Query 2
Select Ename,Sal from tblEmp 
where sal >1000

---------------------- Query 3
Select * from tblEmp
Where Not Ename='James'

---------------------  Query 4
Select * from tblEmp
where Ename like '[S]_%'

--------------------  Query 5
Select * from tblEmp
where Ename like '%A%'

------------------- Query 6
Select * from tblEmp
where Ename like '__[L]%'

------------------- Query 7
select Ename,sal=sal/30 from tblEmp
Where Ename like 'Jones'

------------------- Query 8
select Empno,Ename,sal=sal/12 
from tblEmp
Order by Sal Asc

------------------- Query 9
select Empno,Ename,avg (sal) as AverageSal from tblEmp
group by Empno,Ename

------------------ Query 10
Select Ename,Job,Sal,Deptno 
from tblEmp
Where not (Deptno=30 and Job='Salesman')

------------------ Query 11
select distinct Dname from tblDept

------------------- Query 12
select Deptno,Ename,sal from tblEmp where sal >1500 and Deptno in (10,20)

------------------ Query 13
select Ename,job,sal from tblEmp where job in ('manager', 'analyst') and sal not in (1000,3000,5000)

------------------  Query 14
select Ename,job,sal from tblEmp where comm>=sal*0.10

------------------  Query 15
Select Ename,deptno,MgrId from tblEmp where Ename like '%ll%' and deptno=30 or MgrId=7782

-----------------  Query 16
select Ename from tblEmp where DATEDIFF(month,Hiredate,getdate())/12 Between 10 and 20

-----------------  Query 17
Select e.ename,d.dname 
from tblEmp e inner join tblDept d on e.Deptno = d.Deptno
order by e.Ename desc, d.dname asc

------------------  Query 18
select DATEDIFF(Month,Hiredate,Getdate())/12 as Experience from tblEmp where ename ='miller'


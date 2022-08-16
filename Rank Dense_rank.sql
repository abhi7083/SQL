Create table Books(
Book_id int,
Book_name varchar(30),
Buyers_name varchar(30),
Books_issued date,
Amount int,
)
insert into Books values(1,'5 A.M Club','Ray','2022-08-01',550),
(2,'Monk sold his ferrari','Levi','2022-08-03',650),
(3,'Rich Dad Poor Dad','Ray','2022-08-02',350),
(4,'The alchemist','Levi','2022-08-10',234),
(5,'Shiva Triology','Chris','2022-08-11',456),
(6,'Marvel Comics','Levi','2022-08-12',344),
(7,'Harry Potter','Levi','2022-08-11',343),
(8,'Mossad','Chris','2022-08-01',343)

Select * from Books;

  ------ rowNumber()
  select Book_name,Buyers_name,Amount,ROW_NUMBER()over(order by Amount desc)RowNumber from Books 

  ------ rank()
   select Book_name,Buyers_name,Amount,Rank()over(order by Amount desc)RankNo from Books

   -------- rank() with partition
    select Book_name,Buyers_name,Amount,Rank()over(partition by Buyers_name order by Amount desc)RowNumber from Books

	------ denserank()
	 select Book_name,Buyers_name,Amount,dense_Rank()over(order by Amount desc)RowNumber from Books

	 ----- denserank() with partition
      select Book_name,Buyers_name,Amount,Dense_Rank()over(partition by Buyers_name order by Amount desc) RowNumber from Books

	 -------------------- heirarchial query

	 use Administration
	 select * from tblEmp;
	 
	 select sub.Empno as subordinate_id,
	 sub.Ename as subordinate_name,
	 sup.Empno as superior_id,
	 sup.Ename as superior_name
	 from tblEmp sub join tblEmp sup
	 on sub.MgrId= sup.Empno
	 order by superior_id

	 --Hierarchial query with CTE
   with ourcte(empno,ename,mgrid,emplevel)
   as (select empno,ename,mgrid,1 emplevel  
   from tblemp where mgrid is null
   union all
   select e.empno,e.ename,e.mgrid, cte.emplevel + 1 
   from tblemp e inner join ourcte cte on e.MgrId=cte.empno
   where e.MgrId is not null)
   select * from ourcte
   order by emplevel


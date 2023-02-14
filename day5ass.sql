use day_5
create table student
(
Id int,
Name varchar(10),
BranchId int,
Gender varchar(10)
)

insert into student values(301,'pooja',1,'female')
insert into student values(606,'siri',3,'female')
insert into student values(506,'Bharath',2,'male')
insert into student values(310,'sai',6,'male')
insert into student values(409,'Nikhitha',5,'male')
insert into student values(325,'harsha',4,'male')
select * from student 

--create a function to display student information by BranchId
create function studentInfoBYBranch(@branchid int)
returns table
as
return(select * from student where BranchId=@branchid)
select * from dbo.studentInfoBYBranch(1)


--2. create a function to display student information by Gender


drop function studentInfoByGender
create function studentInfoByGender(@gender varchar(10))
returns table
as
return(select * from student where Gender=@gender)
select * from dbo.studentInfoByGender('female')
drop function studentInfoByGender

--3. calculate NetSales amount for all order_Id using Functions. Refer the below table

use BikeStores
select * from sales.order_items
create function netSalesAmount(@listPrice decimal,@discount decimal)
returns table
as 
return(select (list_price-discount) from sales.order_items where list_price=@listPrice and discount=@discount )
select * from dbo.netSalesAmount(599.99,0.20)

--Assignment on Trigger:
--create a trigger to delete the recode from tblEmployee table and insert deleted record 
 --deetails in tblEmployeeaudit Table  (use after or For trigger)




create table tblEmployee
(
Id int primary key identity,
Name varchar(50),
Gender varchar(50),
Salary int,
DepartmentId  int 
)

 select * from tblEmployee

  insert into tblEmployee values
  ('Tom','Male',3500,1),
  ('Pam','Female',4000,3),
  ('John','Male',7000,1),
  ('Sam','Male',5000,2)

 create table tblEmployeeAudit
(
id int identity(1,1) primary key,
AuditData nvarchar(1000)
)

drop trigger tr_tblEmployee
create trigger tr_tblEmployee
on tblEmployee
for delete
as
begin
declare @id int
select @id=Id from deleted
insert into tblEmployeeAudit values('new employee with id'+cast(@id as varchar(10))+'is 
deleted '+cast(getdate() as varchar(30)))
end
delete from tblEmployee where id=2
select * from tblEmployee
select * from tblEmployeeAudit
insert into tblEmployee values('nikki','female',7000,2)
drop table tblEmployee
drop table tblEmployeeAudit

/*assignment
List put the product details which is not at all sold using subquery.
refer tblProduct and tblproductSales tables
*/

create table tblProducts
(
[id] int identity primary key,
[Name] varchar(50),
[Description] varchar(250)
)


create table tblProductSales
(
[id] int identity ,
productId int foreign key references tblProducts(Id),
UnitPrice int,
QuantitySold int
)

insert into tblProducts values('tv','52 inch black clor lcd tv')

insert into tblProducts values('laptop','very thin black clor acer laptop')

insert into tblProducts values('desktop','hp high performance desktop')



insert into tblProductSales values(3,450,5)

insert into tblProductSales values(2,250,7)

insert into tblProductSales values(3,450,4)

insert into tblProductSales values(3,450,9)


select * from tblProducts
select * from tblProductSales
 select * from tblProducts where id  not in
 (
 select productId from tblProductSales
 )
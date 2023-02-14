create database Day_3
use Day_3
use day3
create table tablemp
(
id int primary key identity,
name varchar(40),
gender varchar(40),
salary int,
deptid int
)

insert into tablemp values('sony','female',75000,3),('sai','male',50000,1),('siri','female',60000,2),('priya','female',89000,1),('pooja','female',65000,3)
select * from tablemp

-- dispaly a welcome message
create procedure uspdisplay
as
begin
print 'welcome to sql server'
end
execute uspdisplay

--2---
create procedure usptablemployee 
(
@gender varchar(10),
@deptid int
)
as 
begin
select name,gender,salary from dbo.tablemp where gender=@gender and deptid=@deptid;
end
execute dbo.usptablemployee 'male',1


--3--
create procedure uspemployeecount 
(
@gender varchar(10),
@deptid int, 
@total int output
)
as 
begin
select name,gender,salary from tablemp where gender=@gender and deptid=@deptid;
select @total=@@rowcount
end
declare @count int 
exec usptablemployeecount 'male',1,@total=@count output
select @count

--4--
create procedure totalempcount
as
begin
select gender,count(gender) as emplyeecount from tablemp group by gender
end
exec totalempcount


--5--
create procedure uspaddition(
@num1 int=10,
@num2 int=20,
@num3 int=30
)
as
begin
declare @sum int
set @sum=@num1+@num2+@num3
select @sum as 'Totalsum'
end

execute uspaddition 5,5,5
execute uspaddition
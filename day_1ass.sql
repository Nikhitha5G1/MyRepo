create database day_1
use day_1
drop table customer_master
create table customer_master(CUSTOMER_NUMBER varchar(30) primary key,
FIRSTNAME varchar(50) ,
middlename varchar(50) ,
lastname varchar(50),
CUSTOMER_CITY varchar(50) ,
CUSTOMER_CONTACT_NO varchar(20) ,
occupation varchar(30) ,
CUSTOMER_DATE_OF_BIRTH date )

insert into customer_master values('C00001','RAMESH','CHANDRA','SHARMA','DELHI',9543198345,'SERVICE','1976-12-06')
select * from customer_master


--Display the no of customers belongs to each city
select CUSTOMER_CITY,count(CUSTOMER_NUMBER) from customer_master group by CUSTOMER_CITY

--display all city names from customer tables without any duplicate value
select distinct CUSTOMER_CITY from customer_master

--display no of customers from different occupation
select occupation,count(CUSTOMER_NUMBER) from customer_master group by occupation

--display customer details with the ascending order based on firstname
select * from customer_master order by FIRSTNAME

--display data in descending order based on occupation and the first name in ascending of each occupation
select * from customer_master order by occupation desc,FIRSTNAME

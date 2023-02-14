create database Day_2
use Day_2
create table customer_master
(
CUSTOMER_NUMBER varchar(30) PRIMARY KEY,
FIRSTNAME varchar(20) not null,
middlename varchar(20),
lastname varchar(20) not null,
CUSTOMER_CITY varchar(20) not null,
CUSTOMER_CONTACT_NO varchar(10) not null,
occupation varchar(20) not null,
CUSTOMER_DATE_OF_BIRTH date not null
) 

create table loan_details
(
customer_number varchar(30) foreign key references customer_master(CUSTOMER_NUMBER ),
branch_id int,
loan_amount bigint
)


create table branch_master
(
branch_id int primary key ,
branch_name varchar(20),
branch_city varchar(20)
)


create table account_master
(
account_number varchar(30) primary key,
customer_number varchar(30) foreign key references customer_master(CUSTOMER_NUMBER ),
branch_id int foreign key references branch_master(branch_id),
opening_balance bigint,
account_opening_date date ,
account_type varchar(20),
account_status varchar(20)
)



create table transaction_details
(
transaction_number int primary key,
account_number varchar(30) foreign key references account_master(account_number),
date_of_transaction date,
medium_of_transaction varchar(20),
transaction_type varchar(20),
transaction_amount bigint
)
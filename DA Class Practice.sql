--The below is the create command for Student Table
Use msdb

create table Student
(
Student_ID Int,
S_Fname Varchar (50),
S_Lname varchar (50),
S_Address1 Varchar (50),
S_Address2 Varchar (50),
S_City Varchar (50),
S_Zip Int,
S_Country Varchar (50),
S_Phone Varchar (10)
)

-- The below is the create command for table

--INSERT INTO Syntax
/*INSERT INTO table_name (column1, column2, column3, ...)
  VALUES (value1, value2, value3, ...); */

  Select * From Student


INSERT INTO Student (
Student_ID,
S_Fname,
S_Lname,
S_Address1,
S_Address2,
S_City,
S_Zip,
S_Country,
S_Phone)
VALUES (1001, 'Mark', 'Julius', '652 Elm Pike','', 'Charlotte', 25635, 'USA', '8947748976'),
		(1002, 'Zeb', 'Carver', '6322 Maine Ln','','Charlotte', 62323, 'USA', '9588897338'),
		(1003, 'Vicky','Mayer', '234 Keatings Ln','Suite 20','Charlotte', 62323, 'USA', '95897338')

--SELECT Syntax
/* SELECT column1, column2, ...
   FROM table_name; */

Select *
From Student


Select Student_ID, S_FName, S_LName, S_Phone, S_Country
From Student

Select S_FName, S_LName, Student_ID
From Student

INSERT INTO Student (
Student_ID,
S_Fname,
S_Lname,
S_Address1,
S_Address2,
S_City,
S_Zip,
S_Country,
S_Phone)
VALUES (1004, 'Smith','Brown','11235 Elm Ln', 'Suite 310', 'Charlotte', 28202, 'USA', 123479988)

Select *
From Student

INSERT INTO Student (
Student_ID,
S_Fname,
S_Lname,
S_Address1,
S_Address2,
S_City,
S_Zip,
S_Country,
S_Phone)
VALUES (1005, 'Mary','Foxx','10075 Mahem Ln', '', 'Charlotte', 28201, 'USA', 1234878978)

INSERT INTO Student (
Student_ID,
S_Fname,
S_Lname,
S_Address1,
S_Address2,
S_City,
S_Zip,
S_Country,
S_Phone)
VALUES (1006, 'Samatha','Kane','17865 Ronem St', '', 'Charlotte', 28781, 'USA', 123478978)

INSERT INTO Student (
Student_ID,
S_Fname,
S_Lname,
S_Address1,
S_City,
S_Zip,
S_Country,
S_Phone)
VALUES (1007, 'Cathy','Pickett','6345 Elm Pike', 'Charlotte', 28257, 'USA', 8998988784)

Select *
From Student

CREATE TABLE Persons
(
Person_ID int,
LastName varchar(255),
FirstName varchar(255),
Address varchar (255),
City varchar (255)
)

--create table for Persons*/

INSERT INTO Persons(Person_ID,
LastName,
FirstName,
Address,
City)
VALUES (1001, 'Cathy','Devine','234 Tomshort Ln','Charlotte'),
		(1002, 'Manny','P', '532 Emma Pike', 'Charlotte'),
		(1003, 'Steve','Smith','110 elm ln','Charlotte'),
		(1004, 'Demi','Shah','10923 traveller ln','East Brunswick'),
		(1005, 'Merium','Duke','9808 Marshall Ln','Nashville')

Select *
From Persons

INSERT INTO Persons(Person_ID,
LastName,
FirstName,
Address,
City)
VALUES (1006, 'Nancy','Rogers','218 Easy St','Kannapolis')

Select FirstName, LastName
From Persons

Select FirstName, City
From Persons

Select * From Student

--Select Student_ID, S_Fname, S_City, S_Zip from Student
Select Student_ID, S_Fname, S_City, S_Zip
From Student

Select S_Fname, S_Lname, S_Phone
From Student

--Bulk insert product table w/unique values

CREATE TABLE Products 
(Product_ID Int, 
Product_Name Varchar(40), 
Supplier_ID Int, 
Category_ID Int, 
Unit Varchar(100), 
Price Decimal(4,2));

Select *
From Products

Create Table Products 
(Product_ID Int,
Product_Name varchar(40),
Supplier_ID Int,
Category_ID Int,
Unit Varchar(100),
Price Decimal(4,2));

UPDATE Student
SET S_Fname= 'Nicholus'
where Student_ID = 1006;

Select * From Student

UPDATE Student
SET S_Lname= 'Oslo', S_Address1 = '1344 Main St', S_Address2 = 'Suite 100'
where Student_ID = 1002;

--Update Student table with S_City to Detroit for the student ID between 1002 and 1005

UPDATE Student
SET S_City = 'Detroit'
where Student_ID between 1002 and 1005;

Select * From Student

Create table Cust_Department
(Dept_Id Int,
Dept_Name Varchar(50),
Dept_Loc Varchar(50)
CONSTRAINT PK_Dept_ID	
PRIMARY KEY (Dept_Id))

Create table MacysCustomers
(Cust_Id Int,
Cust_Fname Varchar (50),
Cust_Lname Varchar(50),
Cust_Addr1 Varchar (50),
Cust_Addr2 Varchar(50),
Cust_City Varchar(50),
Cust_Zip int,
Cust_DOB Date,
Cust_Dept_Id Int,
Cust_Basic_Sal Decimal(10,2),
Cust_Benefits Decimal(10,2),
Cust_Commision Decimal(10,2)
CONSTRAINT PK_Cust_Id PRIMARY KEY (Cust_Id),
CONSTRAINT FK_Dept_ID FOREIGN KEY (Cust_Dept_Id) REFERENCES Cust_Department(Dept_Id));

Select * From MacysCustomers
Select * From Cust_Department

-- Bulk insert data into Cust_Department
Bulk Insert Cust_Department
FROM 'C:\Users\uneek\Downloads\Cust_Department.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

-- Bulk insert data into Customers
Bulk Insert MacysCustomers
FROM 'C:\Users\uneek\Downloads\Customers.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

--Alter Table
--The ALTER TABLE statement is used to add, delete, or 
--modify columns in an existing table.
--The ALTER TABLE statement is also used to add and drop various constraints on an
--existing table.

Select * From MacysCustomers

Alter Table MacysCustomers
Add Email1 Varchar(100), Email2 Varchar(100)

--Insert Email1 and Email2 for the customer 1001

Update MacysCustomers
Set Email1 = '1test1001@test.com' , Email2 = '2test1002@email.com'
Where Cust_Id = 1001

Select * From MacysCustomers

Alter Table MacysCustomers Drop Column Cust_Commision

Alter Table MacysCustomers
Add Cust_Commission Varchar(100)

Alter Table MacysCustomers Drop Constraint FK_Dept_ID

Alter Table MacysCustomers Alter Column Cust_Dob Datetime

Select * From MacysCustomers

Alter Table MacysCustomers Add Constraint FK_Dept_ID FOREIGN KEY (Cust_Dept_Id)
References Cust_Department(Dept_ID)

Delete from MacysCustomers where Cust_Id = 1007

Select * From MacysCustomers

Delete from MacysCustomers where Cust_Zip between 27766 and 28788


Delete from Cust_Department where Dept_Id = 103

Select * From MacysCustomers
Delete from Cust_Department where Dept_Id = 106
Select * From Cust_Department
Select * From MacysCustomers

Delete from MacysCustomers

Bulk Insert MacysCustomers
FROM 'C:\Users\uneek\Downloads\Customers.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

Select * From MacysCustomers

--Check Constraint
Create Table Person_tmp
(P_Id Int,
P_Name Varchar (50),
P_Age Int CHECK (P_Age <= 20),
P_City Varchar (40),
P_Zip Varchar (10))

Insert Into Person_tmp (P_Id, P_Name, P_Age, P_City, P_Zip)
Values (101, 'Tommy Lee', 22, 'Charlotte','27676')
--This will show an error for Check Constraint P_Age <=20

Insert Into Person_tmp (P_Id, P_Name, P_Age, P_City, P_Zip)
Values (101, 'Tommy Lee', 20, 'Charlotte','27676') --This will be inserted

Insert Into Person_tmp (P_Id, P_Name, P_Age, P_City, P_Zip)
Values (102, 'Ashley Lee', 18, 'Charlotte','28276')

Select * From Person_tmp

Alter Table Person_tmp Drop Constraint CK__Person_tm__P_Age__4BCC3ABA

Alter Table Person_tmp Add Constraint CK_P_Age Check(P_Age <=20)

Drop Table Person_tmp

Create Table Person_Def
(P_Id Int,
P_Name Varchar (50),
P_Age Int,
P_City Varchar (40) DEFAULT 'Charlotte',
P_Zip Varchar (10))

Select * From Person_Def

Insert Into Person_Def(P_Id, P_Name, P_Age, P_City, P_Zip)
Values (101, 'Tommy Lee', 18, 'Charlotte','27676')
--This will be inserted with default value 'Charlotte for P_City

Insert Into Person_Def(P_Id, P_Name, P_Age, P_City, P_Zip)
Values (102, 'Ashley Lee', 17, 'Charlotte','27786')

Select * From Person_Def

Insert Into Person_Def(P_Id, P_Name, P_Age, P_City, P_Zip)
Values (103, 'Zack Lee', 17, 'Detroit','28886')

Create Table Person_Def1
(P_Id Int,
P_Name Varchar (50),
P_Age Int,
P_City Varchar (40) Constraint DF_City DEFAULT 'Charlotte',
P_Zip Varchar (10))

-- Unique Key Constraint
Create Table Person_Uni
(P_Id Int,
P_Name Varchar (50),
P_Age Int,
P_City Varchar (40),
P_Zip Varchar (10)
CONSTRAINT UQ_P_ID UNIQUE(P_Id))

Insert Into Person_Def(P_Id, P_Name, P_Age, P_City, P_Zip)
Values (101, 'Tommy Lee', 18, 'Charlotte','27676')
--This will be inserted with default value 'Charlotte for P_City

Insert Into Person_Def(P_Id, P_Name, P_Age, P_City, P_Zip)
Values (102, 'Ashley Lee', 17, 'Charlotte','27786')

Select * From Person_Def

Insert Into Person_Uni(P_Id, P_Name, P_Age, P_City, P_Zip)
Values (103, 'Zack Lee', 17, 'Detroit','28886')
--Unique Key
Insert Into Person_Uni(P_Id, P_Name, P_Age, P_City, P_Zip)
Values (101, 'Tommy Lee', 18, 'Charlotte','27676')
--This will be inserted with default value 'Charlotte for P_City

Insert Into Person_Def(P_Id, P_Name, P_Age, P_City, P_Zip)
Values (102, 'Ashley Lee', 17, 'Detroit','27786')

Insert Into Person_Uni(P_Id, P_Name, P_Age, P_City, P_Zip)
Values (103, 'Jacob Lee', 23, 'Charlotte','28886')

Select * From Person_Uni

Insert Into Person_Uni(P_Id, P_Name, P_Age, P_City, P_Zip)
Values (103, 'Zack Lee', 23, 'Detroit','28886')

Select * From Person_Uni

-- SQL CONSTRAINTS **********************
--PRIMARY KEY 
--FOREIGN KEY 
--CHECK
--DEFAULT
--UNIQUE

--Unique Default and Check Constraints
Create Table Person_AllCon
(P_Id Int,
P_Name Varchar (50),
P_Age Int CHECK (P_Age <= 20),
P_City Varchar (40) DEFAULT 'Charlotte',
P_Zip Varchar (10)
CONSTRAINT UQ_P_ID2 UNIQUE(P_Zip),
CONSTRAINT PK_PID PRIMARY KEY (P_ID))

Insert Into Person_AllCon (P_Id, P_Name, P_Age, P_Zip)
Values (101, 'Ashley Lee' , 20, '27786')

Insert Into Person_AllCon (P_Id, P_Name, P_Age, P_Zip)
Values (101, 'Ashley Lee' , 20, '27786')

Insert Into Person_AllCon (P_Id, P_Name, P_Age, P_Zip)
Values (101, 'Ashley Lee' , 20, '27786')

Insert Into Person_AllCon (P_Id, P_Name, P_Age, P_Zip)
Values (101, 'Ashley Lee' , 20, '27786')

CREATE TABLE EMPLOYEE 
(Emp_ID Int,
Emp_FName Varchar (50),
Emp_LName Varchar (50),
Emp_Addr1 Varchar (40),
Emp_Addr2 Varchar (40),
Emp_City Varchar (40),
Emp_Zip Int,
Emp_Sal Decimal(10,2),
EDept_Id Int,
CONSTRAINT PK_EMPID PRIMARY KEY (Emp_ID),
CONSTRAINT FK_DeptId FOREIGN KEY (EDept_Id) REFERENCES EMP_DEPARTMENT(Dept_Id))

Bulk Insert EMPLOYEE
FROM 'C:\Users\uneek\Downloads\Employee.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

CREATE TABLE EMP_DEPARTMENT
(Dept_Id Int,
Dept_Name Varchar(40),
Dept_City Varchar(30),
Dept_State Varchar(10)
CONSTRAINT PK_DeptidPRIMARY KEY (Dept_Id)
CONSTRAINT FK_Deptcity FOREIGN KEY (Dept_City) REFERENCES Dept_Location(Department_City))

Bulk Insert EMP_DEPARTMENT
FROM 'C:\Users\uneek\Downloads\Department.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

Create Table Dept_Location
(Department_City Varchar (30),
Addr1 Varchar(50),
Addr2 Varchar(50),
Zip_Code int,
Phone_No Varchar(10),
CONSTRAINT PK_DeptCity Primary Key (Department_City))

Bulk Insert Dept_Location
FROM 'C:\Users\uneek\Downloads\Dept_Location.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

Select * From Dept_Location
Select * From EMP_DEPARTMENT
Select * From EMPLOYEE

--Retrieve all records from emp dept id is 1003
Select * From EMPLOYEE
where EDept_Id = 1003

--Retrieve Cust_Id, Cust_FName,Cust_Commission for all customers from Dept_Loc Carolina Place
--Retrieve Sum of Basic Sal for South Park Location Customers
--Retrieve Customer data from Customers table where the dept_name Salon
--Retrieve Customer data from Customers table where the dept_name Clothing Men
--Retrieve Customer data from Customers table where the dept_name Clothing Women
--Retrieve Cust_Fname,Cust_LName,Cust_City,Cust_Basic_Sal from Customers where Dept_Loc is North Lake
--Retrieve Cust_Fname,Cust_LName,Cust_City,Cust_Basic_Sal from Customers where Dept_Loc is North Lake or South Park
--Retrieve all the cust department information from Cust_Department table where customer basic sal < 7000
--Retrieve all the cust department information from Cust_Department table where customer  Cust_Commision > 0.50
--Retrieve all the cust department information from Cust_Department table where  Cust_DOB < '1989-05-10'
--Retrieve Cust_Id,Cust_Fname,Cust_LName,Cust_Benefits from Customers table where dept_Loc is Carolina Place
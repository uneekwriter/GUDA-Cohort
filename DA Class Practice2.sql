Select * From Dept_Location
Select * From EMP_DEPARTMENT
Select * From EMPLOYEE

--Retrieve all records from emp dept id is 1003
Select * From EMPLOYEE
where EDept_Id = 1003

--Use customer and customer dept tables
Select * From Customer
Select * From Cust_Department

Create table Customer
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
Cust_Commission Decimal(10,2));

Bulk Insert Customer
FROM 'C:\Users\uneek\Downloads\Customers.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

--Retrieve Cust_Id, Cust_FName,Cust_Commission for all customers from Dept_Loc Carolina Place
Select Cust_Id, Cust_FName,Cust_Commission from Customer
Where Dept_Loc = (Select Dept_Loc from Cust_Department where Dept_Loc = 'Carolina Place')
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

--CREATE COMMANDS*****************************

--CREATE TABLE
--CREATE VIEW
--CREATE INDEX
--CREATE UNIQUE INDEX
--CREATE DATABASE
--CREATE PROCEDURE

--********************************************
--1. Create View
/*Syntax: CREATE VIEW view_name [(column_list)]
			AS select_statement; */

CREATE VIEW [Employee_Tmp_View] 
AS SELECT * From EMPLOYEE

SELECT * From Employee_Tmp_View

Insert Into Employee_Tmp_View(Emp_ID, Emp_FName, Emp_LName, Emp_Addr1, Emp_Addr2, Emp_City, Emp_Zip, Emp_Sal, EDept_Id)
Values (131, 'Norman', 'Lee', '1785 Cross Ln','Suite 100', 'Detroit',28886, 100000.00, 1088)

Insert Into Employee_Tmp_View(Emp_ID, Emp_FName, Emp_LName, Emp_Addr1, Emp_Addr2, Emp_City, Emp_Zip, Emp_Sal, EDept_Id)
Values (132, 'Sarah', 'Lee', '1785 Cross Ln','Suite 100', 'Detroit',28886, 100000.00, 1088)

Delete from Employee_Tmp_View
Where Emp_ID = 131

Update Employee_Tmp_View
Set Emp_City = 'Charlotte' 
Where Emp_ID = 132

--NEW VIEW TEST

CREATE VIEW [Employee_Tmp_View1] 
AS SELECT Emp_ID, Emp_FName, Emp_City, EDept_Id
From Employee_Tmp_View

SELECT * From Employee_Tmp_View1

Update Employee_Tmp_View1
Set Emp_City = 'Greensboro', Emp_FName = 'Sally'
Where Emp_ID = 132

SELECT * From Employee_Tmp_View1
SELECT * From Employee_Tmp_View
SELECT * From EMPLOYEE

---TEST ADD---
---TEST UPDATE---
---TEST DELETE---

Delete from Employee_Tmp_View1
Where Emp_ID = 132

---CREATE another view from multiple tables-----

CREATE VIEW [Employee_Tmp_View2] AS 
SELECT Emp_ID, Emp_FName, Emp_LName, Emp_Sal, EDept_Id
From Employee
Where EDept_Id In (Select Dept_ID from EMP_DEPARTMENT where Dept_City = 'Charlotte')

SELECT * From Employee_Tmp_View2

CREATE VIEW Employee_Tmp_View3 AS 
SELECT Emp_ID, Emp_FName, Emp_LName, Emp_Sal, Emp_Sal*03 as 'Sal Increase', EDept_Id
From Employee
Where EDept_Id = 1003

SELECT * From Employee_Tmp_View3

Select * Into Employee_Tmp1 from EMPLOYEE

Select * From EMPLOYEE
Bulk Insert EMPLOYEE
FROM 'C:\Users\uneek\Downloads\Employee.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

-- Clustered Index Syntax
/* CREATE UNIQUE CLUSTERED INDEX
    index_Name
ON View/Table(attribute_name); */
-- Non Clustered Index Syntax
/* CREATE NONCLUSTERED INDEX
    index_Name
ON View/Table(attribute_name); */

SELECT * From Employee_Tmp1

Create Index Idx_Emp_FName ON Employee_Tmp1(Emp_Fname)

Drop Index Employee_Tmp.Idx_Emp_Fname

Create Clustered Index Idx_Emp_Name ON Employee_Tmp1(Emp_Fname)

-- Clustered Index Syntax
/* CREATE UNIQUE CLUSTERED INDEX
    index_Name
ON View/Table(attribute_name); */
-- Non Clustered Index Syntax
/* CREATE NONCLUSTERED INDEX
    index_Name
ON View/Table(attribute_name); */

Select * INto Employee_Test From EMPLOYEE

-- 1.Select Top
-- 2.Not Null Constraint
-- 3.Column Alias and Table Alias
-- 4.MERGE Command
-- 5.Distinct
-- 6.Find Highest and Lowest Sal
-- 7.Rename()
-- 8.Case
-- 9.Transaction Control
-- 10. MERGE Command

-- 1.Select Top

Select * From Employee
Select top 5 * From Employee 

Select top 10 * From Employee Order By Emp_ID DESC
Select * From Employee Order By Emp_FName

Select Emp_Zip, Count(Emp_ID) 
from EMPLOYEE
Group By (Emp_Zip)

Select top 10 * Count(Emp_ID) as Emp_ID_Count,Emp_Zip
from Employee
Group By (Emp_Zip)
Order By (Emp_ID_Count) DESC
Select * From Employee Order By Emp_FName

-- 2.Not Null Constraint

Create Table Emp_Null
(Emp_ID Int Constraint Emp_ID_NotNull Not Null,
Emp_Name Varchar(50))

INSERT INTO Emp_Null
(Emp_Name) Values ('Steve')
--must have value in Emp_ID
INSERT INTO Emp_Null	
(Emp_ID, Emp_Name) Values ('','Steve')
Select * from Emp_Null	
--will show value as 0
INSERT INTO Emp_Null	
(Emp_ID, Emp_Name) Values (1,'Mary')
Select * from Emp_Null	
--inserted value
INSERT INTO Emp_Null	
(Emp_ID, Emp_Name) Values (' ','Mary')
Select * from Emp_Null	
--space will show 0

--without constraints still creates table
Create Table Emp_Null1
(Emp_ID Int Not Null,
Emp_Name Varchar(50))

Select * from Emp_Null1	
-- 3.Column Alias and Table Alias

--Retrieve Dept details from Dept. along with Emp_Id and Emp_Fname from Employee table
Select * From EMP_DEPARTMENT
where Dept_Id in (Select EDept_ID from EMPLOYEE where Emp_ID =103)

--Write the above query to retrieve Emp_ID, Emp_FName, Emp_LName, and all the details from 
--Emp_Department Table

Select E.Emp_ID, E.Emp_FName, E.Emp_LName, E.EDept_ID, EP.Dept_Name, EP.Dept_City, EP.Dept_State
from EMPLOYEE E, EMP_DEPARTMENT EP
Where E.EDept_Id = EP.Dept_Id AND E.Emp_ID = 103

--Retrieve Emp_ID, Emp_FName, Emp_LName, Dept_ID, Dept_Name, Dept_City, from Employee
--whose dept. is Mechanical

Select E.Emp_ID, E.Emp_FName, E.Emp_LName, E.EDept_ID, EP.Dept_Name, EP.Dept_City
from EMPLOYEE E, EMP_DEPARTMENT EP
Where E.EDept_Id = EP.Dept_Id AND EP. Dept_Name = 'Mechanical'

--Retrieve Emp_ID, Emp_FName, Emp_LName, Dept_ID, Dept_Name, Dept_City, Dept_State from Employee & Emp_Department
--Where Dept_ID = 1005

Select A.Emp_ID, A.Emp_FName, A.Emp_LName, A.EDept_ID, AB.Dept_Name, AB.Dept_City, AB.Dept_State
from EMPLOYEE A, EMP_DEPARTMENT AB
Where A.EDept_Id = AB.Dept_Id AND AB.Dept_Id = 1005

Select* from Employee
Select* from EMP_DEPARTMENT
Select * from Dept_Location

Select A.Emp_ID, A.Emp_FName, A.Emp_LName, A.EDept_ID, AB.Dept_Name, AB.Dept_City, ABC.Addr1, ABC.Zip_Code, ABC.Phone_No
from EMPLOYEE A, EMP_DEPARTMENT AB, Dept_Location ABC
Where A.EDept_Id = AB.Dept_Id AND AB.Dept_City = ABC.Department_City and AB.Dept_City = 'Detroit'

-- 4.MERGE Command

CREATE TABLE EMP_Merge_Source
(Emp_Id Int,
Emp_Name Varchar(50),
Emp_City Varchar(50),
Emp_Zip Int,
Emp_Age Int)

CREATE TABLE EMP_Merge_Target
(Emp_Id Int,
Emp_Name Varchar(50),
Emp_City Varchar(50),
Emp_Zip Int,
Emp_Age Int)

Bulk Insert Emp_Merge_Source
FROM 'C:\Users\uneek\Downloads\EMP_Merge.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

Bulk Insert Emp_Merge_Target
FROM 'C:\Users\uneek\Downloads\EMP_Merge.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

Select * From Emp_Merge_Source
Select * From Emp_Merge_Target

--1. Make updates to Source table Data
--2. Add/Insert a record to Source Data
--3. Delete a record from Source Table

--1.Update
Update EMP_Merge_Source
Set Emp_Name = 'Shyri McCallely' , Emp_City = 'Charlotte', Emp_Zip = 28277
where Emp_Id = 101

--2.Insert
Insert into EMP_Merge_Source
(Emp_Id,
Emp_Name,
Emp_City,
Emp_Zip,
Emp_Age) Values  (109,'Cathy Cassel','Pineville',28788, 23)

-- 3.Delete
Delete From EMP_Merge_Source  where emp_Id = 107

--MERGE COMMAND:
Merge Emp_Merge_Target T Using Emp_Merge_Source S
On (S.Emp_id = T.Emp_Id)
When Matched Then
Update Set
T.Emp_Name = S.Emp_Name,
T.Emp_City = S.Emp_City,
T.Emp_Zip = S.Emp_Zip,
T.Emp_Age = S.Emp_Age
When Not Matched By Target
Then Insert (Emp_Id,Emp_Name,Emp_City,Emp_Zip, Emp_Age)
Values (S.Emp_Id,S.Emp_Name,S.Emp_City,S.Emp_Zip, S.Emp_Age)
When Not Matched by Source
Then Delete;

--Check tables for merge results:
Select * From Emp_Merge_Source
Select * From Emp_Merge_Target

--JOINS :
--Joins are used to retrieve data from two or more related tables in SQL Server.
--These tables are related each other using Foreign Key Constraint.
-- Types of Joins
-- 1.Join or Inner Join
-- 2.Ourter Join
	 -- Left Join OR Left Outer Join
	 -- Right Join OR Right Outer Join
	 -- Full Join OR Full Outer Join
-- 3.Cross Join

Select* from Employee
Delete from EMP_DEPARTMENT Where Dept_Id = 1009
Select* from EMP_DEPARTMENT
Select* from Dept_Location
Delete from Dept_Location Where Department_City = 'Troy'

Insert into EMPLOYEE
(Emp_ID, Emp_FName, Emp_LName, Emp_Addr1, Emp_City, Emp_Zip, Emp_Sal)
Values('141', 'Test Join', 'Join Test', '19009 Trescott St', 'Charlotte', '28982', 9000.00)

Insert into EMP_DEPARTMENT
(Dept_Id, Dept_Name, Dept_City, Dept_State)
Values(1010, 'Dept Join', 'Troy', 'MI')

Insert into EMP_DEPARTMENT
(Dept_Id, Dept_Name, Dept_City, Dept_State)
Values(1011, 'Dept Join', 'Troy', 'MI')



-- 1.Join or Inner Join
SELECT Emp_ID, Emp_FName, Emp_LName, Emp_City, Emp_Sal, EDept_Id, Dept_Name, Dept_City
From EMPLOYEE
Inner Join EMP_DEPARTMENT
On Employee.EDept_Id = EMP_DEPARTMENT.Dept_Id

-- Left Join OR Left Outer Join
SELECT Emp_ID, Emp_FName, Emp_LName, Emp_City, Emp_Sal, EDept_Id, Dept_Name, Dept_City
From EMPLOYEE
Left Outer Join EMP_DEPARTMENT
On Employee.EDept_Id = EMP_DEPARTMENT.Dept_Id

--Reverse Tables

SELECT Emp_ID, Emp_FName, Emp_LName, Emp_City, Emp_Sal, EDept_Id, Dept_Name, Dept_City
From EMP_DEPARTMENT
Left Outer Join EMPLOYEE
On Employee.EDept_Id = EMP_DEPARTMENT.Dept_Id

--Right outer join
SELECT Emp_ID, Emp_FName, Emp_LName, Emp_City, Emp_Sal, EDept_Id, Dept_Name, Dept_City
From EMPLOYEE
Right Outer Join EMP_DEPARTMENT
On Employee.EDept_Id = EMP_DEPARTMENT.Dept_Id

--Reverse Tables
SELECT Emp_ID, Emp_FName, Emp_LName, Emp_City, Emp_Sal, EDept_Id, Dept_Name, Dept_City
From EMP_DEPARTMENT
Right Outer Join EMPLOYEE
On Employee.EDept_Id = EMP_DEPARTMENT.Dept_Id

-- Full Join OR Full Outer Join
SELECT Emp_ID, Emp_FName, Emp_LName, Emp_City, Emp_Sal, EDept_Id, Dept_Name, Dept_City
From EMPLOYEE
Full outer join EMP_DEPARTMENT
On Employee.EDept_Id = EMP_DEPARTMENT.Dept_Id

SELECT Emp_ID, Emp_FName, Emp_LName, Emp_City, Emp_Sal, Dept_Id, Dept_Name, Dept_City
From EMPLOYEE
Full outer join EMP_DEPARTMENT
On Employee.EDept_Id = EMP_DEPARTMENT.Dept_Id

--Reverse Tables
SELECT Emp_ID, Emp_FName, Emp_LName, Emp_City, Emp_Sal, EDept_Id, Dept_Name, Dept_City
From EMP_DEPARTMENT
Full Join EMPLOYEE
On Employee.EDept_Id = EMP_DEPARTMENT.Dept_Id

SELECT Emp_ID, Emp_FName, Emp_LName, Emp_City, Emp_Sal, EDept_Id, Dept_Name, Dept_City
From EMPLOYEE
Cross Join EMP_DEPARTMENT
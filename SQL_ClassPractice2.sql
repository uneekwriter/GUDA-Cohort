Create Table Products (Product_ID Int,Product_Name varchar(40),Supplier_ID Int,Category_ID Int,Unit Varchar(100),Price Decimal(4,2));Insert into Products (Product_ID, Product_Name,Supplier_ID,Category_ID,Unit,Price)Values (001,'Cart',1,1,'10 boxes x 20 bags',18.1),
(002,'Plastic',2,2,'24 - 12 oz bottles',19.56),
(003,'PlasticCore',1,1,'12 - 550 ml bottles', 10.10),
(004,'Foam',2,2,'48 - 6 oz jars',22.90),
(005,'FoamJar',2,2,'36 boxes',21.35),
(006,'Paper001',1,1,'12 - 12oz Dis Glass',18.34),
(007,'Paper002',2,2,'36 - 12oz Dis Glass',28.44),
(008,'Paper003',1,1,'16oz Dis Glass',20.34),
(009,'Con001',2,2,'12oz Dis container',48.34),
(010,'Con002',1,1,'32oz Dis Container',52.34),
(011,'Con003',1,3,'32oz Dis Container',16.34),
(012,'Con004',1,3,'32oz Dis Container',21.23),
(013,'Con005',1,3,'16oz Dis Container',43.23),
(014,'Con006',1,3,'12oz Dis Container',11.32),
(015,'Con007',1,3,'32oz Dis Container',17.20),
(016,'Con008',1,4,'08oz Dis Container',23.34),
(017,'Con009',1,4,'12oz Dis Container',13.76),
(018,'Con010',1,4,'32oz Dis Container',15.38)Select City, Count(Person_Id) as 'No of Residents'from PersonsGroup By CitySelect * From PersonsSelect * From Products Where Category_ID = 4 --HAVING--Retrieve no. of products by Category ID where products equal to 5Select *from ProductsWhere Category_ID = 2Select Category_ID, Count(Product_ID) as NoOfProductsFrom ProductsGroup By Category_IDHaving Count(Product_ID) = 5--Retrieve sum of price by Category ID where Price less than 60Select Category_ID, Sum(price)as SumOfPricefrom ProductsGroup By (Category_ID)Having Sum(Price) < 60--Select distinct Supplier_ID from Products--Retrieve Avg of price and count of products by Supplier ID where products are >=5Select * from ProductsSelect Supplier_ID, Count(Product_Name) As CountOfProductsfrom ProductsGroup By Supplier_IDHAVING Count(Product_Id) >  5-- INTO: Copies data into one table to other and also creates new tableSelect * Into Products_ext2From ProductsSelect * from Products_ext2Select Product_ID, Product_Name, Category_ID, PriceInto Products_Sub2From ProductsSelect * from Products_Sub2Where Category_ID = 1Select *From Products_Sub2Select *From ProductsSelect *From ProductsOrder By PriceSelect *From ProductsOrder By Price DESCSelect *From ProductsOrder By Product_Name DESCSelect *From ProductsOrder By Supplier_ID DESCSelect * From Student Order By Student_IDSelect * From Student Order By Student_ID DESCSelect * From Student Order By S_ZipSelect * From Student Order By S_Zip DESC
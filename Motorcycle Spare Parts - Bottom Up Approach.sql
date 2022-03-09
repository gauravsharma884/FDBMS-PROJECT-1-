create database Inventory ;
use Inventory ;

create TABLE Customer ( Cust_ID varchar(5) NOT NULL,
			Cust_No varchar(4) NOT NULL unique, 
			Cust_Name varchar(50), 
			Cust_Mob char(10),
			Cust_Add varchar(100),
			PRIMARY KEY (Cust_ID) 
			 ) ;

create TABLE Products ( Prod_ID char(4) NOT NULL,
			Name varchar(50),
			Quantity int,
		      	PRIMARY KEY (Prod_ID) 
			 ) ;

create TABLE Employee ( Emp_ID char(3) NOT NULL,
			Emp_Name varchar(50),
			Emp_Cont char(10),
			Emp_Position varchar(50),
			PRIMARY KEY (Emp_ID) 
			 ) ;

create TABLE Orders ( Order_ID char(5) NOT NULL,
		     Cust_Id varchar(5),
		     Prod_ID char(4),
		     Quantity int,
		     PRIMARY KEY (Order_ID),
             FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID),
             FOREIGN KEY (Prod_ID) REFERENCES Products(Prod_ID)
		     ) ;



create TABLE Transaction ( Trans_No char(4) NOT NULL,
			   Date date,
			   Order_ID char(5),
			   Cust_ID varchar(5),
			   Emp_ID char(4),
			   PRIMARY KEY (Trans_No),
               FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
               FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID),
               FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID)
			   ) ;

#Roles
#	dba
#	Senior Manager
#	Manager
#	Sales Associate
#	Sales Executive
#	Cashier

#Users creation
Create USER 'deepak'@'localhost' IDENTIFIED BY 'deepak' ;
Create USER 'neha'@'localhost' IDENTIFIED BY 'neha' ;
Create USER 'dheeraj'@'localhost' IDENTIFIED BY 'dheeraj' ;
Create USER 'harsh'@'localhost' IDENTIFIED BY 'harsh' ;
Create USER 'rajat'@'localhost' IDENTIFIED BY 'rajat' ;
Create USER 'kartik'@'localhost' IDENTIFIED BY 'kartik' ;

GRANT create, drop, select ON Inventory.* TO 'deepak'@'localhost';
GRANT select, insert, update, delete ON Inventory.* TO 'neha'@'localhost';
GRANT select, insert, update, delete ON Inventory.Customer TO 'dheeraj'@'localhost' ;
GRANT select, insert, update, delete ON Inventory.Products TO 'dheeraj'@'localhost';
GRANT select, insert, update, delete ON Inventory.Employee TO 'dheeraj'@'localhost';
GRANT select, insert, update ON Inventory.Transaction TO 'dheeraj'@'localhost';
GRANT select, insert, update ON Inventory.Orders TO 'dheeraj'@'localhost';
GRANT select, insert, update ON Inventory.* TO 'harsh'@'localhost';
GRANT select, insert, update ON Inventory.* TO 'rajat'@'localhost';
GRANT select, insert, update, delete ON Inventory.Orders TO 'kartik'@'localhost';
GRANT select, insert, update, delete ON Inventory.Transaction TO 'kartik'@'localhost';

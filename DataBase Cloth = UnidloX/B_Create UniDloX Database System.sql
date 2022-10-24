CREATE DATABASE UniDloX
GO
USE UniDloX
GO

CREATE TABLE StaffMaster(
	Staff_ID varchar(5) NOT NULL PRIMARY KEY
	CHECK (Staff_ID LIKE ('SF[0-9][0-9][0-9]')),
	StaffName varchar(255) NOT NULL,
	StaffPhone varchar(16) NOT NULL,
	StaffAddress varchar(15) NOT NULL 
	CHECK (LEN(StaffAddress) BETWEEN 10 AND 15),
	StaffDOB date NOT NULL,
	StaffGender varchar(6) NOT NULL 
	CHECK (StaffGender IN ('Male','Female')),
	StaffSalary bigint NOT NULL
)

CREATE TABLE CustomerMaster(
	 Customer_ID varchar(5) NOT NULL PRIMARY KEY
	 CHECK (Customer_ID LIKE ('CU[0-9][0-9][0-9]')),
	 CustomerName varchar(255) NOT NULL,
	 CustomerPhone varchar(16) NOT NULL,
	 CustomerAddress varchar(15) NOT NULL,
	 CustomerDOB date NOT NULL,
	 CustomerGender varchar(6) NOT NULL 
	 CHECK (CustomerGender IN ('Male','Female')),
	 CustomerEmail varchar(255) NOT NULL
	 CHECK (CustomerEmail LIKE '%@gmail.com' OR CustomerEmail LIKE '%@yahoo.com')
)

CREATE TABLE SupplierMaster(
	Supplier_ID varchar(5) NOT NULL PRIMARY KEY
	CHECK (Supplier_ID LIKE ('SU[0-9][0-9][0-9]')),
	SupplierName varchar(255) NOT NULL
	CHECK (LEN(SupplierName) > 6),
	SupplierPhone varchar(16) NOT NULL,
	SupplierAddress varchar(255) NOT NULL
)

CREATE TABLE ClothMaster(
	Cloth_ID varchar(5) NOT NULL PRIMARY KEY
	CHECK (Cloth_ID LIKE ('CL[0-9][0-9][0-9]')),
	ClothName varchar(255) NOT NULL,
	ClothStock integer NOT NULL CHECK (ClothStock BETWEEN 0 AND 250),
	ClothPrice integer NOT NULL
)

CREATE TABLE MaterialMaster(
	Material_ID varchar(5) NOT NULL PRIMARY KEY
	CHECK (Material_ID LIKE ('MA[0-9][0-9][0-9]')),
	MaterialName varchar(255) NOT NULL,
	MaterialPrice integer NOT NULL CHECK (MaterialPrice > 0)
)

CREATE TABLE PaymentMaster(
	Payment_ID varchar(5) NOT NULL PRIMARY KEY
	CHECK (Payment_ID LIKE ('PA[0-9][0-9][0-9]')),
	PaymentName varchar(255) NOT NULL
)

CREATE TABLE PurchaseTransactionHeader(
	Purchase_ID varchar(5) NOT NULL PRIMARY KEY
	CHECK (Purchase_ID LIKE ('PU[0-9][0-9][0-9]')),
	Supplier_ID varchar(5) NOT NULL FOREIGN KEY REFERENCES SupplierMaster(Supplier_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Staff_ID varchar(5) NOT NULL FOREIGN KEY REFERENCES StaffMaster(Staff_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Payment_ID varchar(5) NOT NULL FOREIGN KEY REFERENCES PaymentMaster(Payment_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Transaction_At date NOT NULL
)

CREATE TABLE PurchaseTransactionDetail(
	Purchase_ID varchar(5) NOT NULL FOREIGN KEY REFERENCES PurchaseTransactionHeader(Purchase_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Material_ID varchar(5) NOT NULL FOREIGN KEY REFERENCES MaterialMaster(Material_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Quantity integer NOT NULL
)

CREATE TABLE SalesTransactionHeader(
	Sales_ID varchar(5) NOT NULL PRIMARY KEY
	CHECK( Sales_ID LIKE ('SA[0-9][0-9][0-9]')),
	Staff_ID varchar(5) NOT NULL FOREIGN KEY REFERENCES StaffMaster(Staff_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Payment_ID varchar(5) NOT NULL FOREIGN KEY REFERENCES PaymentMaster(Payment_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Customer_ID varchar(5) NOT NULL FOREIGN KEY REFERENCES CustomerMaster(Customer_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Transaction_At date NOT NULL
)

CREATE TABLE SalesTransactionDetail(
	Sales_ID varchar(5) NOT NULL FOREIGN KEY REFERENCES SalesTransactionHeader(Sales_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Cloth_ID varchar(5) NOT NULL FOREIGN KEY REFERENCES ClothMaster(Cloth_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Quantity integer NOT NULL
)
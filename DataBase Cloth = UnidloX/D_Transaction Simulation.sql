
USE UniDloX
GO

INSERT INTO PurchaseTransactionHeader(Purchase_ID, Supplier_ID, Staff_ID, Payment_ID, Transaction_At) 
VALUES
	('PU016', 'SU005', 'SF010', 'PA007', '2022-08-30');

INSERT INTO PurchaseTransactionDetail(Purchase_ID, Material_ID, Quantity)
VALUES 
	('PU016', 'MA010', 100),
	('PU016', 'MA005', 20),
	('PU016', 'MA008', 15);

INSERT INTO SalesTransactionHeader(Sales_ID, Customer_ID, Staff_ID, Payment_ID, Transaction_At) 
VALUES
	('SA016', 'CU002', 'SF001', 'PA007', '2022-08-24');

INSERT INTO SalesTransactionDetail(Sales_ID, Cloth_ID, Quantity)
VALUES 
	('SA016', 'CL013', 15),
	('SA016', 'CL010', 5),
	('SA016', 'CL005', 80);

UPDATE ClothMaster
SET ClothStock = ClothStock - 15
WHERE Cloth_ID = 'CL013';

UPDATE ClothMaster
SET ClothStock = ClothStock - 5
WHERE Cloth_ID = 'CL010';

UPDATE ClothMaster
SET ClothStock = ClothStock - 80
WHERE Cloth_ID = 'CL005';


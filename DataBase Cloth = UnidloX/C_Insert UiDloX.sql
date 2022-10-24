USE UniDloX
GO

-- https://rawgit.com/Marak/faker.js/master/examples/browser/index.html#address

-- SELECT * FROM ClothMaster;

-- DELETE FROM ClothMaster;

INSERT INTO MaterialMaster(Material_ID, MaterialName, MaterialPrice) VALUES
	('MA001', 'Nilon 10M', 100000),
	('MA002', 'Karton 5x5', 20000),
	('MA003', 'Wol 10M', 250000),
	('MA004', 'Katun 100M', 500000),
	('MA005', 'Chiffon 10M', 88000),
	('MA006', 'Sutra 10M', 250000),
	('MA007', 'Pita 5 Meter', 8000),
	('MA008', 'Kancing 400/pack', 20000),
	('MA009', 'Pita 10M', 8000),
	('MA010', 'Jarum Sulam', 12000);

INSERT INTO ClothMaster(Cloth_ID, ClothName, ClothStock, ClothPrice) VALUES
	('CL001', 'Hitam Polos',			120,  28000),
	('CL002', 'Rugby America Team',		122,  28000),
	('CL003', 'Baju Koko Hitam',		 87,  47000),
	('CL004', 'Jeans Levis M',			 93,  30000),
	('CL005', 'Kebaya Hijau',			100,  22000),
	('CL006', 'Celana Bahan Panjang',	 48,  25000),
	('CL007', 'Seragam SD Putih-Putih', 120,  25000),
	('CL008', 'Seragam Pramuka SD',		120,  25000),
	('CL009', 'Batik Mega Mendung',		 63, 270000),
	('CL010', 'Batik Emas Surawati',	 49, 900000),
	('CL011', 'Kebaya Coklat Solo',		 49, 720000),
	('CL012', 'Selendang Kebayu',		 49, 412000),
	('CL013', 'Sanggul Jawa',			 49,  31000);

INSERT INTO SupplierMaster(Supplier_ID, SupplierName, SupplierPhone, SupplierAddress) VALUES
	('SU001', 'Abadi Jaya', '81298765432', '188 Leilani Parks'),
	('SU002', 'Tolak Maju', '98034259694', '168 Sihombing Village'),
	('SU003', 'Toko Jahit Surawati', '78010861119', '09889 Rachmawati Loop'),
	('SU004', 'Batik Nusantara', '22488167193', '34252 Christa Stream'),
	('SU005', 'Sarah Kain', '24923187030', '7984 Irfandi Skyway'),
	('SU006', 'Toko Suherman', '60028009032', '37683 Fabian Spring'),
	('SU007', 'Pasar Butik Saleman', '21246492057', '1056 Korey Dam'),
	('SU008', 'Bahan & Kancing Nusantara', '89820193220', '11437 Leola Stream'),
	('SU009', 'Suku Baju', '28511610063', '9231 Gunarto Shoals'),
	('SU010', 'Forasi Betawi', '62320494656', '961 Loren Roads');

INSERT INTO StaffMaster(Staff_ID, StaffName, StaffPhone, StaffAddress, StaffDOB, StaffGender, StaffSalary) VALUES
	('SF001', 'Shemar Nasyidah',			'8450673182', 'Lazuardi Mount', '1954-05-05','Male', 1000000),
	('SF002', 'Erin Aqila S.I.Kom',			'5854309232', 'Fujiati Hill', '1993-04-28','Female', 1200000),
	('SF003', 'Alexys Dirgantara',			'88552365200', 'Sophia Lake', '1997-12-01','Male', 500000),
	('SF004', 'Enrique Dirgantara',			'89905446937', 'Hari Station', '1971-12-02','Male', 900000),
	('SF005', 'Chasity Palastri',			'44949248114', 'Pertiwi Land', '1965-08-07','Female', 900000),
	('SF006', 'Shanelle Mustika',			'58779046181', 'Jerry Village', '1960-09-07','Female', 1000000),
	('SF007', 'Conrad Maheswara S.Psi',		'84506754469', 'Bradly Inlet', '1992-08-21','Male', 1400000),
	('SF008', 'Jon Utami',					'28993608688', 'Padma Express', '1947-07-27','Female', 1000000),
	('SF009', 'Kristofer Zulkarnain M.TI.', '53988122329', 'Simanjun Loaf', '1994-02-05','Male', 1600000),
	('SF010', 'Marisol Kahyang S.IP',		'59395383106', 'M. Mountain', '1959-08-14','Female', 1400000);

INSERT INTO PaymentMaster(Payment_ID, PaymentName) VALUES
	('PA001', 'DANA'),		 ('PA006', 'Debit Card'),
	('PA002', 'OVO'),		 ('PA007', 'Cash'),
	('PA003', 'Go-Pay'),	 ('PA008', 'Credit Card'),
	('PA004', 'Shopee-Pay'), ('PA009', 'Cryptocurrency'),
	('PA005', 'Cash'),		 ('PA010', 'Flazz');

INSERT INTO CustomerMaster(Customer_ID, CustomerName, CustomerPhone, CustomerAddress, CustomerDOB, CustomerGender, CustomerEmail) VALUES
	('CU001', 'Curtis Budiyanto S.I.Kom',	'50788293451',	'Padmasari Trail',	'1965-09-24', 'Male', 'Curtis_Budiyanto65@gmail.com'),
	('CU002', 'Davin Haryanti',				'3065923324',	'Mandy Port',		'1951-12-30', 'Female', 'Davin_Haryanti@gmail.com'),
	('CU003', 'Rowland Adhitama',			'202641986',	'Nashidin Circle',	'1959-08-06', 'Male', 'Rowland_Adhitama93@yahoo.com'),
	('CU004', 'Lorena Hutagalung',			'871185482',	'Delfina Squares',	'1992-04-01', 'Female', 'Lorena_Hutagalung52@gmail.com'),
	('CU005', 'Mawar Ardianti',				'6503412314',	'Prasti Station',	'1990-05-18', 'Female', 'Mawar.Ardianti38@yahoo.com'),
	('CU006', 'Elliot Hartanto S.Farm',		'32902739140',	'Pattie Hills',		'1945-10-11', 'Male', 'Elliot83@gmail.com'),
	('CU007', 'Hadley Elvina',				'76157455747',	'Winarno Rapid',	'1969-06-23', 'Female', 'Hadley29@yahoo.com'),
	('CU008', 'Cleo Maheswara',				'21879426368',	'Jacques Mount',	'1960-03-09', 'Male', 'Clemmie35@yahoo.com'),
	('CU009', 'Annamae Lestari',			'6292826883',	'Abigail Circle',	'1943-04-29', 'Female', 'Annamae.Lestari@gmail.com'),
	('CU010', 'Jaya Arifin',				'9656118711',	'Don Point',		'1944-08-26', 'Male', 'Jaya_Arifin@yahoo.com');

-- 8+5+2=15		-- Supplier_ID => Staff_ID, Transaction_At
INSERT INTO PurchaseTransactionHeader(Purchase_ID, Supplier_ID, Staff_ID, Payment_ID, Transaction_At) VALUES
	('PU001', 'SU001', 'SF001', 'PA001', '2022-08-24'),
	('PU002', 'SU002', 'SF001', 'PA002', '2022-08-24'),

	('PU003', 'SU003', 'SF002', 'PA002', '2022-08-21'),
	('PU004', 'SU003', 'SF003', 'PA003', '2022-08-22'),

	('PU005', 'SU004', 'SF004', 'PA004', '2022-11-22'),
	('PU006', 'SU004', 'SF005', 'PA006', '2022-08-23'),
	('PU007', 'SU004', 'SF006', 'PA005', '2022-08-25'),

	('PU008', 'SU005', 'SF007', 'PA002', '2022-08-26'),
	('PU009', 'SU005', 'SF008', 'PA009', '2022-08-27'),
	('PU010', 'SU005', 'SF009', 'PA010', '2022-08-28'),

	('PU011', 'SU006', 'SF010', 'PA008', '2022-08-28'),
	('PU012', 'SU006', 'SF002', 'PA007', '2022-08-29'),

	('PU013', 'SU007', 'SF003', 'PA004', '2022-08-29'),
	('PU014', 'SU007', 'SF004', 'PA003', '2022-08-30'),

	('PU015', 'SU008', 'SF008', 'PA001', '2022-08-24');

-- 15+10+8=33	-- Purchase_ID => Material_ID
INSERT INTO PurchaseTransactionDetail(Purchase_ID, Material_ID, Quantity) VALUES 
	('PU001', 'MA001', 120),
	('PU002', 'MA002', 200),
	('PU003', 'MA003', 100),

	('PU004', 'MA004', 200),	('PU004', 'MA006',  60),

	('PU005', 'MA005', 121),	('PU005', 'MA007',  80),	('PU005', 'MA010',  60),
	('PU006', 'MA002',  78),	('PU006', 'MA003',  92),	('PU006', 'MA006',  16),
	('PU007', 'MA001', 102),	('PU007', 'MA005', 172),	('PU007', 'MA007',  62),
	('PU008', 'MA002',  77),	('PU008', 'MA008', 319),	('PU008', 'MA009', 217),
	('PU009', 'MA004',  18),	('PU009', 'MA005', 100),	('PU009', 'MA009', 190),
	('PU010', 'MA003', 200),	('PU010', 'MA004', 210),	('PU010', 'MA010', 710),
	('PU011', 'MA004', 261),	('PU011', 'MA006', 113),	('PU011', 'MA010',   8),
	('PU012', 'MA005',  24),	('PU012', 'MA009',  08),	('PU012', 'MA010', 2022),

	('PU013', 'MA006', 100),	('PU013', 'MA010', 100),

	('PU014', 'MA007', 100),
	('PU015', 'MA008', 100);

-- 8+5+2=15		-- Customer_ID => Staff_ID, Transaction_At
INSERT INTO SalesTransactionHeader(Sales_ID, Customer_ID, Staff_ID, Payment_ID, Transaction_At) VALUES
	('SA000', 'CU001', 'SF001', 'PA001', '2021-12-15'),
	
	('SA001', 'CU002', 'SF001', 'PA007', '2021-08-24'),
	('SA002', 'CU003', 'SF002', 'PA006', '2021-08-25'),

	('SA003', 'CU004', 'SF003', 'PA002', '2021-08-26'),
	('SA004', 'CU004', 'SF004', 'PA008', '2021-08-27'),

	('SA005', 'CU005', 'SF002', 'PA003', '2021-08-28'),
	('SA006', 'CU005', 'SF005', 'PA001', '2021-08-29'),
	('SA007', 'CU005', 'SF003', 'PA002', '2021-08-30'),

	('SA008', 'CU006', 'SF007', 'PA009', '2022-08-31'),
	('SA009', 'CU006', 'SF006', 'PA010', '2022-09-01'),
	('SA010', 'CU006', 'SF010', 'PA001', '2022-08-02'),

	('SA011', 'CU007', 'SF009', 'PA005', '2022-08-03'),
	('SA012', 'CU007', 'SF008', 'PA006', '2022-08-04'),

	('SA013', 'CU008', 'SF004', 'PA007', '2022-08-05'),
	('SA014', 'CU008', 'SF002', 'PA004', '2022-08-06'),

	('SA015', 'CU009', 'SF001', 'PA004', '2022-08-07');

-- 16+10+8=34	-- Sales_ID => Cloth_ID



INSERT INTO SalesTransactionDetail(Sales_ID, Cloth_ID, Quantity) VALUES 
	('SA000', 'CL001', 25),
	('SA001', 'CL006', 21),
	('SA002', 'CL002', 200),

	('SA003', 'CL004', 82),	('SA003', 'CL002', 16),

	('SA004', 'CL013',   4),	('SA004', 'CL010',  10),	('SA004', 'CL005',  81),
	('SA005', 'CL012',  20),	('SA005', 'CL004', 200),	('SA005', 'CL006',  89),
	('SA006', 'CL005',  80),	('SA006', 'CL006', 123),	('SA006', 'CL008', 100),
	('SA007', 'CL006', 120),	('SA007', 'CL007',  80),	('SA007', 'CL008',  80),
	('SA008', 'CL009',  60),	('SA008', 'CL011',  60),	('SA008', 'CL013',  92),
	('SA009', 'CL001', 233),	('SA009', 'CL003', 111),	('SA009', 'CL005',  20),
	('SA010', 'CL002',  71),	('SA010', 'CL004',  71),	('SA010', 'CL006',  71),
	('SA011', 'CL007',   4),	('SA011', 'CL009',   4),	('SA011', 'CL011',   6),
	
	('SA012', 'CL008',   2),	('SA012', 'CL010',   1),
	
	('SA013', 'CL012',  12),
	('SA014', 'CL001',  67),
	('SA015', 'CL001',  86);



-- ALL PURCHASE TRANSACTION
SELECT th_purchase.Purchase_ID, th_purchase.Transaction_At,
	m_staff.StaffName, 
	m_supplier.SupplierName, m_payment.PaymentName,
	-- m_material.MaterialName, td_purchase.Quantity, m_material.MaterialPrice,
	-- [TotalPrice]=td_purchase.Quantity * m_material.MaterialPrice,
	[TotalPurchase]=SUM(td_purchase.Quantity * m_material.MaterialPrice)
FROM PurchaseTransactionHeader th_purchase
JOIN SupplierMaster m_supplier
	ON m_supplier.Supplier_ID = th_purchase.Supplier_ID
JOIN StaffMaster m_staff
	ON m_staff.Staff_ID = th_purchase.Staff_ID
JOIN PaymentMaster m_payment
	ON m_payment.Payment_ID = th_purchase.Payment_ID
JOIN PurchaseTransactionDetail td_purchase
	ON td_purchase.Purchase_ID = th_purchase.Purchase_ID
JOIN MaterialMaster m_material
	ON m_material.Material_ID = td_purchase.Material_ID
GROUP BY th_purchase.Purchase_ID, th_purchase.Transaction_At, m_staff.StaffName,
	m_supplier.SupplierName, m_payment.PaymentName;

-- ALL SALES TRANSACTION
SELECT th_sales.Sales_ID, th_sales.Transaction_At, 
	m_staff.StaffName,
	m_customer.CustomerName, m_payment.PaymentName,
	-- m_cloth.ClothName, td_sales.Quantity, m_cloth.ClothPrice,
	-- [TotalPrice]=td_sales.Quantity * m_cloth.ClothPrice
	[TotalSales]=SUM(td_sales.Quantity * m_cloth.ClothPrice)
FROM SalesTransactionHeader th_sales
JOIN StaffMaster m_staff
	ON m_staff.Staff_ID = th_sales.Staff_ID
JOIN CustomerMaster m_customer
	ON m_customer.Customer_ID = th_sales.Customer_ID
JOIN PaymentMaster m_payment
	ON m_payment.Payment_ID = th_sales.Payment_ID
JOIN SalesTransactionDetail td_sales
	ON td_sales.Sales_ID = th_sales.Sales_ID
JOIN ClothMaster m_cloth
	ON m_cloth.Cloth_ID = td_sales.Cloth_ID
GROUP BY th_sales.Sales_ID, th_sales.Transaction_At, m_staff.StaffName, 
	m_customer.CustomerName, m_payment.PaymentName;
USE UniDloX
GO

-- 1
SELECT sm.Staff_ID, StaffName, StaffAddress, SupplierName,
		[Total Transaction] = count(pth.Purchase_ID), Transaction_At
FROM StaffMaster sm
join PurchaseTransactionHeader pth
	on pth.Staff_ID = sm.Staff_ID
join SupplierMaster spm
	on spm.Supplier_ID = pth.Supplier_ID
WHERE month(pth.Transaction_At) = 11 and right(sm.Staff_ID, 1) % 2 = 0
GROUP BY sm.Staff_ID, StaffName, StaffAddress, SupplierName, Transaction_At
GO

-- 2
SELECT sth.Sales_ID, cm.CustomerName,
	[Total Sales Price] = sum(clm.ClothPrice*std.Quantity)
FROM CustomerMaster cm
join SalesTransactionHeader sth
	on sth.Customer_ID =  cm.Customer_ID
join SalesTransactionDetail std
	on std.Sales_ID = sth.Sales_ID
join ClothMaster clm
	on clm.Cloth_ID = std.Cloth_ID
WHERE left(CustomerName,1) = 'M'
GROUP BY sth.Sales_ID, CustomerName
HAVING sum(clm.ClothPrice*std.Quantity) > 2000000
GO

-- 3
SELECT [Month] = datename(Month, pth.Transaction_At),
	[Transaction Count] = count(pth.Purchase_ID),
	[Material Sold Count] = sum(ptd.Quantity)
FROM PurchaseTransactionHeader pth
join PurchaseTransactionDetail ptd
	on ptd.Purchase_ID = pth.Purchase_ID
join StaffMaster sm
	on sm.Staff_ID = pth.Staff_ID
WHERE datediff(year, StaffDOB, getdate()) BETWEEN 25 AND 30
GROUP BY pth.Transaction_At
GO

-- 4
SELECT cm.CustomerName, cm.CustomerEmail, cm.CustomerAddress,
	[Cloth Bought Count] = sum(std.Quantity),
	[Total Price] = 'IDR '+CAST(sum(std.Quantity*clm.ClothPrice) as varchar)
FROM CustomerMaster cm
join SalesTransactionHeader sth
	on sth.Customer_ID = cm.Customer_ID
join SalesTransactionDetail std
	on std.Sales_ID = sth.Sales_ID
join ClothMaster clm
	on clm.Cloth_ID = std.Cloth_ID
join PaymentMaster pm
	on pm.Payment_ID = sth.Payment_ID
WHERE PaymentName IN ('Cryptocurrency', 'Cash', 'Shopee-Pay')
GROUP BY cm.CustomerName, cm.CustomerEmail, cm.CustomerAddress, clm.ClothPrice;

-- 5
SELECT CAST(SUBSTRING(pth.Purchase_ID, 3, 5) AS varchar) AS [Purchase ID],
	pth.Transaction_At as [Purchase Date], StaffName, PaymentName
FROM StaffMaster sm
Join PurchaseTransactionHeader pth
	on pth.Staff_ID = sm.Staff_ID
Join PurchaseTransactionDetail ptd
	on ptd.Purchase_ID = pth.Purchase_ID
Join PaymentMaster pm
	on pm.Payment_ID = pth.Payment_ID,
	(SELECT AVG(StaffSalary) as avarage from StaffMaster) as SalaryAvarage
WHERE YEAR(pth.Transaction_At) > 1996 and sm.StaffSalary > avarage and sm.StaffGender LIKE 'Female'
GROUP BY pth.Purchase_ID, pth.Transaction_At, StaffName, PaymentName
GO

-- 6
SELECT sth.Sales_ID as [Sales ID], 
	CONVERT(varchar, sth.Transaction_At, 107) as [Sales Date], CustomerName, CustomerGender,
	std.Quantity
FROM CustomerMaster cm
Join SalesTransactionHeader sth
	on sth.Customer_ID = cm.Customer_ID
Join SalesTransactionDetail std
	on std.Sales_ID = sth.Sales_ID,
(SELECT min(Quantity) as MinAllQuantity 
FROM SalesTransactionDetail std
Join SalesTransactionHeader sth on sth.Sales_ID = std.Sales_ID
WHERE DAY(Transaction_At) = 15) as AllQuantity
WHERE (YEAR(sth.Transaction_At) = 2021) and std.Quantity < MinAllQuantity
GROUP BY sth.Sales_ID, sth.Transaction_At, CustomerName, CustomerGender, std.Quantity
GO

-- 7
SELECT pth.Purchase_ID as [Purchase ID], SupplierName, 
	STUFF(SupplierPhone, 1, 1, '+62') as [Supplier Phone], DATEPART(WEEKDAY, pth.Transaction_At) as [Purchase Date],
	[Quantity] = sum(ptd.Quantity)
FROM SupplierMaster sm
Join PurchaseTransactionHeader pth
	on pth.Supplier_ID = sm.Supplier_ID
Join PurchaseTransactionDetail ptd
	on ptd.Purchase_ID = pth.Purchase_ID,
(SELECT AVG(Quantity) as TotalAvarage FROM PurchaseTransactionDetail) as AllQuantityAvarage
WHERE (DATEPART(WEEKDAY, pth.Transaction_At) BETWEEN 5 and 7) and [Quantity] > TotalAvarage
GROUP BY pth.Purchase_ID, SupplierName, SupplierPhone, pth.Transaction_At

-- 8	(alias subquery)
SELECT TOP 1
    [CustomerName] = CONCAT(
        (CASE WHEN cm.CustomerGender = 'Male' THEN 'Mr.' ELSE 'Mrs.' END), 
        cm.CustomerName), 
    cm.CustomerPhone, cm.CustomerAddress, 
    [CustomerDOB] = FORMAT(cm.CustomerDOB, 'dd/MM/yyyy'), 
    [Cloth Count] = cl.cloths
FROM CustomerMaster cm
JOIN (
    SELECT sth.Customer_ID, 
        [cloths] = SUM(std.Quantity)
    FROM SalesTransactionDetail std
    JOIN SalesTransactionHeader sth
        ON std.Sales_ID = sth.Sales_ID
    GROUP BY sth.Customer_ID
) cl
    ON cm.Customer_ID = cl.Customer_ID
WHERE cm.CustomerName LIKE '%o%'
ORDER BY cl.cloths DESC;

-- 9
CREATE VIEW ViewCustomerTransaction AS
    SELECT cm.Customer_ID, cm.CustomerName, cm.CustomerDOB, 
        [Minimum Quantity] = min(std.Quantity),
        [Maximum Quantity] = max(std.Quantity)
    FROM CustomerMaster cm
    JOIN SalesTransactionHeader sth
        ON cm.Customer_ID = sth.Customer_ID
    JOIN SalesTransactionDetail std
        ON sth.Sales_ID = std.Sales_ID
    WHERE Year(cm.CustomerDOB) >= 2000
        AND cm.CustomerEmail LIKE '%yahoo.com'
    GROUP BY cm.Customer_ID, cm.CustomerName, cm.CustomerDOB;

SELECT * FROM ViewCustomerTransaction;

-- 10
CREATE VIEW ViewFemaleStaffTransaction AS
    SELECT [StaffID] = Staff_ID, 
        [StaffName] = UPPER(StaffName), 
        [StaffSalary] = CONCAT('Rp.', StaffSalary, ',00')
    FROM StaffMaster
    WHERE StaffGender = 'Female'
        AND StaffSalary >= (SELECT AVG(StaffSalary) FROM StaffMaster);

SELECT * FROM ViewFemaleStaffTransaction;
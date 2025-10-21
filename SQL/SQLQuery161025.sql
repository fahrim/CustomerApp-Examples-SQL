CREATE TABLE Customers (
	CustomerID	INT	PRIMARY KEY IDENTITY(1,1),
	FirstName	NVARCHAR(50)	NOT NULL,
	LastName	NVARCHAR(50)	NOT NULL,
	Email	NVARCHAR(50)	UNIQUE NOT NULL,
	PhoneNumber	NVARCHAR(20)	NULL,
	Address	NVARCHAR(255)	NULL,
	City	NVARCHAR(50) NULL,
	Country	NVARCHAR(50) NULL,
	CreatedAt	DATETIME2	DEFAULT GETDATE(),
	IsActive BIT	DEFAULT 1,
)


-- �rnek M��teri 1
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address, City, Country)
VALUES ('Melih', 'Alp�nar', 'r.melih@metin2.com', '5551234567', '�� P�nar Mah. No:3', 'Bal�kesir', 'T�rkiye');

-- �rnek M��teri 2
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address, City, Country)
VALUES ('Fahri', 'Meral', 'fahri@metin2.com', NULL, 'Pa�a Alan� Mah. No:12 D:4', 'Bal�kesir', 'T�rkiye');

-- �rnek M��teri 3
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address, City, Country)
VALUES ('Ahmet', 'Y�lmaz', 'ahmet.yilmaz@example.com', '5551234567', 'Cumhuriyet Cd. No:1', '�stanbul', 'T�rkiye');

-- �rnek M��teri 4
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address, City, Country)
VALUES ('Ay�e', 'Kaya', 'ayse.kaya@example.com', NULL, 'Atat�rk Blv. No:15 D:4', 'Ankara', 'T�rkiye');

SELECT * FROM Customers;

SELECT * FROM Customers WHERE IsActive = 1;

UPDATE Customers SET IsActive = 0 WHERE CustomerID = 3;

-- TELEFON NUMARASINI G�NCELLE/EKLE
UPDATE Customers SET PhoneNumber = 5456453372 WHERE FirstName = 'Fahri';

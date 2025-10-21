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


-- Örnek Müþteri 1
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address, City, Country)
VALUES ('Melih', 'Alpýnar', 'r.melih@metin2.com', '5551234567', 'Üç Pýnar Mah. No:3', 'Balýkesir', 'Türkiye');

-- Örnek Müþteri 2
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address, City, Country)
VALUES ('Fahri', 'Meral', 'fahri@metin2.com', NULL, 'Paþa Alaný Mah. No:12 D:4', 'Balýkesir', 'Türkiye');

-- Örnek Müþteri 3
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address, City, Country)
VALUES ('Ahmet', 'Yýlmaz', 'ahmet.yilmaz@example.com', '5551234567', 'Cumhuriyet Cd. No:1', 'Ýstanbul', 'Türkiye');

-- Örnek Müþteri 4
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address, City, Country)
VALUES ('Ayþe', 'Kaya', 'ayse.kaya@example.com', NULL, 'Atatürk Blv. No:15 D:4', 'Ankara', 'Türkiye');

SELECT * FROM Customers;

SELECT * FROM Customers WHERE IsActive = 1;

UPDATE Customers SET IsActive = 0 WHERE CustomerID = 3;

-- TELEFON NUMARASINI GÜNCELLE/EKLE
UPDATE Customers SET PhoneNumber = 5456453372 WHERE FirstName = 'Fahri';

USE [LOCAL];
GO

CREATE OR ALTER PROCEDURE [dbo].[sp_InsertCustomer]
(
	-- # PARAMS
	
	-- NOT NULL (Zorunlu) alanlar
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@Email	NVARCHAR(50),

	-- NULL (Opsiyonel) alanlar
	@PhoneNumber NVARCHAR(20) = NULL,
	@Address NVARCHAR(255) = NULL,
	@City NVARCHAR(50) = NULL,
	@Country NVARCHAR(50) = NULL
)
AS
BEGIN
	-- # BODY
	SET NOCOUNT ON;

	-- Veriyi Tabloya ekleme
	INSERT INTO [dbo].[Customers]
	(
		-- # COLUMNS
		[FirstName],
		[LastName],
		[Email],
		[PhoneNumber],
		[Address],
		[City],
		[Country]
		-- CustomerID, CreatedAt ve IsActive otomatik doluyor
	)
	VALUES
	(
		-- # VALUES
		@FirstName,
		@LastName,
		@Email,
		@PhoneNumber,
		@Address,
		@City,
		@Country
	);

	-- Ýþlemin en önemli kýsmý:
	-- Yeni oluþturulan kaydýn ID'sini seçip çaðrýya (C#) geri döndürüyoruz.
	SELECT SCOPE_IDENTITY() AS NewCustomerID;
END

GO

EXEC [dbo].[sp_InsertCustomer]
	@FirstName = 'Test',
	@LastName = 'Kullanýcýsý',
	@Email = 'test@example.com',
	@City = 'Test Þehri';


SELECT * FROM Customers;
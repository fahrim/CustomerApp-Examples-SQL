GO
-- Bu komut, sp_GetActiveCustomers ad�nda yeni bir Stored Procedure olu�turur.
CREATE OR ALTER PROCEDURE sp_GetActiveCustomers
AS
BEGIN
	-- Bu blok, SP �al��t���nda y�r�t�lecek olan koddur.
	SELECT
		CustomerID,
		FirstName,
		LastName,
		Email,
		PhoneNumber,
		Address,
		City,
		Country,
		CreatedAt,
		IsActive
	FROM
		Customers
	WHERE
		IsActive = 1;
END

EXEC sp_GetActiveCustomers;


GO

CREATE OR ALTER PROCEDURE [dbo].[sp_GetCustomerByID]
(
	-- D��ar�dan alaca��m�z parametreler burada tan�mlan�r
	-- @ ile ba�lar
	@CustomerID INT
)
AS
BEGIN
	-- G�venlik ve performans i�in bu sat�rlar� eklemek iyi bir al��kanl�kt�r.
	SET NOCOUNT ON;

	SELECT
		[CustomerID],
		[FirstName],
		[LastName],
		[Email],
		[PhoneNumber],
		[Address],
		[City],
		[Country],
		[CreatedAt],
		[IsActive]
	FROM
		[dbo].[Customers]
	WHERE
		[CustomerID] = @CustomerID; -- Gelen parametreyi ko�ul olarak kullan�yoruz.
END

GO

EXEC [dbo].[sp_GetCustomerByID] @CustomerID = 3; -- EXEC [dbo].[sp_GetCustomerByID] 3;

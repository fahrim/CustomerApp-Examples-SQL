GO
-- Bu komut, sp_GetActiveCustomers adýnda yeni bir Stored Procedure oluþturur.
CREATE OR ALTER PROCEDURE sp_GetActiveCustomers
AS
BEGIN
	-- Bu blok, SP çalýþtýðýnda yürütülecek olan koddur.
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
	-- Dýþarýdan alacaðýmýz parametreler burada tanýmlanýr
	-- @ ile baþlar
	@CustomerID INT
)
AS
BEGIN
	-- Güvenlik ve performans için bu satýrlarý eklemek iyi bir alýþkanlýktýr.
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
		[CustomerID] = @CustomerID; -- Gelen parametreyi koþul olarak kullanýyoruz.
END

GO

EXEC [dbo].[sp_GetCustomerByID] @CustomerID = 3; -- EXEC [dbo].[sp_GetCustomerByID] 3;

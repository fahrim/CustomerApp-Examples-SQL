USE [LOCAL];
GO

CREATE OR ALTER PROCEDURE [dbo].[sp_UpdateCustomer]
(
	-- # PARAMETERS
	-- Kimi güncelleyeceðimizi bilmek için ZORUNLU
	@CustomerID INT,

	-- Yeni deðerler // ilk 3 deðer artýk NULL olabilir çünkü NULL gelirse kendisini kullanacak
	@FirstName NVARCHAR(50) = NULL,
	@LastName NVARCHAR(50) = NULL,
	@Email NVARCHAR(50) = NULL,

	@PhoneNumber NVARCHAR(20) = NULL,
	@Address NVARCHAR(255) = NULL,
	@City NVARCHAR(50) = NULL,
	@Country NVARCHAR(50) = NULL
		-- CreatedAt güncellemiyoruz
		-- IsActive ayrý bir SP ile deðiþtireceðiz
)
AS
BEGIN
	-- # BODY
	SET NOCOUNT ON;

	-- Veriyi güncelliyoruz
	UPDATE [dbo].[Customers]
	SET
		-- Sihirli Kýsým:
        -- "Eðer @FirstName NULL DEÐÝLSE @FirstName'i kullan,
        --  EÐER NULL GELDÝYSE, mevcut [FirstName]'i (yani kendisini) kullan."
        [FirstName] = ISNULL(@FirstName, [FirstName]),
        [LastName] = ISNULL(@LastName, [LastName]),
        [Email] = ISNULL(@Email, [Email]),
        [PhoneNumber] = ISNULL(@PhoneNumber, [PhoneNumber]),
        [Address] = ISNULL(@Address, [Address]),
        [City] = ISNULL(@City, [City]),
        [Country] = ISNULL(@Country, [Country])
	WHERE
		[CustomerID] = @CustomerID; -- Bu ID'deki veri güncellenecek
END

GO

-- Önce mevcut veriyi gör
SELECT * FROM Customers WHERE CustomerID = 8;

-- Güncelleme iþlemini çalýþtýr
EXEC [dbo].[sp_UpdateCustomer]
    @CustomerID = 8,
    @FirstName = 'Swaggerdan2 - GÜNCELLENDÝ 2x',
    @LastName = 'Gelen2 -GÜNCELLENDÝ',
    @Email = 'swagger@guncellendi.com2';

-- Deðiþikliði kontrol et
SELECT * FROM Customers WHERE CustomerID = 7;

SELECT * FROM Customers;


GO

CREATE OR ALTER PROCEDURE [dbo].[sp_DeactivateCustomer]
    -- Kimi pasif hale getireceðimizi bilmek için ZORUNLU
    @CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Gerçek bir DELETE yerine UPDATE yapýyoruz
    UPDATE [dbo].[Customers]
    SET
        [IsActive] = 0  -- Müþteriyi pasif (false) olarak ayarla
    WHERE
        [CustomerID] = @CustomerID;
END

GO

-- Deactivate iþlemini çalýþtýr
EXEC [dbo].[sp_DeactivateCustomer] @CustomerID = 8;

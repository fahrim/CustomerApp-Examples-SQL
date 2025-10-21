USE [LOCAL];
GO

CREATE OR ALTER PROCEDURE [dbo].[sp_UpdateCustomer]
(
	-- # PARAMETERS
	-- Kimi g�ncelleyece�imizi bilmek i�in ZORUNLU
	@CustomerID INT,

	-- Yeni de�erler // ilk 3 de�er art�k NULL olabilir ��nk� NULL gelirse kendisini kullanacak
	@FirstName NVARCHAR(50) = NULL,
	@LastName NVARCHAR(50) = NULL,
	@Email NVARCHAR(50) = NULL,

	@PhoneNumber NVARCHAR(20) = NULL,
	@Address NVARCHAR(255) = NULL,
	@City NVARCHAR(50) = NULL,
	@Country NVARCHAR(50) = NULL
		-- CreatedAt g�ncellemiyoruz
		-- IsActive ayr� bir SP ile de�i�tirece�iz
)
AS
BEGIN
	-- # BODY
	SET NOCOUNT ON;

	-- Veriyi g�ncelliyoruz
	UPDATE [dbo].[Customers]
	SET
		-- Sihirli K�s�m:
        -- "E�er @FirstName NULL DE��LSE @FirstName'i kullan,
        --  E�ER NULL GELD�YSE, mevcut [FirstName]'i (yani kendisini) kullan."
        [FirstName] = ISNULL(@FirstName, [FirstName]),
        [LastName] = ISNULL(@LastName, [LastName]),
        [Email] = ISNULL(@Email, [Email]),
        [PhoneNumber] = ISNULL(@PhoneNumber, [PhoneNumber]),
        [Address] = ISNULL(@Address, [Address]),
        [City] = ISNULL(@City, [City]),
        [Country] = ISNULL(@Country, [Country])
	WHERE
		[CustomerID] = @CustomerID; -- Bu ID'deki veri g�ncellenecek
END

GO

-- �nce mevcut veriyi g�r
SELECT * FROM Customers WHERE CustomerID = 8;

-- G�ncelleme i�lemini �al��t�r
EXEC [dbo].[sp_UpdateCustomer]
    @CustomerID = 8,
    @FirstName = 'Swaggerdan2 - G�NCELLEND� 2x',
    @LastName = 'Gelen2 -G�NCELLEND�',
    @Email = 'swagger@guncellendi.com2';

-- De�i�ikli�i kontrol et
SELECT * FROM Customers WHERE CustomerID = 7;

SELECT * FROM Customers;


GO

CREATE OR ALTER PROCEDURE [dbo].[sp_DeactivateCustomer]
    -- Kimi pasif hale getirece�imizi bilmek i�in ZORUNLU
    @CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Ger�ek bir DELETE yerine UPDATE yap�yoruz
    UPDATE [dbo].[Customers]
    SET
        [IsActive] = 0  -- M��teriyi pasif (false) olarak ayarla
    WHERE
        [CustomerID] = @CustomerID;
END

GO

-- Deactivate i�lemini �al��t�r
EXEC [dbo].[sp_DeactivateCustomer] @CustomerID = 8;

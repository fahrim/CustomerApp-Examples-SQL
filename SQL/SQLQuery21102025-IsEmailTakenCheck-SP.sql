GO

CREATE OR ALTER PROCEDURE [dbo].[sp_CheckEmailExists]
(
	--
	@CustomerID INT,
	@Email NVARCHAR(50)
)
AS
BEGIN
	--
	SET NOCOUNT ON;
	
	-- Eðer bu email, @CustomerID'den farklý bir ID'de zaten mevcutsa 1 (true) döndür
	IF EXISTS (
		SELECT 1 
		FROM [dbo].[Customers]
		WHERE [Email] = @Email AND
		[CustomerID] != @CustomerID
	)
	BEGIN
		SELECT CAST(1 AS BIT); -- TRUE (Email alýnmýþ)
	END
	ELSE
	BEGIN
		SELECT CAST(0 AS BIT); -- FALSE (Alýnmamýþ-Alýnabilir)
	END
END

GO

-- Müþteri ID:1; Mail adresini "swagger@guncellendi.com" ile deðiþtirmeye çalýþýyor ancak bu email, ID:8 olan Müþteri tarafýndan kullanýlýyor.
-- # RETURN 1 (Alýnmýþ)
EXEC [dbo].[sp_CheckEmailExists] @CustomerID = 1, @Email = 'swagger@guncellendi.com';

-- Müþteri ID:1; Mail adresini "tamamen_farkli@email.com" ile deðiþtirmeye çalýþýyor ve bu email, kayýtlý baþka olmadýðý için kullanýlabilir.
-- # RETURN 0 (Kullanýlabilir)
EXEC [dbo].[sp_CheckEmailExists] @CustomerID = 1, @Email = 'tamamen_farkli@email.com';

-- Müþteri ID:7; Mail adresini "swagger@guncellendi.com" ile deðiþtirmeye çalýþýyor ancak bu email zaten kendi email adresi.
-- # RETURN 0 (Kullanýlabilir)
EXEC [dbo].[sp_CheckEmailExists] @CustomerID = 7, @Email = 'swagger@guncellendi.com';
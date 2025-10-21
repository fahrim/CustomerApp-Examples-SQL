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
	
	-- E�er bu email, @CustomerID'den farkl� bir ID'de zaten mevcutsa 1 (true) d�nd�r
	IF EXISTS (
		SELECT 1 
		FROM [dbo].[Customers]
		WHERE [Email] = @Email AND
		[CustomerID] != @CustomerID
	)
	BEGIN
		SELECT CAST(1 AS BIT); -- TRUE (Email al�nm��)
	END
	ELSE
	BEGIN
		SELECT CAST(0 AS BIT); -- FALSE (Al�nmam��-Al�nabilir)
	END
END

GO

-- M��teri ID:1; Mail adresini "swagger@guncellendi.com" ile de�i�tirmeye �al���yor ancak bu email, ID:8 olan M��teri taraf�ndan kullan�l�yor.
-- # RETURN 1 (Al�nm��)
EXEC [dbo].[sp_CheckEmailExists] @CustomerID = 1, @Email = 'swagger@guncellendi.com';

-- M��teri ID:1; Mail adresini "tamamen_farkli@email.com" ile de�i�tirmeye �al���yor ve bu email, kay�tl� ba�ka olmad��� i�in kullan�labilir.
-- # RETURN 0 (Kullan�labilir)
EXEC [dbo].[sp_CheckEmailExists] @CustomerID = 1, @Email = 'tamamen_farkli@email.com';

-- M��teri ID:7; Mail adresini "swagger@guncellendi.com" ile de�i�tirmeye �al���yor ancak bu email zaten kendi email adresi.
-- # RETURN 0 (Kullan�labilir)
EXEC [dbo].[sp_CheckEmailExists] @CustomerID = 7, @Email = 'swagger@guncellendi.com';
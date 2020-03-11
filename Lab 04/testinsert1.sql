USE Photographers
GO

CREATE PROCEDURE TestInsert1
AS
BEGIN

	DECLARE @NrOfRows INT

	DECLARE @n INT
	SELECT @n = MAX(PID) FROM Photographer
	SET @n = @n + 1

	DECLARE @pn VARCHAR(30)
	--DECLARE @by INT
	--DECLARE @wh VARCHAR(50)
	--DECLARE @wh VARCHAR(50)

	SELECT TOP 1 @NrOfRows = NoOfRows 
	FROM TestTables
	WHERE TableID = 1 AND TestID = 1

	SET @NrOfRows = @NrOfRows + @n


	WHILE @n < @NrOfRows
	BEGIN
		SET @pn = 'PeterMcKinnon' + CONVERT(VARCHAR(3), @n)
		--SET @by = 1975 + CONVERT(VARCHAR(3), @n)
		--SET @wh = 'whatever' + CONVERT(VARCHAR(3), @n)
		--SET @wh = 'whatever' + CONVERT(VARCHAR(3), @n)

		INSERT INTO Photographer(PID, PName, BirthYear) VALUES (@n, @pn, 2000)
		SET @n = @n + 1
	END

END
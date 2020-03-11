USE Photographers
GO

CREATE PROCEDURE TestDelete1
AS
BEGIN
	DECLARE @Position INT

	DECLARE @n INT
	SET @n = 0

	SELECT TOP 1 @Position = Position 
	FROM TestTables
	WHERE TableID = 1 AND TestID = 1

	DECLARE @NrOfRows INT

	SELECT TOP 1 @NrOfRows = NoOfRows 
	FROM TestTables
	WHERE TableID = 1 AND TestID = 1

	DECLARE @FinalNr INT
	SET @FinalNr = @NrOfRows + @Position


	WHILE @n < @FinalNr
	BEGIN
		DELETE FROM Photographer WHERE Photographer.PID = @n + 1
		SET @n = @n + 1
	END
END
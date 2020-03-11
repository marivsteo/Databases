USE Photographers
GO

CREATE OR ALTER PROCEDURE TestInsert2
AS
BEGIN
	DECLARE @fk INT
	SELECT TOP 1 @fk = PID FROM Photo

	DECLARE @NrOfRows INT
	SELECT  @NrOfRows = NoOfRows 
	FROM TestTables
	WHERE TableID = 2 AND TestID = 1

	DECLARE @n INT
	SELECT @n = MAX(PhotoID) FROM Photo
	SET @n = @n + 1

	SET @NrOfRows = @NrOfRows + @n

	DECLARE @description VARCHAR(30)
	DECLARE @pid INT
	DECLARE @py INT
	SET @py = 2019

	WHILE @n < @NrOfRows
	BEGIN
		INSERT INTO Photo(PhotoID, Description, PhotoYear, PID, CameraModel, CameraBrand) VALUES (@n, 'Whatever', 2019, 1, 'a6300', 'Sony')
		--SET @pid = @pid + 1
		SET @n = @n + 1
	END
END
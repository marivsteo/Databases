USE Photographers
GO

CREATE PROCEDURE TestInsert3
AS
BEGIN

	DECLARE @NrOfRows INT
	SELECT  @NrOfRows = NoOfRows 
	FROM TestTables
	WHERE TableID = 3 AND TestID = 1

	DECLARE @cm VARCHAR(20)
	DECLARE @cb VARCHaR(20)

	DECLARE @n INT
	--SELECT @n = MAX(CameraID) FROM Camera
	SET @n = 0

	SET @NrOfRows = @NrOfRows + @n

	DECLARE @cnp VARCHAR(50)

	WHILE @n < @NrOfRows
	BEGIN
		SET @cm = 'Canon' + CONVERT(VARCHAR(3),@n)
		SET @cb = 'EOS R' + CONVERT(VARCHAR(3),@n)
		INSERT INTO Camera(Model, Brand) VALUES (@cm, @cb)
		SET @n = @n + 1
	END
END
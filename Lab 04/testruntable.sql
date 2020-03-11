USE Photographers
GO

CREATE OR ALTER PROCEDURE RunTableTestsProc @param INT
AS
BEGIN
	DECLARE @ds DATETIME
	DECLARE @de DATETIME
	DECLARE @exe VARCHAR(50)
	SET @exe = 'TestInsert' + CONVERT(VARCHAR(3), @param)
	SET @ds = GETDATE()
	EXECUTE @exe
	SET @de = GETDATE()
	DECLARE @n INT
	SELECT @n = MAX(TestRunID) FROM TestRuns
	INSERT INTO TestRunTables(TestRunID, TableID, StartAT, EndAt) VALUES (@n, @param, @ds, @de)

	SET @exe = 'TestDelete' + CONVERT(VARCHAR(3), @param)
	SET @ds = GETDATE()
	EXECUTE @exe
	SET @de = GETDATE()
	--DECLARE @n INT
	--SELECT @n = MAX(TestRunID) FROM TestRuns
	INSERT INTO TestRunTables(TestRunID, TableID, StartAT, EndAt) VALUES (@n, @param, @ds, @de)
END
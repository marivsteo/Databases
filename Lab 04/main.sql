USE Photographers
GO

DECLARE @ds DATETIME
DECLARE @de DATETIME
SET @ds = GETDATE()
INSERT INTO TestRuns(Description, StartAt, EndAt) VALUES ('just do it', @ds, @ds)

EXECUTE RunViewTestsProc

--SET @de = GETDATE()
--UPDATE TestRuns
--SET EndAt = @de
--WHERE Description = 'View'

--SET @ds = GETDATE()
--INSERT INTO TestRuns(TestRunID, Description, StartAT, EndAt) VALUES (1, 'Insert', @ds, @ds)
--INSERT INTO TestRuns(TestRunID, Description, StartAT, EndAt) VALUES (2, 'Delete', @ds, @ds)

EXECUTE RunTableTestsProc 1

SET @de = GETDATE()
UPDATE TestRuns
SET EndAt = @de
WHERE Description = 'just do it' --OR Description = 'Delete'

--DBCC CHECKIDENT (TestRuns, RESEED, 0)

--SET IDENTITY_INSERT Photographers . dbo.TestRuns OFF

--DELETE FROM TestRuns

--DELETE FROM TestRunViews
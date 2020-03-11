CREATE OR ALTER PROCEDURE setVersionUp @destinationVersion INT
AS
	DECLARE @result VARCHAR(100)
	SET @result = (SELECT Version.Do 
				   FROM Version
				   WHERE Version.Number = @destinationVersion);
	EXEC @result
GO

CREATE OR ALTER PROCEDURE setVersionDown @destinationVersion INT
AS
	DECLARE @result VARCHAR(100)
	SET @result = (SELECT Version.Undo
				   FROM Version
				   WHERE Version.Number = @destinationVersion);
	EXEC @result
GO

CREATE OR ALTER PROCEDURE setVersion @destinationVersion INT
AS
	DECLARE @currentVersion INT
	SET @currentVersion = (SELECT Version.CurrentVersion
						   FROM Version
						   WHERE Version.Number = 0);
	PRINT 'Current version is: ' + CAST(@currentVersion AS VARCHAR(10)) + '. Now moving to version: ' + CAST(@destinationVersion AS VARCHAR(10)) + '.'

	IF @destinationVersion > @currentVersion
		BEGIN 
			DECLARE @nextVersionUp INT
			SET @nextVersionUp = @currentVersion + 1

			WHILE @nextVersionUp <= @destinationVersion
				BEGIN
					PRINT 'Moving up'
					EXEC setVersionUp @destinationVersion = @nextVersionUp
					SET @nextVersionUp = @nextVersionUp + 1
				END
			UPDATE Version SET Version.CurrentVersion = @destinationVersion WHERE Version.Number = 0
		END

	IF @destinationVersion < @currentVersion
		BEGIN
			DECLARE @nextVersionDown INT
			SET @nextVersionDown = @currentVersion

			WHILE @nextVersionDown > @destinationVersion
				BEGIN
					PRINT 'Moving down'
					EXEC setVersionDown @destinationVersion = @nextVersionDown
					SET @nextVersionDown = @nextVersionDown - 1
				END
			UPDATE Version SET Version.CurrentVersion = @destinationVersion WHERE Version.Number = 0
		END

	IF @destinationVersion = @currentVersion
		BEGIN
			PRINT 'Version is still ' + CAST(@currentVersion AS VARCHAR(10)) + '.'
		END
GO

EXEC setVersion @destinationVersion = 6

UPDATE Version
SET Version.CurrentVersion = 1
WHERE Version.Number = 0
USE practicalExamModel
GO

IF OBJECT_ID('RouteStations', 'U') IS NOT NULL
	DROP TABLE RouteStations

IF OBJECT_ID('Stations', 'U') IS NOT NULL
	DROP TABLE Stations

IF OBJECT_ID('Routes', 'U') IS NOT NULL
DROP TABLE Routes

IF OBJECT_ID('Trains', 'U') IS NOT NULL
	DROP TABLE Trains

IF OBJECT_ID('TrainTypes', 'U') IS NOT NULL
	DROP TABLE TrainTypes

CREATE TABLE TrainTypes
	(TTID TINYINT PRIMARY KEY IDENTITY(1,1),
	Description VARCHAR(300))


CREATE TABLE Trains
	(TID SMALLINT PRIMARY KEY IDENTITY(1,1),
	TName VARCHAR(100),
	TTID TINYINT REFERENCES TrainTypes(TTID))


CREATE TABLE Routes
	(RID SMALLINT PRIMARY KEY IDENTITY(1,1),
	RName VARCHAR(100) UNIQUE,
	TID SMALLINT REFERENCES Trains(TID))

CREATE TABLE Stations
	(SID SMALLINT PRIMARY KEY IDENTITY(1,1),
	SName VARCHAR(300) UNIQUE)

CREATE TABLE RouteStations
	(RID SMALLINT REFERENCES Routes(RID),
	SID SMALLINT REFERENCES Stations(SID),
	ArrivalTime TIME,
	DepartureTime TIME,
	PRIMARY KEY(RID, SID))
GO 

CREATE OR ALTER PROC uspStationOnRoute @Route VARCHAR(100), @Station VARCHAR(100), @Arrival TIME, @Departure TIME
AS
	DECLARE @RID INT = (SELECT RID
					FROM Routes
					WHERE RName = @Route),
			@SID INT = (SELECT SID
						FROM Stations
						WHERE SName = @Station)
	IF @RID IS NULL OR @SID IS NULL
	BEGIN
		RAISERROR ('No such station/route',16,1)
		RETURN -1
	END
	IF EXISTS (SELECT * 
				FROM RouteStations
				WHERE RID = @RID AND SID = @SID)
			UPDATE RouteStations
			SET ArrivalTime = @Arrival,
				DepartureTime = @Departure
			WHERE RID = @RID AND SID = @SID
	ELSE
		INSERT RouteStations(RID, SID, ArrivalTime, DepartureTime)
		VALUES(@RID, @SID, @Arrival, @Departure)
GO

INSERT TrainTypes VALUES ('regio'), ('interregio')
INSERT Trains VALUES ('t1', 1), ('t2',1), ('t3',1)
INSERT Stations VALUES ('s1'), ('s2'), ('s3')
INSERT Routes VALUES ('r1', 1), ('r2',2), ('r3',3)

SELECT * FROM TrainTypes

SELECT * FROM Trains

SELECT * FROM Stations

SELECT * FROM Routes

SELECT * FROM RouteStations

EXEC uspStationOnRoute 'r1', 's1', '6:10', '6:20'
EXEC uspStationOnRoute 'r1', 's2', '6:30', '6:40'
EXEC uspStationOnRoute 'r1', 's3', '6:45', '6:50'
EXEC uspStationOnRoute 'r2', 's3', '6:45', '6:50'
GO

CREATE OR ALTER VIEW ViewRouteAllStations
AS
	SELECT R.RName
	FROM Routes R
	WHERE NOT EXISTS
		(SELECT S.SID
		FROM Stations S
		EXCEPT
		SELECT RS.SID
		FROM RouteStations RS
		WHERE RS.RID = R.RID)
GO

SELECT *
FROM ViewRouteAllStations
GO 

CREATE OR ALTER FUNCTION ufFilterStationByNumRoutes (@R INT) 
RETURNS TABLE RETURN 
	SELECT S.SName
	FROM Stations S
	WHERE S.SID IN
		(SELECT RS.SID
		FROM RouteStations RS
		GROUP BY RS.SID
		HAVING COUNT(*) >= @R)
GO

SELECT * FROM RouteStations
SELECT * FROM ufFilterStationByNumRoutes(2)
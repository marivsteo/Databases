SELECT * 
FROM Cameras
WHERE Cameras.price = 1

CREATE NONCLUSTERED INDEX IDX_NCL_Cameras
ON Cameras(price)

CREATE OR ALTER VIEW ViewPhotographersCameras
AS
	SELECT P.pid AS PhotographerID, P.phrank AS RANK, J.jid AS JobID, J.price AS JobPrice
	FROM Jobs J
	--RIGHT JOIN Cameras C ON J.cid = C.cid
	INNER JOIN Photographers P ON J.pid = P.pid
	WHERE P.pid = 2
GO

CREATE NONCLUSTERED INDEX IDX_NCL_Jobs
ON Jobs(pid)

SELECT *
FROM ViewPhotographersCameras


--clustered index scan
SELECT *
FROM Photographers

--nonclustered index seek
SELECT P.phrank
FROM Photographers P
WHERE P.phrank > 2

--key lookup
SELECT *
FROM Photographers P
WHERE P.phrank = 1

--clustered index seek
SELECT *
FROM Photographers P
WHERE P.pid = 2

--nonclustered index scan
SELECT P.phrank
FROM Photographers P
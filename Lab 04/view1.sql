USE Photographers
GO

CREATE VIEW View1
AS
SELECT COUNT(P.PhotoID) AS nrOfPhotos, P.CameraBrand
FROM Photo P
INNER JOIN Photographer ph ON P.PID = ph.PID
GROUP BY P.CameraBrand
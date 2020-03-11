USE Photographers
GO

CREATE VIEW View3
AS
SELECT Ph.PName, Ph.BirthYear, C.Model, C.Brand
FROM Photo P
INNER JOIN Camera C ON C.Brand = P.CameraBrand
INNER JOIN Photographer Ph ON P.PID = Ph.PID
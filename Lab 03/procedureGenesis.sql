-- Write SQL scripts that:

-- a. modify the type of a column:


CREATE OR ALTER PROCEDURE modifyEditionYearChar
AS
PRINT 'Change type of EditionYear column to char'
ALTER TABLE Edition ALTER COLUMN EditionYear char(4)
GO

CREATE OR ALTER PROCEDURE modifyEditionYearint
AS
PRINT 'Change type of EditionYear column to int'
ALTER TABLE Edition ALTER COLUMN EditionYear INT
GO


-- b. add / remove a column:

CREATE OR ALTER PROCEDURE addColumnNrSeats
AS
PRINT 'Add NrSeats column to MainStadium table'
ALTER TABLE MainStadium ADD NrSeats INT;
GO

CREATE OR ALTER PROCEDURE removeColumnNrSeats
AS
PRINT 'Delete NrSeats column from MainStadium table'
ALTER TABLE MainStadium DROP COLUMN NrSeats;
GO


-- c. add / remove a DEFAULT constraint:


CREATE OR ALTER PROCEDURE addDefaultConstraint
AS
PRINT 'Add default constraint to StadiumName'
ALTER TABLE MainStadium
ADD CONSTRAINT Def_Cons
DEFAULT 'Olympic Stadium' for StadiumName;
GO

CREATE OR ALTER PROCEDURE removeDefaultConstraint
AS
PRINT 'Add default constraint to StadiumName'
ALTER TABLE MainStadium DROP CONSTRAINT Def_Cons;
GO


-- d. add / remove a primary key:


CREATE OR ALTER PROCEDURE addPK
AS
PRINT 'Add PK to StadiumID in MainStadium'
ALTER TABLE MainStadium
ADD CONSTRAINT PK_StadiumID PRIMARY KEY (StadiumID);
GO

CREATE OR ALTER PROCEDURE removePK
AS
PRINT 'Remove StadiumID as PK in MainStadium'
ALTER TABLE MainStadium DROP CONSTRAINT PK_StadiumID;
GO

-- e. add / remove a candidate key:


CREATE OR ALTER PROCEDURE addCandKey
AS
PRINT 'Add StadiumName as a candidate key'
ALTER TABLE MainStadium
ADD CONSTRAINT UNQ_StadiumName UNIQUE (StadiumName);
GO

CREATE OR ALTER PROCEDURE removeCandKey
AS
PRINT 'Remove StadiumName as a candidate key'
ALTER TABLE MainStadium
DROP CONSTRAINT UNQ_StadiumName;
GO

-- f. add / remove a foreign key:


CREATE OR ALTER PROCEDURE addFKey
AS
PRINT 'Add a foreign key between LocationID in Location and MainStadium'
ALTER TABLE MainStadium
ADD CONSTRAINT FK_LocationIDStadium
FOREIGN KEY (LocationID) REFERENCES Location(LID);
GO

CREATE OR ALTER PROCEDURE removeFKey
AS
PRINT 'Remove foreign key between LocationID in Location and MainStadium'
ALTER TABLE MainStadium
DROP CONSTRAINT FK_LocationIDStadium;
GO


-- g. create / remove a table:


CREATE OR ALTER PROCEDURE createTableStadium
AS
PRINT 'Creates the MainStadium Table'
CREATE TABLE MainStadium
(
	StadiumID INT NOT NULL,
	StadiumName VARCHAR(50) NOT NULL,
	LocationID INT,
)
GO


CREATE OR ALTER PROCEDURE dropTableStadium
AS
PRINT 'Drops the MainStadium Table'
DROP TABLE MainStadium
GO
DROP TABLE Version

CREATE TABLE Version
(
	Number INT PRIMARY KEY,
	Do VARCHAR(50),
	Undo VARCHAR(50),
	Description VARCHAR(80),
	CurrentVersion VARCHAR(50),
);

INSERT INTO Version VALUES
	(0,'','','Current version',1),
	(1,'','','Original DB',''),
	(2,'createTableStadium','dropTableStadium','Creates/drops the table MainStadium',''),
	(3,'addColumnNrSeats','removeColumnNrSeats','Adds/removes column NrSeats in MainStadium table',''),
	(4,'modifyEditionYearChar','modifyEditionYearInt','Modifies the type of the EditionYear column in Edition table from int to char(4)',''),
	(5,'addDefaultConstraint','removeDefaultConstraint','Adds/removes default constraint on Stadium Name: -Olympic Stadium-',''),
	(6,'addPK','removePK','Add/remove the primary key(StadiumID) from the MainStadium table',''),
	(7,'addCandKey','removeCandKey','Add/remove UNIQUE and NOT NULL from StadiumName column in MainStadium table',''),
	(8,'addFKey','removeFKey','Add/remove Foreign key between LocationID in MainStadium and Location','');

	SELECT *
	FROM Version
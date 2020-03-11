CREATE TABLE Photographer
(
	PID INT PRIMARY KEY,
	PName VARCHAR(30),
	BirthYear INT,
)


CREATE TABLE Camera
(
	Model VARCHAR(20),
	Brand VARCHAR(20),
	CONSTRAINT PK_Cameras PRIMARY KEY (Model, Brand),
)

CREATE TABLE Photo
(
	PhotoID INT PRIMARY KEY,
	Description VARCHAR(30),
	PhotoYear INT,
	PID INT NOT NULL FOREIGN KEY REFERENCES Photographer(PID),
	CameraModel VARCHAR(20) NOT NULL,
	CameraBrand VARCHAR(20) NOT NULL,
	CONSTRAINT FK_Photo FOREIGN KEY (CameraModel, CameraBrand) REFERENCES Camera (Model, Brand),
)

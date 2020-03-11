CREATE TABLE Photographers(
	pid INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
	phrank INT UNIQUE,
	name VARCHAR(30)
)


CREATE TABLE Cameras(
	cid INT IDENTITY (1,1) PRIMARY KEY,
	price INT
)



CREATE TABLE Jobs(
	jid INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
	pid INT NOT NULL REFERENCES Photographers(pid),
	cid INT NOT NULL REFERENCES Cameras(cid),
	price INT,
)

INSERT INTO Photographers VALUES (1,'peter'), (2,'matti'), (3,'alen'), (4,'chris'), (5,'jesse'), (6,'lizzie')

INSERT INTO Cameras VALUES (1), (2), (3), (4), (5), (6)


INSERT INTO Jobs VALUES (1,1,1), (2,2,2), (3,3,3), (4,4,4), (5,5,5), (6,6,6)

DROP TABLE Jobs
DROP TABLE Photographers
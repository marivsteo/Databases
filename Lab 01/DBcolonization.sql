USE SportsCompetitions;

-- insert data – for at least 4 tables; at least one statement should violate referential integrity constraints;

INSERT INTO Country VALUES ('Romania','Bucharest')
INSERT INTO Country VALUES ('New Zealand','Wellington')
INSERT INTO Country VALUES ('Turkey','Istanbul')
INSERT INTO Country VALUES ('Qatar','Doha')
INSERT INTO Country VALUES ('Greece','Athens')
INSERT INTO Country VALUES ('Japan','Tokyo')
INSERT INTO Country VALUES ('France','Paris')
INSERT INTO Country VALUES ('Switzerland','Bern')
INSERT INTO Country VALUES ('England','London')
INSERT INTO Country VALUES ('Spain','Madrid')
INSERT INTO Country VALUES ('Italy','Roma')
INSERT INTO Country VALUES ('South Africa','Cape Town')
INSERT INTO Country VALUES ('Bosnia','Sarajevo')
INSERT INTO Country VALUES ('Germany','Berlin')
INSERT INTO Country VALUES ('Sweden','Stockholm')
INSERT INTO Country VALUES ('Australia','Canberra')
INSERT INTO Country VALUES ('Russia','Moscow')


INSERT INTO Location VALUES
	('Athens',7,5),
	('Istanbul',1,3),
	('Lusail',8,4),
	('Yokohama',12,6),
	('Tokyo',33,6),
	('Wellington',2,2),
	('London',1,9),
	('Moscow',1,17),
	('Rome',1,11),
	('Saint-Denis',1,7),
	('Johannesburg',1,12),
	('Paris',1,7);
	--('Starling City',1,16);

INSERT INTO Organizer VALUES
	('UFA'),
	('FIFO'),
	('IOC'),
	('ITF'),
	('World Rugby'),
	('SANZAAR'),
	('FIA');

INSERT INTO Prize VALUES
	(2000,5000),
	(3000,15000),
	(1500,4300),
	(100000,50000000);

INSERT INTO Sponsor VALUES
	('Asics','Sports'),
	('Chevrolet','Automobiles'),
	('T--Mobile','Communications'),
	('Evonik','Industry'),
	('Nike','Sports'),
	('Puma','Sports'),
	('Philip Morris','Tobacco'),
	('Adidas','Sports'),
	('None','None'),
	('SEAT','Auto'),
	('VW','Auto'),
	('Uniqlo','Fashion'),
	('Qantas','Airlines'),
	('AIG','Insurance'),
	('Rakuten','Media');

INSERT INTO Coach VALUES
	('None',0,4),
	('Lucien Favre',50,8),
	('Sir Alex Ferguson',51,9),
	('Luis Enrique',49,10),
	('Joachim Low',43,14),
	('Ernesto Valverde',46,10),
	('Carlos Moya',51,10),
	('Ivan Ljubicic',49,13),
	('Steve Hansen',52,2),
	('Rassie Erasmus',32,12),
	('Vacant',0,4),
	('Mattia Binotto',48,11),
	('Sergi Bruguera',42,10);

INSERT INTO Sport VALUES
	('Olympics','olympics',1000),
	('Football','team',11),
	('Rugby','team',15),
	('Tennis','individual',1),
	('Racing','motorsport',1);

INSERT INTO Competition VALUES
	('Summer Olympic Games','every 4 years',3),
	('UEFA Champions League','annual',1),
	('FIFA World Cup','every 4 years',2),
	('Rugby World Cup','every 4 years',5),
	('Roland Garros','annual',4),
	('The Rugby Championship','annual',6),
	('Formula One','annual',7);


INSERT INTO Participant VALUES
	('Sweden','Country',1,9,1,15),
	('Borussia Dortmund','Club',2,4,2,14),
	('Manchester United','Club',2,2,3,9),
	('Spain','National Team',2,10,4,10),
	('Germany','National Team',2,11,5,14),
	('FC Barcelona','Club',2,15,6,10),
	('Jo-Wilfried Tsonga','Player',4,8,13,7),
	('Rafael Nadal','Player',4,5,7,10),
	('Roger Federer','Player',4,12,8,8),
	('New Zealand','National Team',3,14,9,2),
	('South Africa','National Team',3,1,10,12),
	('Australia','National Team',3,13,11,16),
	('Ferrari','Team',5,7,12,11);

INSERT INTO Edition VALUES
	(1,1896,'more',1),
	(1,2012,'more',1),
	(2,2008,'Manchester United',2),
	(2,2009,'FC Barcelona',2),
	(3,1998,'France',3),
	(3,2002,'Brazil',3),
	(4,2019,'South Africa',4),
	(4,2015,'New Zealand',4),
	(5,2018,'Rafael Nadal',1),
	(5,2019,'Rafael Nadal',1),
	(6,2017,'New Zealand',2),
	(6,2018,'New Zealand',2),
	(7,2007,'Ferrari',3),
	(7,2004,'Ferrari',3),
	(3,2010,'Spain',3);

INSERT INTO Takes_place VALUES
	(1,1,'1896-06-04'),
	(2,7,'2012-07-27'),
	(3,8,'2008-05-21'),
	(4,9,'2009-05-27'),
	(5,10,'1998-07-12'),
	(6,4,'2002-06-30'),
	(7,4,'2019-11-02'),
	(8,7,'2015-10-31'),
	(9,12,'2018-05-27'),
	(10,12,'2019-05-26'),
	(11,6,'2017-08-19'),
	(12,6,'2018-08-18'),
	(13,9,'2007-01-01'),
	(14,9,'2004-01-01'),
	(15,11,'2010-07-11');


INSERT INTO Belongs_in VALUES
	(1,1,'Multiple Sports','yes'),
	(2,2,'Groups + Knockout','yes'),
	(3,2,'Groups + Knockout',''),
	(4,3,'Groups + Knockout','yes'),
	(5,4,'Tournament Tree','yes'),
	(6,3,'Play each other','yes'),
	(7,5,'Grands prix','yes');


INSERT INTO Participates_in VALUES
	(1,'0 medals','N/A',1),
	(2,'8 medals','8 medals',1),
	(3,'Won','Won',3),
	(4,'Final','Won',3),
	(4,'Won','Won',6),
	(5,'Groups','Won',4),
	(6,'Final','Won',5),
	(7,'Semi-Finals','Won',10),
	(7,'Won','Won',11),
	(8,'Won','Won',10),
	(8,'Final','Won',12),
	(9,'Won','Won',8),
	(9,'N/A','Won',9),
	(10,'Won','Won',8),
	(10,'Semi-Finals','Won',9),
	(11,'Won','Won',10),
	(11,'Runner-Up','Won',12),
	(12,'Won','Won',10),
	(12,'Runner-Up','Won',11),
	(13,'Won','Won',13),
	(14,'Won','Won',13),
	(15,'Won','Won',4),
	(15,'Third place','Won',5);


-- update data – for at least 3 tables;

UPDATE Organizer
SET OrgName = 'UEFA'
WHERE OrgName LIKE 'UFA';


UPDATE Organizer
SET OrgName = 'FIFA'
WHERE OrgName LIKE 'FIFO';

UPDATE Prize
SET ParticipationPrize = 10000, WinnerPrize = 500000
WHERE ParticipationPrize >=10000;

UPDATE Country
SET CountryName = 'Bosnia and Herzegovina'
WHERE CountryName = 'Bosnia';

-- delete data – for at least 2 tables.

DELETE FROM Organizer;
DELETE FROM Competition;
DELETE FROM Location;
DELETE FROM Participant;
-- c. 2 queries with the difference operation; use EXCEPT and NOT IN;

-- selects the names of participants that belong to football (SportId 2) but are not national teams
SELECT PName AS 'Clubs'
FROM Participant
WHERE SportID = 2
EXCEPT
SELECT PName
FROM Participant
WHERE PType = 'National Team';

-- selects competitions that have a type that is not in the list
SELECT CompName AS 'Competitions'
FROM Belongs_in b, Competition c
WHERE b.TournamentType NOT IN ('Grands prix', 'Multiple Sports', 'Play each other') AND b.CompID = c.CompID;
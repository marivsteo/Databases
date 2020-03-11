-- f. 2 queries using the EXISTS operator to introduce a subquery in the WHERE clause;

-- selects participants that took part in the 2019 Rugby World Cup
SELECT P.PName AS 'Participants at the 2019 RWC'
FROM Participant P
WHERE EXISTS (SELECT * FROM Participates_in Pin WHERE Pin.PID = P.PID AND Pin.EditionID = 7);

-- selects organizers of every 4 years competitions 
SELECT O.OrgName AS 'Organizers of every 4 years tournaments'
FROM Organizer O
WHERE EXISTS (SELECT * FROM Competition C WHERE C.OrgID = O.OrgID AND C.CompStatus = 'Every 4 years');
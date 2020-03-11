-- g. 2 queries with a subquery in the FROM clause;

-- selects data about coaches of football teams
SELECT C.* 
FROM Coach C 
INNER JOIN (SELECT * FROM Participant P WHERE P.SportID = 2) p ON C.CoachID = p.CoachID

-- selects all info for someone who has actually won a tournament
SELECT TOP 10 PA.* 
FROM Participant PA 
INNER JOIN (SELECT * FROM Participates_in Pin WHERE Pin.Round_reached = 'Won') p ON PA.PID = p.PID
-- b. 2 queries with the intersection operation; use INTERSECT and IN;

-- selects IDs of countries that have a coach and a player
SELECT DISTINCT CountryID
FROM Coach
INTERSECT
SELECT CountryID
FROM Participant
WHERE PType = 'Player';

-- selects coach names of coaches from spain(country id 10), new zealand(2) and italy(11)
SELECT CoachName
FROM Coach 
WHERE CountryID IN (10,2,11);
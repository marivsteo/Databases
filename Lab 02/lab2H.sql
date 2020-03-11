-- h. 4 queries with the GROUP BY clause, 3 of which also contain the HAVING clause; 2 of the latter will also
-- have a subquery in the HAVING clause; use the aggregation operators: COUNT, SUM, AVG, MIN, MAX;

-- shows the number of sponsors for each domain
SELECT COUNT(S.SponsorID) AS NrOfSponsors, S.Domain
FROM Sponsor S
GROUP BY S.Domain

-- selects countries and shows the maximum nr of venues a location in that country has
SELECT L.CountryID, MAX(L.NrOfVenues) AS MaxVenues 
FROM Location L
WHERE L.NrOfVenues >= 2 
GROUP BY L.CountryID 
HAVING COUNT(*) >= 1

-- does the exact same thing but with the minium nr of venues and subquery in having clause
SELECT L.CountryID, MIN(L.NrOfVenues) AS MinVenues 
FROM Location L
WHERE L.NrOfVenues <= 15 
GROUP BY L.CountryID 
HAVING MIN(L.NrOfVenues) >= (SELECT MIN(NrOfVenues) FROM Location)

-- does something too complicated to explain
SELECT P.PrizeID, AVG(P.WinnerPrize) AS AverageWinnerPrize
FROM Prize P
WHERE P.ParticipationPrize >= 100
GROUP BY P.PrizeID
HAVING AVG(P.WinnerPrize) > (SELECT AVG(WinnerPrize) FROM Prize)
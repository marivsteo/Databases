-- e. 2 queries using the IN operator to introduce a subquery in the WHERE clause; in at least one query, the subquery should include a subquery in its own WHERE clause;

-- selects only participants that have a coach born in a country that starts with s
SELECT P.PName AS 'Name'
FROM Participant P 
WHERE P.CoachID IN 
(SELECT DISTINCT C.CoachID 
FROM Coach C 
WHERE C.CountryID IN 
(SELECT Cntry.CountryID 
FROM Country Cntry 
WHERE Cntry.CountryName LIKE 'S%' ) )

-- selects competitions and their respective years in which the winner was a rugby or a football team
SELECT DISTINCT C.CompName AS 'Competition', E.EditionYear AS 'Year'
FROM Edition E FULL JOIN Competition C ON E.CompID = C.CompID
WHERE E.Champions IN
(SELECT P.PName
FROM Participant P
WHERE P.SportID IN (2,3) )
ORDER BY E.EditionYear
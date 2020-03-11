-- i. 4 queries using ANY and ALL to introduce a subquery in the WHERE clause; 2 of them should be rewritten
-- with aggregation operators, while the other 2 should also be expressed with [NOT] IN.


-- selects competitions that only have one main sport
SELECT C.CompName
FROM Competition C
WHERE C.CompID = ANY (SELECT B.CompID FROM Belongs_in B WHERE IsMainSport = 'yes');


-- intentionally made this one so it returns nothing
SELECT P.PName
FROM Participant P
WHERE P.SponsorID = ALL (SELECT S.SponsorID FROM Sponsor S WHERE S.Domain = 'Auto');



-- selects competitions that did not have an edition in 2002
SELECT C.CompName
FROM Competition C
WHERE C.CompID = ANY (SELECT E.CompID FROM Edition E WHERE E.EditionYear <> 2002);
-- rewritten with NOT IN
SELECT C.CompName
FROM Competition C
WHERE C.CompID NOT IN (SELECT E.CompID FROM Edition E WHERE E.EditionYear = 2002);



-- selects competitions that have had an edition both in 1896 and 2012
SELECT C.CompName
FROM Competition C
WHERE C.CompID = ALL (SELECT CompID FROM Edition WHERE EditionYear = 1896 OR EditionYear = 2012);
-- same rewritten with IN
SELECT C.CompName
FROM Competition C
WHERE C.CompID IN (SELECT CompID FROM Edition WHERE EditionYear = 1896 OR EditionYear = 2012);
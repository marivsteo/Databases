-- The query will select all national teams (not player or club) that won a major tournament (over 1 mil $ winning prize
-- and hosted everty 4 years) after 2005, coached by a coach from New Zealand or Spain and sponsored by an insurance
-- company, ordered by the year they won it.


SELECT P.PName AS Name, P.PType AS Type, C.CoachName AS Coach, Cntry.CountryName AS CoachCountry,
Comp.CompName AS Competition, Comp.CompStatus AS Status, E.EditionYear AS Edition, Pin.Round_reached AS Result,
S.SponsorName AS Sponsor, S.Domain AS SponsorDomain
FROM Participant P
	FULL OUTER JOIN Participates_in Pin ON P.PID = Pin.PID
	FULL OUTER JOIN Edition E ON E.EditionID = Pin.EditionID
	FULL OUTER JOIN Competition Comp ON Comp.CompID = E.CompID
	FULL OUTER JOIN Prize Pr ON Pr.PrizeID = E.PrizeID
	FULL OUTER JOIN Coach C ON C.CoachID = P.CoachID
	FULL OUTER JOIN Sponsor S ON S.SponsorID = P.SponsorID
	FULL OUTER JOIN Country Cntry ON Cntry.CountryID = C.CountryID
		WHERE (Pin.Round_reached = 'Won'
			AND E.EditionYear >= 2005
			AND Comp.CompStatus = 'every 4 years'
			AND Pr.WinnerPrize > 1000000
			AND C.CountryID IN (SELECT C.CountryID FROM Country C WHERE C.CountryName IN ('New Zealand','Spain'))
			AND S.Domain = 'Insurance'
			AND P.PType NOT IN ('Player','Club'))
ORDER BY E.EditionYear
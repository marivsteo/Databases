-- d. 4 queries with INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN; one query will join at least 3 tables, while another one will join at least two many-to-many relationships;

-- selects competitions with their respective years and organizers
 SELECT  C.CompName AS 'Competition', E.EditionYear AS 'Year', O.OrgName AS 'Organized by'
 FROM Edition E 
 INNER JOIN Competition C ON E.CompID = C.CompID  
 INNER JOIN Organizer O ON O.OrgID = C.OrgID
 ORDER BY E.EditionYear
 

 -- selects all countries and the cities that hosted an edition
 SELECT TOP 10 C.CountryName AS 'Country', L.CityName AS 'Hosting City'
 FROM Country C 
 LEFT OUTER JOIN Location L ON L.CountryID = C.CountryID

 -- selects sponsors and the participants they sponsor
SELECT S.SponsorName AS 'Sponsor', P.PName AS 'Sponsored'  
FROM Sponsor S
RIGHT OUTER JOIN Participant P ON P.SponsorID = S.SponsorID  

-- shows for each participant the year, exact date and result (joins many to many between Takes_place and Participates_in
 SELECT Pa.PName AS 'Name', C.CompName AS 'Competition', E.EditionYear AS 'Year', T.Date AS 'Date', P.Round_reached AS 'Result'
 FROM Edition E 
 FULL OUTER JOIN Takes_place T ON T.EditionID = E.EditionID
 FULL OUTER JOIN Participates_in P ON P.EditionID = E.EditionID
 FULL OUTER JOIN Participant Pa ON Pa.PID = P.PID
 FULL OUTER JOIN Competition C ON C.CompID = E.CompID

 SELECT P.PName AS Name, P.PType AS Type, C.CoachName AS Coach, Cntry.CountryName AS CoachCountry, Comp.CompName AS Competition, Comp.CompStatus AS Status, E.EditionYear AS Edition, Pin.Round_reached AS Result, S.SponsorName AS Sponsor, S.Domain AS SponsorDomain
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
 AND Pr.WinnerPrize > 1
 AND C.CountryID IN (SELECT C.CountryID FROM Country C WHERE C.CountryName = 'New Zealand')
 AND S.Domain = 'Insurance'
 AND P.PType NOT IN ('Player','Club'))
 ORDER BY E.EditionYear
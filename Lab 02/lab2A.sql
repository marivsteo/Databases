-- a. 2 queries with the union operation; use UNION [ALL] and OR;

-- select all cities that are hosting an edition or are a capital of a country
SELECT Capital
FROM Country
UNION ALL
SELECT CityName
FROM Location;


-- select participants that are either a club or a national team
SELECT PName, PType
FROM Participant
WHERE PType = 'Club' OR PType = 'National Team';

-- selects all prizes and shows combined prizes
SELECT P.PrizeID, (P.ParticipationPrize + P.WinnerPrize) AS CombinedPrizes
FROM Prize P

-- selects all prizes and shows difference between winner and participation prizes
SELECT P.PrizeID, (P.WinnerPrize - P.ParticipationPrize) AS PrizeDifference
FROM Prize P

-- selects all prizes and shows multiplied participation prizes
SELECT P.PrizeID, (P.ParticipationPrize * 2) AS CombinedPrizes
FROM Prize P
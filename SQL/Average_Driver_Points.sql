-- average points per driver per season, used CONCAT to join first name and last name up 
-- and also 'AVG' to find the average points per driver per season 

SELECT
    CONCAT(d.forename,' ',d.surname) AS driver,
    r.year,
    AVG(res.points) AS avg_points
FROM results res
INNER JOIN races r
ON res.raceId = r.raceId
INNER JOIN drivers d
ON res.driverId = d.driverId
GROUP BY CONCAT(d.forename,' ',d.surname), r.year
ORDER BY r.year;
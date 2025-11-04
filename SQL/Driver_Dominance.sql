-- Total points by driver per season, used CONCAT to join first and last name together
SELECT    
    CONCAT(d.forename,' ',d.surname) AS Driver,    
    r.year AS Season_Year,
    SUM(res.points) AS Total_Points
FROM results res
JOIN drivers d ON res.driverId = d.driverId
JOIN races r ON res.raceId = r.raceId
GROUP BY CONCAT(d.forename,' ',d.surname),d.driverId, r.year
ORDER BY Driver, r.year;
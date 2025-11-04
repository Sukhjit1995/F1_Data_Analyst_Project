-- Relationship Between Qualifying and Finishing Positions, using 'ROUND' to get a whole number

SELECT      
    r.year AS Season_Year,
    c.name AS Team_Name,
    ROUND(AVG(res.grid), 2) AS Avg_Qualifying_Position,  
    ROUND(AVG(res.positionOrder), 2) AS Avg_Finishing_Position,
    ROUND(AVG(res.grid) - AVG(res.positionOrder), 2) AS Avg_Position_Gain
FROM results res
INNER JOIN races r
ON res.raceId = r.raceId
INNER JOIN constructors c
ON res.constructorId = c.constructorId
WHERE res.positionOrder IS NOT NULL AND res.grid > 0
GROUP BY r.year, c.name
ORDER BY r.year, Avg_Position_Gain DESC
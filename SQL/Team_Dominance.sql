-- Identify which teams have been most dominant and consistent each season.

SELECT
    r.year AS Season_Year,
    c.name AS Team_Name,
    SUM(res.points) AS Total_Points,
    AVG(res.points) AS Avg_Points_Per_Race,
    SUM(CASE WHEN res.position = 1 THEN 1 ELSE 0 END) AS Wins,
    SUM(CASE WHEN res.position <= 3 THEN 1 ELSE 0 END) AS Podiums 
FROM results res
INNER JOIN constructors c 
ON res.constructorId = c.constructorId
INNER JOIN races r
ON res.raceId = r.raceId
GROUP BY c.name, r.year
ORDER BY r.year, Total_Points DESC;
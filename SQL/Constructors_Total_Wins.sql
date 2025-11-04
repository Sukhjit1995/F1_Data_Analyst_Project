-- Constructors with the most wins - filters only race winners  (position=1)
SELECT
    c.name AS Constructor,
    r.year,
    COUNT(*) AS Wins
FROM dbo.results res
INNER JOIN dbo.constructors c ON 
res.constructorId = c.constructorId
INNER JOIN dbo.races r 
ON res.raceId = r.raceId
WHERE res.position = 1
GROUP BY c.name, r.year
ORDER BY r.year, Wins DESC;
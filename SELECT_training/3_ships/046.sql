-- Для каждого корабля, участвовавшего в сражении при Гвадалканале (Guadalcanal),
-- вывести название, водоизмещение и число орудий.

WITH All_ships AS (SELECT name, displacement, numGuns
                   FROM Classes
                            RIGHT JOIN Ships
                                       ON Classes.class = Ships.class
                   UNION ALL
                   SELECT ship, displacement, numGuns
                   FROM Classes
                            RIGHT JOIN Outcomes
                                       ON Classes.class = Outcomes.ship),

     Distinct_ships AS (SELECT name,
                               MAX(displacement) AS displacement,
                               MAX(numGuns)      AS numGuns
                        FROM All_ships
                        GROUP BY name)

SELECT name, displacement, numGuns
FROM Distinct_ships
WHERE name IN (SELECT ship
               FROM Outcomes
               WHERE battle = 'Guadalcanal')

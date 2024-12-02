-- Найдите классы, в которые входит только один корабль из базы данных (учесть также корабли в Outcomes).

WITH All_ships AS (SELECT Classes.class, name
                   FROM Classes
                            INNER JOIN Ships
                                       ON Classes.class = Ships.class
                   UNION
                   SELECT Classes.class, ship
                   FROM Classes
                            INNER JOIN Outcomes
                                       ON Classes.class = Outcomes.ship)
SELECT class
FROM All_ships
GROUP BY class
HAVING COUNT(name) = 1

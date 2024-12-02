-- Укажите сражения, в которых участвовало по меньшей мере три корабля одной и той же страны.

WITH All_ships AS (SELECT name, country
                   FROM Classes
                            INNER JOIN Ships
                                      ON Classes.class = Ships.class

                   UNION

                   SELECT ship, country
                   FROM Classes
                            INNER JOIN Outcomes
                                      ON Classes.class = Outcomes.ship)

SELECT DISTINCT o.battle
FROM Outcomes AS o
         INNER JOIN All_ships AS alls
                    ON o.ship = alls.name
GROUP BY o.battle, alls.country
HAVING COUNT(alls.name) >= 3

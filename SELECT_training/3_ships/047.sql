-- Определить страны, которые потеряли в сражениях все свои корабли.

WITH All_ships AS (SELECT country, name
                   FROM Classes
                            INNER JOIN Ships
                                       ON Classes.class = Ships.class
                   UNION
                   SELECT country, ship
                   FROM Classes
                            INNER JOIN Outcomes
                                       ON Classes.class = Outcomes.ship),

     Lethal_outcomes AS (SELECT country, ship
                         FROM All_ships
                                  INNER JOIN Outcomes
                                             ON All_ships.name = Outcomes.ship
                         WHERE result = 'sunk')

SELECT S_1.country
FROM All_ships AS S_1
GROUP BY S_1.country
HAVING NOT EXISTS (SELECT S_2.name
                   FROM All_ships AS S_2
                   WHERE S_2.country = S_1.country
                   EXCEPT
                   SELECT ship
                   FROM Lethal_outcomes
                   WHERE Lethal_outcomes.country = S_1.country)

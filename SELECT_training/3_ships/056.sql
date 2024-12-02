-- Для каждого класса определите число кораблей этого класса, потопленных в сражениях.
-- Вывести: класс и число потопленных кораблей.

WITH All_ships AS (SELECT Classes.class, name
                   FROM Classes
                            LEFT JOIN Ships
                                      ON Classes.class = Ships.class

                   UNION

                   SELECT Classes.class, ship
                   FROM Classes
                            LEFT JOIN Outcomes
                                      ON Classes.class = Outcomes.ship),

     Lethal_outcomes AS (SELECT All_ships.class,
                                CASE result
                                    WHEN 'sunk' THEN 1
                                    ELSE 0
                                    END AS is_sunk
                         FROM All_ships
                                  LEFT JOIN Outcomes
                                            ON All_ships.name = Outcomes.ship)

SELECT class, SUM(is_sunk)
FROM Lethal_outcomes
GROUP BY class

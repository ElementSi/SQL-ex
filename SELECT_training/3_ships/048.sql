-- Найдите классы кораблей, в которых хотя бы один корабль был потоплен в сражении.

WITH All_ships AS (SELECT Classes.class, name
                   FROM Classes
                            INNER JOIN Ships
                                       ON Classes.class = Ships.class
                   UNION
                   SELECT Classes.class, ship
                   FROM Classes
                            INNER JOIN Outcomes
                                       ON Classes.class = Outcomes.ship),

     Lethal_outcomes AS (SELECT All_ships.class, ship
                         FROM All_ships
                                  INNER JOIN Outcomes
                                             ON All_ships.name = Outcomes.ship
                         WHERE Outcomes.result = 'sunk')

SELECT class
FROM Classes
WHERE EXISTS (SELECT 1
              FROM Lethal_outcomes
              WHERE Lethal_outcomes.class = Classes.class)

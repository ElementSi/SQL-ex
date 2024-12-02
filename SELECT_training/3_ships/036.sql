-- Перечислите названия головных кораблей, имеющихся в базе данных (учесть корабли в Outcomes).

SELECT name
FROM (SELECT name
      FROM Classes
               INNER JOIN Ships
                          ON Classes.class = Ships.class
      WHERE Classes.class = Ships.name
      UNION
      SELECT ship
      FROM Classes
               INNER JOIN Outcomes
                          ON Classes.class = Outcomes.ship) AS All_ships
